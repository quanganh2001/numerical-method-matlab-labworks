clc;
clear;
clf;
x = 20:-1:1
x = x'

%a
y = ones(20, 1)

%b
z = x + y

%c
c = x.*y

%d
z(1) += 3;
z(5) += 3;
z(16) += 3;
z(length(z)) += 3;
z

%e
z(1) *= 6;
z(5) *= 6;
z(16) *= 6;
z(length(z)) *= 6;
z
