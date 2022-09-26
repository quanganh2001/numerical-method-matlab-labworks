% (c)2021 HP.
clc;
clear;
clf;

% f = x^2 - 9;

p = [1 0 -9]; % (f = ax^2 + bx + c)
x = roots(p)

x(1)

f = @(x) x^2 - 9;

hold on
grid on
fplot(f)
plot(x(1), f(x(1)), 'r+')
plot(x(2), f(x(2)), 'r+')
hold off
