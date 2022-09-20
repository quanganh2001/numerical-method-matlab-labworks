% ©2021 HP.
%Solve,fzero

clc;
clear;

%syms x p q
%S = solve(x^3 + p*x + q == 0, x)

%S = solve(x^3 + 3*x + 6 == 0, x)

syms x p q
S = solve(x^3 + p*32 + q == 0, x)