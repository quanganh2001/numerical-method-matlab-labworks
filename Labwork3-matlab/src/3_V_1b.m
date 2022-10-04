clc;
clear;
clf;

A = [2 1 -1; -2 -1 2; -2 1 2]
b = [8; -11; -3]

x = GaussPivot(A,b)
%x = GaussPivot_Describe(A,b)
