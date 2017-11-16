
clear all

[A, CMap] = imread('../bilder/Bilde2.png');

im = imshow(A);
axis on
A = double(A);
trDataBlue = getrectfromcoord(int16(getrect), A);
trDataRed = getrectfromcoord(int16(getrect), A);
trDataFloor = getrectfromcoord(int16(getrect), A);

% the classifiers for the three states
g1 = minErrTrain(trDataBlue);
g2 = minErrTrain(trDataRed);
g3 = minErrTrain(trDataFloor);

% segment the training picture, to show that the classifier works as expected
B = classify(A, g1, g2, g3);
figure;
imshow(B);
title('the classified picture');


% classify picture-3 to show that the trained classifiers also work on this image
[A, CMap] = imread('../bilder/Bilde3.png');
A = double(A);
B = classify(A, g1, g2, g3);
figure;
imshow(B);
title('classified picture')

[A, CMap] = imread('../bilder/Bilde1.png');

im = imshow(A);
axis on
A = double(A);
trDataBlue = getrectfromcoord(int16(getrect), A);
trDataRed = getrectfromcoord(int16(getrect), A);
trDataFloor = getrectfromcoord(int16(getrect), A);

% the classifiers for the three states
g1 = minErrTrain(trDataBlue);
g2 = minErrTrain(trDataRed);
g3 = minErrTrain(trDataFloor);

% segment the training picture, to show that the classifier works as expected
B = classify(A, g1, g2, g3);
figure;
imshow(B);
figure;
imshow(A);
title('classified picture')
fprintf('Done\n')