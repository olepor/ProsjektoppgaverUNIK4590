function [T1, T2, TD1, TD2] = datasets(filename)

delimeterIn = ' ';
headerLinesIn = 0;
filedata = importdata(filename, delimeterIn, headerLinesIn);
size(filedata);

% data = filedata.'

T = filedata(1:2:end, :).'; % extract all the odd elements as training data
TD = filedata(2:2:end, :).'; % extract all the even elements as test-data
T1 = T(:,find(T(1,:) <2)); % class one training data
T1 = T1(2:end,:); % clear out the class row
T2 = T(:, find(T(1,:) > 1)); % class two training data
T2 = T2(2:end,:);
TD1 = TD(:, find(TD(1,:) <2)); % class one test-data
TD1 = TD1(2:end,:);
TD2 = TD(:, find(TD(1,:) >1)); % class two test-data
TD2 = TD2(2:end,:);

