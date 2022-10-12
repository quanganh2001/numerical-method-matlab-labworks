% ©2021 HP.
clc;
clear;
clf;


x = [0.00000 0.78540  1.57080 2.35619 3.14159  3.92699  4.71239  5.49779  6.28319]
y = [0.00000 0.70711 1.00000 0.70711  0.00000  -0.70711  -1.00000  -0.70711  0.00000]

%pkg load optim

x1 = 3
x2 = 4.5

% method = 'nearest'
% method = 'cubic'
method = 'spline'

%y1 = interp1(x, y, x1)
%y2 = interp1(x, y, x2)

y1 = interp1(x, y, x1, method)
y2 = interp1(x, y, x2, method)
plot(x, y, 'b*',x, y, 'r-', x1, y1, 'r+', x2, y2, 'g+')
