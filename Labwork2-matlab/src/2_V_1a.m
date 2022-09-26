% (c)2021 HP.
clc;
clear;
clf;

f = @(x) log(x) - 1;

x0 = 1;
x = fzero(f,x0)
y = f(x)

hold on
ezplot(f)
plot(x, y, 'r+')

grid on
hold off

x1 = e^1
% e^(log(x)) = x = e^1

