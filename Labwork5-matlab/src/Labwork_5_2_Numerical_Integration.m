% ©2020 HP.
clc;
clear;
clf;
fprintf('\n--------------------------------------\n')
%--------------------------------------
fprintf('Labwork 5\n');
fprintf('Exercise 2: Numerical Integration\n\n');
%--------------------------------------
x = linspace(0,0.8);
x=x';
y = 0.2 + 25*x -200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
f = @(x) 0.2 + 25*x -200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
%--------------------------------------
Use = 'quadadapt'
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