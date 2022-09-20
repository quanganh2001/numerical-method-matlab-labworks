% ©2021 HP.
clc;
clear;
clf;

f_x = @(x) x+1
fplot(f_x, [-5 5], 'r-+');

grid on