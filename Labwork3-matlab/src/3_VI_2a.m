% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];

% a) Using function lu in MATLAB
[L, U] = lu(A);
d = L\B;
x = U\d
