function [] = permutecharacteristics(filename)
    
errors = zeros(3,1);
[tr_data1, tr_data2, test_data1, test_data2] = datasets(filename);

tr_data = [tr_data1 tr_data2];
test_data = [test_data1 test_data2];

nCharacteristics = size(tr_data);
nCharacteristics = nCharacteristics(1);

Pe = [1;0]; % the error rate and the index in that order

for i = 1:nCharacteristics
    error = 1;
    prms = nchoosek(1:size(tr_data1,1), i);
    bestperm = 1:i;
    % do all the permutations (doesn't matter that we use perms, because
    % combinations will simply be repeated)
    for j = 1:length(prms(:,1))
        prmsi = prms(j,:); % get the i first columns
        % permute the rows
        % permute i rows
        tr_data1p = tr_data1(prmsi, :);
        tr_data2p = tr_data2(prmsi, :);
        test_data1p = test_data1(prmsi,:);
        test_data2p = test_data2(prmsi, :);
        tmperror = errorRate(nearestNeighbour(tr_data1p, tr_data2p, test_data1p, ...
                                           test_data2p));
        % We got a new minimum-error
        if tmperror < error
            error = tmperror;
            % save the new best permutation
            bestperm = prms(j,1:i);
        end
    end
    % find the best classificator using the best permutation
    % get the best vector combination
    tr_data1i = tr_data1(bestperm, :);
    tr_data2i = tr_data2(bestperm, :);
    test_data1i = test_data1(bestperm,:);
    test_data2i = test_data2(bestperm,:);
    NNE = errorRate(nearestNeighbour(tr_data1i, tr_data2i, test_data1i, test_data2i));
    MSE = errorRate(minSquare(tr_data1i, tr_data2i, test_data1i, test_data2i));
    MECE = errorRate(minErrorRateClassifier(tr_data1i, ...
                                                      tr_data2i, test_data1i, ...
                                                      test_data2i));
    fprintf('the best permutation vectors:')
    bestperm
    NN = nearestNeighbour(tr_data1i, tr_data2i, test_data1i, test_data2i)
    NNE
    MS = minSquare(tr_data1i, tr_data2i, test_data1i, test_data2i)
    MSE
    MEC = minErrorRateClassifier(tr_data1i, ...
                                                      tr_data2i, test_data1i, ...
                                                      test_data2i)
    MECE
    % errors = [errors [NNE; MSE; MERE]]
    % errors(:,2:end)
    % fprintf('errors:')
    % errors(:,end-1)
    [M I] = min([NNE MSE MECE]);
    classifiers = [string('nearest neighbour'), string('min square error'), string('min error rate classifier')];
    fprintf('the best classifier for dimension %d is %s\n', i, classifiers(I));
end