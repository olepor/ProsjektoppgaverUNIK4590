function [] = minSquare()

[cl1, cl2, td] = datasets('ds-1.txt');

size(cl1)
size(cl2)
% Y1 = [ones(length(cl1),1) cl1.']
% Y2 = [ones(length(cl2),1) cl2.']

% Y = [ones(length([cl1 cl2]),1) cl1 cl2].'

% size(Y)

b = ones(length(td), 1);
b(find(td(1,:) >1)) = -1;

a = inv(Y.'*Y)*Y.'*b;



% g = @(x) a.'*y
