% (c)2021 Hien PHAN.
clc;
clear;
clf;


clc
clear all
close all
%%
x=[1 1]';
N = 50;
for k=1:N,
    F=[ x(1)*x(1) + x(1)*x(2) - 10 ; x(2) + 3*x(1)*x(2)*x(2) - 57];
    J=[2*x(1) + x(2), x(1) ; 3*x(2).^2, 1 + 6*x(1).*x(2)];
    dx=J\F;
    x=x-dx;
end
k
x
F1 = F(1)
F2 = F(2)

%----------------
hold on
ezplot('x1^2 + x1*x2 - 10', [0 8])
ezplot('x2 + 3*x1*x2^2 - 57', [0 8])
plot(x(1), x(2), 'ro')
title('Line Plot of y = x1^2 + x1*x2 - 10 and y = x2 + 3*x1*x2^2 - 57');
xlabel('x');
ylabel('y');
legend({'y = x_1^2 + x_1*x_2 - 10','y = x_2 + 3*x_1*x_2^2 - 57'},'Location','northeast');
grid on
hold off
