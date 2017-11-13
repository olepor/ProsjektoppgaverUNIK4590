function [TD] = trainingRectangle(img, x, y)
% returns the training data from an image using
% upper (x,y), lower(x,y), with (0,0) located top-left
    
TD = img(x(1):y(1), x(1):rb(2), :);
