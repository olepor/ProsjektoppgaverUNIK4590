function [T1, T2, TD] = datasets(filename)

delimeterIn = ' ';
headerLinesIn = 0;
filedata = importdata(filename, delimeterIn, headerLinesIn)
size(filedata)

% data = filedata.'

T = filedata(1:2:end, :).' % extract all the odd elements as training data
class_index = find(T(1,:) > 1)
class_index = class_index(1)
T1 = T(2:end, 1:class_index)
T2 = T(2:end, class_index:end)
TD = filedata(2:2:end, :).'; % extract all the even elements as test-data


