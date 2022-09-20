% ©2021 HP.
clc;
clear;
clf;
    
hold on

fplot(@(x) x+1, [-5 5], 'g-');
fplot(@(x) -x+2, [-5 5], 'r--');

title('Line Plot of y = x+1 and y = -x+2');
xlabel('-5 < x < 5');
ylabel('-5 < y < 5');
legend({'y = x+1','y = -x+2'},'Location','northeast');
grid on

hold off