% (c)2021 Hien PHAN.
clc;
clear;
clf;

f = @(x) x^2 - 9;


x0 = 0;
options = optimset('Display','iter','TolX',1e-3)
x = fzero(f,x0,options)


hold on
grid on
fplot(f)
plot(x0, f(x0), 'g+')
plot(x, f(x), 'r+')
hold off
