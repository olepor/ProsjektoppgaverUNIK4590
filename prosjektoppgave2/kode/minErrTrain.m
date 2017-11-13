function [C] = minErrTrain(tr_data1)
% Returns a classifier trained with the input data

size(tr_data1)
mu_exp1 = mean(tr_data1,2);
size(mu_exp1)

sigma_exp_i = @(X, mu) ((X-mu)*(X-mu).')/length(X); % by the column-row rule of matrix multiplication

size(sigma_exp_i)

W_i = @(X, mu_i) -(1/2)*inv(sigma_exp_i(X, mu_i));
w_i = @(X, mu_i) inv(sigma_exp_i(X, mu_i))*mu_i;
w_i0 = @(X, mu_i) -(1/2)*mu_i.'*inv(sigma_exp_i(X, mu_i))*mu_i - (1/2)* ...
        log(det(sigma_exp_i(X, mu_i))) + log(length(tr_data1)/(length(tr_data1)+ length(tr_data1))); % half of the samples are

disp('hello')
W1 = W_i(tr_data1, mu_exp1);
size(W1)
w1 = w_i(tr_data1, mu_exp1);
size(w1)
w10 = w_i0(tr_data1, mu_exp1);
size(w10)

C = @(x) x'*W1*x  + w1'*x  + w10; % The classifier trained on the input data