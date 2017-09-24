function [C] = nearestNeighbour(tr_data1, tr_data2, test_data1, test_data2)
% TODO - this classifier is wrong, need ||x-x_i||

% [tr_data1, tr_data2, test_data1, test_data2] = datasets('ds-1.txt'); % class one and two training data

tr_data = [tr_data1 tr_data2];
test_data = [test_data1 test_data2];

omega1 = zeros(2,1);
omega2 = zeros(2,1);

% create the matrix X - Xi for all i
% get the distance to every training vector
for i =1:length(tr_data)
    % inner product with itself on the diagonals
    D = (tr_data - test_data(:,i)).'*(tr_data - test_data(:,i));
    d = diag(D);
    [M I] = min(d); % get the indices of the minimum values
    % classify vector i
    if i < length(tr_data1)
        if I <= length(tr_data1)
            % correct classification of class one
            omega1 = omega1 + [1;0];
        else
            omega1 = omega1 + [0;1];
        end
    else
        if I > length(tr_data1)
            omega2 = omega2 + [0;1];
        else
            omega2 = omega2 + [1;0];
        end
    end
end

C = [omega1 omega2];