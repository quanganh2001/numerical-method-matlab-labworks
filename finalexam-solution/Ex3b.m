clc;
clear;
%b
%%
fprintf('Part b: Use the forward difference formula to differentiate the function f(x)\n')
f = @(x) 2 + x^2 + exp(2*x+1)

fprintf('Choose x0 = 1.41')
x0 = 1.41;
h = 0.1
fprintf('With step 0.1.\ndf(x)/dx=(f(xi+1)-f(x))/h\nResult: ')

df = (f(x0+h)-f(x0))/h

h = 0.01
fprintf('With step 0.01.\ndf(x)/dx=(f(xi+1)-f(x))/h\nResult:')
df=(f(x0+h)-f(x0))/h;
disp(df)