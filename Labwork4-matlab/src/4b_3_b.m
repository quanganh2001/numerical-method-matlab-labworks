clc;
clear;
clf;

a = 140
b = 180

A1 = a + (b-a).*rand(1, 100);
A2 = a + (b-a).*randn(1, 100);

a1 = mean(A1)
a2 = mean(A2)

b1 = var(A1)
b2 = var(A2)

c1 = std(A1)
c2 = std(A2)

mean = 170
std = 30

B = std.*randn(1, 200) + mean
