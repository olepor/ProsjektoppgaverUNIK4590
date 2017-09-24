function [C] = minSquare(tr_data1, tr_data2, test_data1, test_data2)

% [tr_data1, tr_data2, test_data1, test_data2] = datasets('ds-1.txt');

tr_data = [tr_data1 tr_data2]; % Concatenate the training data into one vector
test_data = [test_data1 test_data2]; % ditto

Y = [ones(length(tr_data),1) tr_data.'];

b = ones(length(tr_data), 1); % create a vector the size of b, consisisting
                              % of ones
b(find(tr_data(1,:) >1)) = -1; % fill in all the -1's

a = (Y.'*Y)\Y.'*b;

g = a.'*Y.'; % Do all the classifications in one go

C1 = zeros(2,1);
class1 = find(g>=0);
class2 = find(g<0);

% misclassifications of class one
C1(2) = length(class1(class1 > length(tr_data1)));
C1(1) = length(tr_data1) - C1(2);

C2 = zeros(2,1);
% misclassifications of class two
C2(1) = length(class2(class2 < length(tr_data1)));
C2(2) = length(tr_data2) - C2(1);

C = [C1 C2];


