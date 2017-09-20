
[tr_data1, tr_data2, test_data1, test_data2] = datasets('ds-1.txt');

tr_data = [tr_data1 tr_data2];
test_data = [test_data1 test_data2];

nCharacteristics = size(tr_data);
nCharacteristics = nCharacteristics(1);

Pe = [1;0]; % the error rate and the index in that order


for i = 1:nCharacteristics
    error = 1;
    prms = perms(1:i);
    % do all the permutations
    tr_datai = tr_data(1:i, :); % only keep the first i characteristics
    test_datai = test_data(1:i,:);
    tr_data1i = tr_data1(1:i, :);
    tr_data2i = tr_data2(1:i, :);
    test_data1i = test_data1(1:i,:);
    test_data2i = test_data2(1:i,:);
    for j = 1:length(prms)
        % permute the rows
        tr_datai(prms(j,:), :);
        test_datai(prms(j,:),:);
        tr_data1p = tr_data1i(prms(j,:),:);
        tr_data2p = tr_data2i(prms(j,:),:);
        test_data1p = test_data1i(prms(j,:),:);
        test_data2p = test_data2i(prms(j,:),:);
        error = errorRate(nearestNeighbour(tr_data1p, tr_data2p, test_data1p, ...
                                           test_data2p));
        % We got a new minimum-error, rerun all the classificators
        if error < Pe(1)
            % minError
            %minsSquare
        end
    end
end