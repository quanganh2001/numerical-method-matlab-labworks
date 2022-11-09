%d
clc;
clear;
fprintf('Part d: Write a script file to solve equation sqrt(x) - x + 1 = 0 using solve function\n')
syms x
f = sqrt(x) - x + 1
r = solve(f,x)
fprintf('Numerical soluton: ')
disp(double(r))