% (c)2021 HP.
clc;
clear;
clf;

f = @(x) tan(x + 2*pi/3) - 3; % angle is in radian

x0 = [2 3];
x = fsolve(f,x0)
%x = fzero(f,x0)
y = f(x)

hold on
ezplot(f)
plot(x, y, 'r+')

grid on
hold off
