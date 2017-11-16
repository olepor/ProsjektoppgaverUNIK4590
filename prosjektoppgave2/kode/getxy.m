function [x y] = getxy(rect)
    
x = [rect(1); rect(1)+rect(3)];
y = [rect(2); rect(2)+rect(4)];