% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];


% d) Using function mylup.m
[L3, U3, P3] = mylup(A);


B3 = P3*B
d3 = L3\B3;
x3 = U3\d3
