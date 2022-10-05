clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2]
b = [8; -11; -3]

A1 = inv(A) * b

x = mldivide(A, b)

x = A\b
