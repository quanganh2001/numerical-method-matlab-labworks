% (c)2021 Hien PHAN.
clc;
clear;
clf;

Student = {"Lan Anh", "Van Toan", "Quang Hai", "Xuan Truong", "Cong Phuong", "Huyen My", "My Linh", "Duc Chinh", "Phan Van Duc"}
Weight = [40 63 62 68 64 45 50 66 67]
JHI = [1450 3817 3708 4300 3950 1896 2339 4200 4312]
VanLam = 72

f1 = fit(Weight, JHI, 'poly2') %works only in Matlab
func = @(x) f(1)*x^2 + f(2)*x + f(3)

hold on
grid on
fplot(func, [20 80]);
plot(Weight, JHI, 'b*');
plot(VanLam, func(VanLam), '+');
fprintf('Predicted JHI number of Van Lam: %f', func(VanLam));
hold off
