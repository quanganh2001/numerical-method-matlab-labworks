% (c)2021 Hien PHAN.
clc;
clear;
clf;

Student = {"Lan Anh", "Van Toan", "Quang Hai", "Xuan Truong", "Cong Phuong", "Huyen My", "My Linh", "Duc Chinh", "Phan Van Duc"}
Weight = [40 63 62 68 64 45 50 66 67]
JHI = [1450 3817 3708 4300 3950 1896 2339 4200 4312]
VanLam = 72

c1 =  @(f, x) f(1)*x + f(2);

pkg load optim
a1 = lsqcurvefit(c1, [2;3], Weight, JHI)

func1 = @(x) a1(1)*x+a1(2)
figure(1)
hold on
grid on
plot(Weight, JHI, 'b*');
fplot(func1, [20 80]);
plot(VanLam, func1(VanLam), 'r+');
fprintf('Predicted JHI number of Van Lam: %f', func1(VanLam));
hold off




% second order

c2 = @(f,x) f(1)*x.^2+f(2)*x+f(3)

pkg load optim
a2 = lsqcurvefit(c2, [2;3;4], Weight, JHI)

func2 = @(x) a2(1)*x.^2+a2(2)*x+a2(3)

figure(2)
hold on
grid on
plot(Weight, JHI, 'b*');
fplot(func2, [20 80]);
plot(VanLam, func2(VanLam), 'r+');
fprintf('Predicted JHI number of Van Lam: %f', func2(VanLam));
hold off
