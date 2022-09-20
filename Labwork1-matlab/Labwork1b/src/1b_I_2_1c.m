% ©2021 HP.
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