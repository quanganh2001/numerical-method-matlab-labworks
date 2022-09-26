% (c)2021 Hien PHAN.
clc;
clear;
clf;

f = @(x) x^2 - 9;


x0 = -2;
options = optimset('Display','iter'); % Show iterations
x = fzero(f,x0,options)

hold on
grid on
fplot(f)
plot(x0, f(x0), 'g+')
plot(x, f(x), 'r+')
hold off
