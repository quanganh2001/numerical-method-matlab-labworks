% (c)2021 HP.
clc;
clear;
clf;


x0 = [1.5 3.5]';
es = 0.05;
maxit = 5000;
[x,f,ea,iter]=newtmult(@root2,x0,es,maxit)
fprintf('- x = %f\n', x);
fprintf('- f = %f\n', f);
fprintf('- approximate relative error (%%) = %f\n', ea);
fprintf('- number of iterations = %d\n', iter);

%-------------
hold on
ezplot('x1^2 +x1*x2 - 10', [0 8])
ezplot('x2 +3*x1*x2^2 - 57', [0 8])
plot(x(1), x(2), 'ro')
title('Line Plot of y = x_1^2 +x_1*x_2 - 10 and y = x_2 +3*x_1*x_2^2 - 57');
xlabel('x');
ylabel('y');
legend({'y = x_1^2 +x_1*x_2 - 10','y = x_2 +3*x_1*x_2^2 - 57'},'Location','northeast');
grid on
hold off
