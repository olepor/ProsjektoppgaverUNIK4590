function [C] = classify(img, g1, g2, g3)

C = zeros(size(img));

colours = [255 0 0; 0 255 0; 0 0 255]; % red-green-blue

for x = 1:length(img(1,:,:))
    for y = 1:length(img(:,1,:))
        % classify
        xlocal = img(y,x,:);
        xlocal = reshape(xlocal, 3,1);
        blue = g1(xlocal);
        red = g2(xlocal);
        floor = g3(xlocal);
        [~, I] = max([red floor blue]); % I is the index of the maxval
        C(y,x, :) = colours(:,I); % colour the classified vector
    end
end