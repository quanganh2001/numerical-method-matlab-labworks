% ©2021 HP.
clc;
clear;
clf;

f = @(x) x^10 - 1;
df = @(x) 9*x^9;
%--------------------------------------
x0 = 0.5;
step = 40;
e0 = 10^(-8);
%--------------------------------------
xk = x0;
xkValue = [];
err = x0;
i = 0;
while err>=e0
    fprintf('\nStep = %d\n',i);
    xk1 = xk-f(xk)/df(xk);
    fprintf('x(k+1) = %f\n',xk1);
    fprintf('f(x(k+1)) = %f\n',f(xk1));
    err1 = abs((xk-xk1)/xk);
    err = err1;
    fprintf('err = abs((xk-xk1)/xk) = %e\n', err);
    xkValue = [xkValue; xk1 f(xk1)];
    xk = xk1;
    i+=1;
end


%--------------------------------------
%GRAPHIC ANIMATION
animate = 1;
%--------------------------------------
grid on
hold on
scale = 0.01;
xl = xk-xk*scale;
xu = xk+xk*scale;
fplot(f, [xl xu]);
%fplot(df, [xl xu]);
plot(xk, 0, 'r+');
leg = sprintf('x0: (%f, 0)',xk);
xlabel('x');
ylabel('y');
legend({'f = @(x) x^10 - 1',leg},'Location','northeast');
%--------------------------------------
%disp(xkValue);
if animate == 1
    for it=1:i-1
        if xkValue(it,2)<=xkValue(it,1)
            fprintf('%d: [xk f(xk)] = [%f %f]', it, xkValue(it,1), xkValue(it,2));
            plot(xkValue(it,1),xkValue(it,2));
            pause(0.5);
        end
    end
end
hold off