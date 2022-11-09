% ©2020 HP.
clc;
clear;
clf;
fprintf('\n--------------------------------------\n')
%--------------------------------------
fprintf('Exercise 3c: Calculate the integral of f(x) from 0 to 0.8: f(x) = 2 + 25x - x^2\n\n');
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