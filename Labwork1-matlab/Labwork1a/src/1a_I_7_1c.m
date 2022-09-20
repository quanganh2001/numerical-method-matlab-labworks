% ©2021 HP.
clc;
clear;
clf;
    
hold on

fplot(@(x) x+1, [-5 5], 'g');

pause(2);

fplot(@(x) -x+2, [-5 5], 'r');
grid on

hold off