% ©2021 HP.
%Solve,fzero

clc;
clear;
clf;

%syms x
%S = fsolve(67*x + 32 == 0, x)

fnc = @(x) 67*x + 32
S = fzero(y, 10)

hold on
fplot(y, 'r')
plot(S, y(S), 'b+')
grid on
hold off