function [C] = minErrorRateClassifier()
% TODO - take in the datafile, and output -- what?

[tr_data1, tr_data2, test_data1, test_data2] = datasets('ds-1.txt'); % class1 and 2 training data

mu_exp1 = (sum(tr_data1.')/length(tr_data1)).'; % returns the sum as a column vector
mu_exp2 = (sum(tr_data2.')/length(tr_data2)).';

sigma_exp_i = @(X, mu) ((X-mu)*(X-mu).')/length(X); % by the column-row rule of matrix multiplication

W_i = @(X, mu_i) -(1/2)*inv(sigma_exp_i(X, mu_i));
w_i = @(X, mu_i) inv(sigma_exp_i(X, mu_i))*mu_i;
w_i0 = @(X, mu_i) -(1/2)*mu_i.'*inv(sigma_exp_i(X, mu_i))*mu_i - (1/2)* ...
        log(det(inv(sigma_exp_i(X, mu_i)))) + (1/2); % half of the samples are

% Train the classifiers
W1 = W_i(tr_data1, mu_exp1);
W2 = W_i(tr_data2, mu_exp2);
w1 = w_i(tr_data1, mu_exp1);
w2 = w_i(tr_data2, mu_exp2);
w10 = w_i0(tr_data1, mu_exp1);
w20 = w_i0(tr_data2, mu_exp2);

g_i = @(X, W_i, w_i, w_i0, mu_i, i) X(:,i).'*W_i*X(:,i) + w_i.'*X(:,i) + ...
      w_i0;
g1 = @(i) g_i(test_data1, W1, w1, w10, mu_exp1, i); % i is the index into the X matrix
g2 = @(i) g_i(test_data2, W2, w2, w20, mu_exp2, i);

g = @(x_index) g1(x_index) - g2(x_index);

g1x = @(x) x.'*W1*x + w1.'*x + w10;
g2x = @(x) x.'*W2*x + w2.'*x + w20;

C1 = zeros(2,1);
for i = 1:length(test_data1)

    if g1x(test_data1(:,i)) - g2x(test_data1(:,i)) > 0
        C1(1) = C1(1) + 1;
    else
        C1(2) = C1(2) + 1;
    end
end

C2 = zeros(2,1);
for i = 1:length(test_data2)
    if g1x(test_data2(:,i)) - g2x(test_data2(:,i)) > 0
        C2(1) = C2(1) + 1;
    else
        C2(2) = C2(2) + 1;
    end
end

C = [C1 C2];