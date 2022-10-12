% ©2020 HP.
clc;
clear;
clf;
pkg load optim
fprintf('\n--------------------------------------\n')
fprintf('Labwork 4: V. CURVE FITTING PROBLEMS\n');
fprintf('EXERCISE 4\n');
fprintf('\n--------------------------------------\n\n')
x = -3:1:3
y = -3:1:3
meshgrid(x,y)
z = peaks(x,y)
fprintf('\n--------------------------------------\n\n')
xi = 1.2
yi = 2.8
zi = interp2(x, y, z, xi, yi)
figure
surf(x,y,z)
title('xi = 1.2; yi = 2.8');
fprintf('\n--------------------------------------\n\n')
xi = 2.5
yi = 2.5
zi = interp2(x, y, z, xi, yi)
figure
surf(x,y,z)
title('xi = 2.5; yi = 2.5');
