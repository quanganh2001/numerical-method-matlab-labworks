% ©2020 HP.
clc;
clear;
clf;
pkg load optim
fprintf('\n--------------------------------------\n')
fprintf('Labwork 4b: Non-linear regression\n');
fprintf('\n--------------------------------------\n\n')
P = [0.985 1.108 1.363 1.631]
V = [25000 22200 18000 15000]
R = 82.05
T = 303
x = V;
y = P;
f = @(a) PVSSR(a, x, y)
options = optimset('Display', 'iter');
a = fminsearch(f, [10 10], options)
f(a)
hold on
grid on
yp=R*T*(1+a(1)./x+a(2)./x.^2)./x;
plot(x, yp, 'b.')
hold off
