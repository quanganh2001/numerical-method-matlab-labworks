% ©2021 HP.
%Use the function symsum to calculate

clc;
clear;

syms k n; 

F = symsum (1/k - 1/(k+1), k, 1, n)