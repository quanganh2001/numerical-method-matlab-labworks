% ©2021 HP.
clc;
clear;
clf;


func = @(x) x^2-2;

xl = 1;
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
fplot(func, [xl xu]);
plot(root, 0, 'r+');
leg = sprintf('Square root of x: (%f, 0)',root);
xlabel('x');
ylabel('y');
legend({'y = x^2-2',leg},'Location','northeast');
%--------------------------------------
RootValue = [];
if animate == 1
    for maxit=1:11
        [root,fx,ea,iter]=bisection(func,xl,xu,es,maxit);
        RootValue = [RootValue;root];
    end
    for maxit=1:11
        fprintf('Root value = %f', RootValue(maxit));
        plot(RootValue(maxit), 0);
        pause(0.5);
    end
end
hold off
