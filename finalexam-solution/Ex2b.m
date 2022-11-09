clc;
fprintf('Part b: Use the function newtraph.m to find the root of the function y = x^2 - AAA where is the last 3 digits of your student ID.');
func = @(x) x^2 - 2;
dfunc = @(x) 2*x;
xr = 11;
es = 0.0002;
maxit = 10;
disp('root of the function x^2 - 2:');
[root,ea,iter]=newtraph(func,dfunc,xr,es,maxit)