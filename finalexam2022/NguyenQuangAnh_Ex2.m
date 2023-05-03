clc;
clear;

% curve fitting function
fprintf('Part a: Determine an equation using curve fitting in Matlab to predict the metabolism rate as a function of mass based on the following data. Use it to predict the metabolism rate of a 200kg tiger\n');
mass = [400 70 45 2 0.3 0.16];
metabolism = [270 82 50 4.8 1.45 0.97];

% Fitting Line to data
p = polyfit(mass,metabolism,1);

% Using this polynomial
% Interpolating to get metabolism for mass = 200 kg
tiger_meta = polyval(p,200);
fprintf('\n Metabolism of 200kg tiger = %.3f Waits\n',tiger_meta);

% Ploting the fitted line and data to see how well data is fitted
% (Not part of problem Just for testing)
plot(mass,metabolism,'*')
hold on
plot(mass,polyval(p,mass))
legend(["Data Points","Fited Line"],'Location','Best') % Setting legene
xlabel("Mass [kg]");
ylabel("Metabolism [watt]");
grid on

% use newtraph.m
fprintf('Part b: Use the function newtraph.m to find the root of the function y = x^2 - AAA where is the last 3 digits of your student ID.');
func = @(x) x^2 - 2;
dfunc = @(x) 2*x;
xr = 11;
es = 0.0002;
maxit = 10;
disp('root of the function x^2 - 2:');
[root,ea,iter]=newtraph(func,dfunc,xr,es,maxit)

% compute using for statement
fprintf('Part c: compute 1 - 1/3 + 1/5 - 1/7 + 1/9 - ... - 1/1003\n')
sum = 0;
for k=1:4:1001
    sum=sum+1/k;
end
for k=3:4:1003
    sum=sum-1/k;
end
fprintf('sum is: ')
disp(sum)

% solve linear equation using inv, mldivide and lu method
fprintf('Part d: Solve the system of linear equation using 3 methods: inv, mldivide, and lu.\n');
A = [1 -2 3; -1 3 -1; 2 -5 5];
B = [9; -6; 17];

% inv method
fprintf('inv method\n');
y = A\B
fprintf('y = \n');
disp(y);

% mldivide method
fprintf('mldivide method');
s = mldivide(A,B);
fprintf('s = \n');
disp(s);

% lu methods
fprintf('lu method\n');
[L, U] = lu(A);
d = L\B;
x = U\d
