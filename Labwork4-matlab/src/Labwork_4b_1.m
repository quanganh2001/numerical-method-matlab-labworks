% ©2020 HP.
clc;
clear;
clf;
pkg load optim
fprintf('\n--------------------------------------\n')
fprintf('Labwork 4b: Linear regression\n');
fprintf('EXERCISE 1\n');
fprintf('--------------------------------------\n\n')

Mass = [400 70 45 2 0.3 0.16]
Metabolism = [270 82 50 4.8 1.45 0.97]
choice = "c2"
if choice == "a"
    hold on
    grid on
    [ a0,a1,r2 ] = linear_regression( Mass, Metabolism )
    xi = [120 260 350]
    y = a0 + a1*xi
    plot(xi, y, 'r+')
    hold off
elseif choice == "c1"
    f = polyfit(Mass, Metabolism, 1)
    func = @(x) f(1)*x + f(2)
    p = [f(1) f(2)]
    xi = [120 260 350]
    y = polyval(p, xi)
    hold on
    grid on
    fplot(func, [0, 450]);
    plot(Mass, Metabolism, 'g.');
    plot(xi, y, 'r+')
    hold off
elseif choice == "c2"
    f = polyfit(Mass, Metabolism, 2)
    func = @(x) f(1)*x^2 + f(2)*x +f(3)
    p = [f(1) f(2) f(3)]
    xi = [120 260  350]
    y = polyval(p, xi)
    hold on
    grid on
    fplot(func, [0, 450]);
    plot(Mass, Metabolism, 'g.');
    plot(xi, y, 'r+')
    hold off
end
