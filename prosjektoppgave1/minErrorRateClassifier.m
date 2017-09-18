function [E,R] = minErrorRateClassifier()

[cl1, cl2, test_data] = datasets('ds-1.txt'); % class1 and 2 training data

s1 = size(cl1);
s2 = size(cl2);

mu_exp_1 = (sum(cl1.')/s1(2)).' % returns mu as a column vector
mu_exp_2 = (sum(cl2.')/s2(2)).'

sigma_exp_i = @(X, mu) (X-mu)*(X-mu).'/length(X) % by the column-row rule of matrix multiplication

W_i = @(X, mu_i) -(1/2)*inv(sigma_exp_i(X, mu_i))
w_i = @(X, mu_i) inv(sigma_exp_i(X, mu_i))*mu_i
w_i_0 = @(X, mu_i) -(1/2)*mu_i.'*inv(sigma_exp_i(X, mu_i))*mu_i - (1/2)* ...
        log(det(inv(sigma_exp_i(X, mu_i)))) + log(Pw)

