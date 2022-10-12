% (c)2021 Hien PHAN.
clc;
clear;
clf;

Student = {"Lan Anh", "Van Toan", "Quang Hai", "Xuan Truong", "Cong Phuong", "Huyen My", "My Linh", "Duc Chinh", "Phan Van Duc"}
Weight = [40 63 62 68 64 45 50 66 67]
JHI = [1450 3817 3708 4300 3950 1896 2339 4200 4312]
VanLam = 72

%f = polyfit(Weight, JHI, 2)
%func = @(x) f(1)*x^2 + f(2)*x + f(3)

f = polyfit(Weight, JHI, 1)
func1 = @(x) f(1)*x + f(2)

figure(1)
hold on
grid on
fplot(func1, [20 80]);
plot(Weight, JHI, 'b*');
plot(VanLam, func1(VanLam), '+');
fprintf('Predicted JHI number of Van Lam: %f\n', func1(VanLam));
hold off


%--------------

f = polyfit(Weight, JHI, 2)
func2 = @(x) f(1)*x^2 + f(2)*x + f(3)


figure(2)
hold on
grid on
fplot(func2, [20 80]);
plot(Weight, JHI, 'b*');
plot(VanLam, func2(VanLam), '+');
fprintf('Predicted JHI number of Van Lam: %f\n', func2(VanLam));
hold off
