function [N] = normalizeMatrix(img)
% Normalize the values RGB
for i = 1:3
    img(:,:,i) = img(:,:,i)./sum(img,3);
end
N = img;