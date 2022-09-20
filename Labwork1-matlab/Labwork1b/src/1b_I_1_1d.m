% ©2021 HP.
%Solve,fzero

clc;
clear;
clf;

%syms x
%S = solve(exp(x) == 8*x - 4, x)

fnc = @(x) exp(x) - 8*x + 4;
S = fzero(y, 1)

%------------------
hold on

fplot(@(x) exp(x), [-1 2], 'b');
fplot(@(x) 8*x - 4, [-1 2], 'r');
plot(S ,exp(S), 'ro')
grid on

hold off