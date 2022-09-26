% (c)2021 HP.
clc;
clear;
clf;

f = @(x) sin(x) - 0.12; %angle is in radian

x0 = [-pi/2 pi/2];
x = fzero(f,x0)
%x = fsolve(f,x0)
y = f(x)

hold on
ezplot(f)
plot(x, y, 'r+')

grid on
hold off
