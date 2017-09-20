function [C] = nearestNeighbour(tr_data1, tr_data2, test_data1, test_data2)
% TODO - this classifier is wrong, need ||x-x_i||

% [tr_data1, tr_data2, test_data1, test_data2] = datasets('ds-1.txt'); % class one and two training data

tr_data = [tr_data1 tr_data2];
test_data = [test_data1 test_data2];

a = test_data - tr_data;

% Dm = a.'*a
% size(Dm)

D = test_data.'*tr_data;

[M I] = min(D.'); % transpose because min takes the minimum value of each column

omega2 = find(I> length(tr_data1)); % gives the indexes of vectors classified as
                          % belonging to class two
omega1 = find(I < length(tr_data1));

% if the elements of class two is less than the length of the first training
% set, then it is misclassified
C2 = zeros(2,1);
C2(1) = length(omega2(omega2< length(tr_data1)));
C2(2) = length(tr_data2) - C2(1);

% same, but for class one the elements that are bigger will be misclassified
C1 = zeros(2,1);
C1(1) = length(omega1(omega1 > length(tr_data1)));
C1(2) = length(tr_data1) - C1(1);

C = [C1 C2];
