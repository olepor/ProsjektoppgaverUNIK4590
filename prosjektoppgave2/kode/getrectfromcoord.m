function [Rect] = getrectfromcoord(v, A)

[x y] = getxy(v);
Rect = A(y(1):y(2), x(1):x(2), :);

S = size(Rect);
Rect = reshape(Rect, [S(1)*S(2), S(3)])';