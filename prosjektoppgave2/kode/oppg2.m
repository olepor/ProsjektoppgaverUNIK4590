
clear all

[A, CMap] = imread('../bilder/Bilde2.png');

imagesc(A);

A = double(A);

A(1,1,:)
% Normalize the values RGB
% A = normalizeMatrix(A);


% We only need the first two values, the third is redundant after normalising
% A = A(:,:,1:2);

size(A)

% Select the traning-data regions from the photo
% From Picture-2 we choose blue region ((300, 370),(460,370))
trDataBlue = A(350:550, 350:550, :);
% trDataRed = trainingRectangle(A, [820; 270], [960; 270]);
% trDataFloor = trainingRectangle(A, [700; 580], [1000; 580]);
% size(trDataBlue)

% flatten the matrix to a column vector of RGB-values
S = size(trDataBlue)

% TODO - use imread('picture', 'PixelRegion', {[x,y], [x,y]})
trDataBlue = reshape(trDataBlue, [S(1)*S(2), S(3)])';
trDataRed = A(210:310, 810:950, :);
S = size(trDataRed);
trDataRed = reshape(trDataRed, [S(1)*S(2), S(3)])';
size(trDataRed)

trDataFloor = A(600:700, 750:850, :);
S = size(trDataFloor);
trDataFloor = reshape(trDataFloor, [S(1)*S(2), S(3)])';
size(trDataFloor)

% the classifiers for the three states
g1 = minErrTrain(trDataBlue);
g2 = minErrTrain(trDataRed);
g3 = minErrTrain(trDataFloor);

% segment the training picture, to show that the classifier works as expected

B = zeros(size(A));
% make the picture into a vector
S = size(A);
% A = reshape(A, [S(1)*S(2), S(3)]);
% A = A(810, 210);

colours = [255 0 0; 0 255 0; 0 0 255]; % red-green-blue

for x = 1:length(A(1,:,:))
    for y = 1:length(A(:,1,:))
        % classify
        xlocal = A(y,x,:);
        xlocal = reshape(xlocal, 3,1);
        blue = g1(xlocal);
        red = g2(xlocal);
        floor = g3(xlocal);
        [~, I] = max([red floor blue]); % I is the index of the maxval
        B(y,x, :) = colours(:,I); % colour the classified vector
    end
end

imagesc(B);
