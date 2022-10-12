% ©2020 HP.
clc;
clear;
clf;

x = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0]
%x = linspace(0.1, 1, 10)
y = [1.6781 1.5711 1.4771 1.3945 1.3220 1.2584 1.2025 1.1535 1.1104 1.0725]
func = @(t) exp(-t*x)+0.8-y
x0 = 3;

pkg load optim
t = lsqnonlin(func,x0)

hold on
grid on
plot(x, y, 'b*');
plot( x, exp(-t*x)+0.8,'r-');
hold off
legend('Data','Best fit')
xlabel('x')
ylabel('exp(-tx)+0.8')
