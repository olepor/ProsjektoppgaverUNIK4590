function [Pe] = errorRate(C)
%% Takes the confusion matrix, and returns the error rate

Pw1 = (C(1,1) + C(2,1))/sum(sum(C));
Pw2 = 1 - Pw1;

Pew1 = C(2,1)/sum(C(:,1));
Pew2 = C(1,2)/sum(C(:,2));

Pe = Pw1*Pew1 + Pw2*Pew2;