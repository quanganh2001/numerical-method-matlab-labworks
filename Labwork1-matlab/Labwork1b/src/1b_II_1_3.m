% (c)2021 HP.
clc;
clear;
clf;


func = @(x) x^2 + 2*x -3;

xl = 0.5;
xu = 2;
es = 0.05;
maxit = 100;

[root,fx,ea,iter]=bisection(func,xl,xu,es,maxit);
fprintf('- real root = %f\n', root);
fprintf('- function value at root = %f\n', fx);
fprintf('- approximate relative error (%%) = %f\n', ea);
fprintf('- number of iterations = %d\n', iter);


%--------------------------------------
%GRAPHIC ANIMATION
animate = 1;
%--------------------------------------
grid on
hold on
i = iter;
fplot(func, [xl xu]);
plot(root, 0, 'r+');
leg = sprintf('Square root of x: (%f, 0)',root);
xlabel('x');
ylabel('y');
legend({'x^2 + 2*x -3',leg},'Location','northeast');
%--------------------------------------
RootValue = [];
if animate == 1
    for maxit=1:i
        [root,fx,ea,iter]=bisection(func,xl,xu,es,maxit);
        RootValue = [RootValue;root];
    end
    for maxit=1:i
        maxit
        fprintf('Root value = %f', RootValue(maxit));
        plot(RootValue(maxit), func(RootValue(maxit)));
        pause(1.5);
    end
end
hold off