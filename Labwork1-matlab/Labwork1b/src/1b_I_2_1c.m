% ©2021 HP.
 % Use plot to graph the following functions: y = e^{-x/2} and y = x^4 - x^2 for -1.5 <= x <= 1.5 (on the same set of axes).
clc;
clear;
clf;

hold on

%fplot(@(x) e^(-x/2), [-1.5 1.5]);
%fplot(@(x) x^4 - x^2, [-1.5 1.5]);

fplot(@(x) e^(-x/2), [-1.5 1.5]);
fplot(@(x) x^4 - x^2, [-1.5 1.5]);
grid on
hold off
