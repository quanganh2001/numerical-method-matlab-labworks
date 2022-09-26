% (c)2021 HP.
clc;
clear;
clf;


x0 = [0,0]
options=optimset('Display','iter');
[x,fval,exitflag,funcCount,jacobian] = fsolve(@root2d,x0,options)


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
