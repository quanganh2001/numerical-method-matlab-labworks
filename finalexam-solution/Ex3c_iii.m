% Matlab program for Gauss-Quadrature 2-Point Formula
clc;
clear all;
disp('OUTPUT:');
E=input('Enter f(x):','s');
f=inline(E);
a=input('Enter lower limit:');
b=input('Enter upper limit:');
w1=1;w2=1;z1=-1/sqrt(3);z2=1/sqrt(3);
x1=(b-a)/2*z1+(b+a)/2;
x2=(b-a)/2*z2+(b+a)/2;
I=(b-a)/2.0*(w1*f(x1)+w2*f(x2));
fprintf('Integration of given function is=%f\n',I);