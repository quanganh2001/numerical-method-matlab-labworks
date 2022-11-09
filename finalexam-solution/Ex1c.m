clc;
clear;
%c
fprintf('Part c\n')
x=0:1:30
y = @(x) 2*x + 5
fprintf('Value of y of x = 0, 1, 2, ... , 30: ')
disp(y(x))
plot(x,y(x),'b+')