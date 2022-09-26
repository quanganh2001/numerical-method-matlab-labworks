% (c)2021 HP.
clc;
clear;
clf;

f = @(x) e.^x - 15;

x0 = 1;
x = fzero(f,x0)
y = f(x)

hold on
ezplot(f)
plot(x, y, 'r+')

grid on
hold off
% log(e.^x) = x = log(15)
