﻿% ©2021 HP.
% Write a function that solves the quadratic equation ax^2 + bx + c = 0
clc;
clear;

function [x1 x2] = quadratic(a, b, c)
    D = b^2-4*a*c;
    x1 = (-b - sqrt(D))/(2*a);
    x2 = (-b + sqrt(D))/(2*a);
end
    
a = 1;
b = 2;
c = -3;
[x1 x2] = quadratic(a, b, c)