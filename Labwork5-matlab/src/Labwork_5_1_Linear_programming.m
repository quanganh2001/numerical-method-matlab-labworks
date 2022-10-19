% ©2020 HP.
clc;
clear;
clf;
fprintf('\n--------------------------------------\n')
%--------------------------------------
fprintf('Labwork 5\n');
fprintf('Exercise 1: Linear programming\n\n');
%--------------------------------------
% Demonstrate with graphical solution
x = linspace(0, 6);
y1 = (4*x - 12);
y2 = (4 - x);
y3 = ((10-2*x)/5);
%ytop = min([y1; y2; y3]);
[u, v] = meshgrid(linspace(0,6),
linspace(0,6));
hold on;
plot(x, y1, 'r', 'LineWidth', 2)
plot(x, y2, 'r', 'LineWidth', 2);
plot(x, y3, 'r', 'LineWidth', 2);
contour(u,v, 5*u + 2*v, 25);
axis([0 6 0 6]);
hold off;
