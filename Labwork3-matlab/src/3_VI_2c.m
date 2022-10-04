% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];



% c) Using function LU_nopivot
%[L2, U2, P2] = LU_nopivot(A);
[L2, U2, P2] = LU_nopivot_Describe(A);

B2 = P2*B
d2 = L2\B2;
x2 = U2\d2
