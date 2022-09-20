% ©2021 HP.
% Use plot to graph the following functions: y = x^3 - x for -4 <= x <= 4
clc;
clear;
clf;

fplot(@(x) x^3 - x, [-4 4]) ;
grid on
