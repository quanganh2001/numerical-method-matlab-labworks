% (c)2021 HP.
clc;
clear;
clf;

f = @(x) x^2 - 9;

x0 = -2;
x = fzero(f,x0)

hold on
grid on
fplot(f)
plot(x0, f(x0), 'g+')
plot(x, f(x), 'r+')
hold off
