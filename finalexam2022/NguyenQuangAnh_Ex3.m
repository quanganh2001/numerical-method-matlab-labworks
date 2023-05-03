clc;
clear;

% Determine the heat capacity c at 100 degrees using fit() and polyfit() function
fprintf('Determine the heat capacity c at 100 degrees using fit() and polyfit() function\n')
fprintf('Part a');
T=[-50 -30 0 60 90 110]; 
c=[1270 1280 1350 1480 1580 1700]; 
c0=100;

%% fit function
fprintf('Part i: Use fit function');
f=fit(T',c','poly1')
func=@(x) f.p1*x+f.p2
figure 
hold on
grid on
box on
fplot(func, [-50 110],'k')
plot(T',c','b*','LineWidth',2);
plot(c0, func(c0), 'r*', 'LineWidth',2);
legend('T', 'c', '100','Location', 'northwest')
hold off
fprintf('the heat capacity c at 100oC');
func(c0)
fprintf('Part ii: Use polyfit function');
%% polyfit function
f=polyfit(T,c,2);
func=@(x) f(1)*x^2+f(2)*x+f(3)
figure 
hold on
grid on
box on
fplot(func, [-50 110],'k')
plot(T',c','b*','LineWidth',2);
plot(c0, func(c0), 'r*', 'LineWidth',2);
legend('T', 'c', '100','Location', 'northwest')
hold off
fprintf('the heat capacity c at 100oC');
func(c0)

fprintf('Part iii: Use function');
d=@(f,x) f(1)*x+f(2);
a=lsqcurvefit(d,[2;3],T,c);
figure 
hold on
grid on
box on
fplot(func, [-50 110],'k')
plot(T',c','b*','LineWidth',2);
plot(c0, func(c0), 'r*', 'LineWidth',2);
legend('T', 'c', '100','Location', 'northwest')
hold off
fprintf('the heat capacity c at 100oC');
func(c0)

% forward difference formula
fprintf('Part b: Use the forward difference formula to differentiate the function f(x)\n')
f = @(x) 2 + x^3 + exp(2*x+1)

fprintf('Choose x0 = 1.41')
x0 = 1.41;
h = 0.1
fprintf('With step 0.1.\ndf(x)/dx=(f(xi+1)-f(x))/h\nResult: ')

df = (f(x0+h)-f(x0))/h

h = 0.01
fprintf('With step 0.01.\ndf(x)/dx=(f(xi+1)-f(x))/h\nResult:')
df=(f(x0+h)-f(x0))/h;
disp(df)

% Calculate the integral AAA + 25x - x^2
fprintf('Part c: Calculate the integral f(x) from 0 to 0.8: f(x) = AAA + 25x - x^2, where AAA is the last 3 digit of student ID\n');

fprintf('\nPart b\n')
%--------------------------------------
fprintf('Exercise 3c: Calculate the integral of f(x) from 0 to 0.8 (trapz function): f(x) = 2 + 25x - x^2\n\n');
%--------------------------------------
x = linspace(0,0.8);
x=x';
y = 2 + 25*x - x.^2;
f = @(x) 2 + 25*x - x.^2;
%--------------------------------------
Use = 'trapz'
if strcmp(Use,'trapz')>0
  Q = trapz(x,y)
elseif strcmp(Use,'cumtrapz')>0
  Q = cumtrapz(x,y)
elseif strcmp(Use,'quad')>0
  Q = quad(f, 0, 0.8)
elseif strcmp(Use,'quadadapt')>0
  Q = quadadapt(f,0,0.8, 5)
end
%--------------------------------------
hold on
grid on
plot(x, f(x), 'r-')
%xlim([-1 2])
%ylim([-10 10])
plot(x(1:length(Q)), Q, 'g.');
%--------------------------------------
hold off

fprintf('\nPart b\n')
%--------------------------------------
fprintf('Exercise 3c: Calculate the integral of f(x) from 0 to 0.8 (quad function): f(x) = 2 + 25x - x^2\n\n');
%--------------------------------------
x = linspace(0,0.8);
x=x';
y = 2 + 25*x - x.^2;
f = @(x) 2 + 25*x - x.^2;
%--------------------------------------
Use = 'quad'
if strcmp(Use,'trapz')>0
  Q = trapz(x,y)
elseif strcmp(Use,'cumtrapz')>0
  Q = cumtrapz(x,y)
elseif strcmp(Use,'quad')>0
  Q = quad(f, 0, 0.8)
elseif strcmp(Use,'quadadapt')>0
  Q = quadadapt(f,0,0.8, 5)
end
%--------------------------------------
hold on
grid on
plot(x, f(x), 'r-')
%xlim([-1 2])
%ylim([-10 10])
plot(x(1:length(Q)), Q, 'g.');
%--------------------------------------
hold off
