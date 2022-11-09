clc
clear all
close all
fprintf('Solve the system of linear equation using inv and mldivide in Matlab\n')
%%
A = [2 1 4; 1 2 -5; 3 -2 -4];
B = [10; 1; 8];
%
% x = naiv_gauss(A,B)
% mldivide method

y = A\B
fprintf("y = \n");
disp(y);
% inv method

inverse = inv(y);
fprintf("inverse = \n");
disp(inverse);