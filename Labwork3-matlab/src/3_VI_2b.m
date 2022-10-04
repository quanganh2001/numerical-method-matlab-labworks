% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];


% b) Using function LU_pivot
%[L1, U1, P1] = LU_pivot(A);
[L1, U1, P1] = LU_pivot_Describe(A);

B1 = P1*B
d1 = L1\B1;
x1 = U1\d1
