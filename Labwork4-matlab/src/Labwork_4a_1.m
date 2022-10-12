% ©2020 HP.
clc;
clear;
clf;
fprintf('\n--------------------------------------\n')
fprintf('Labwork 4: V. CURVE FITTING PROBLEMS\n');
fprintf('EXERCISE 1\n');
fprintf('--------------------------------------\n\n')

Student = {"Lan Anh", "Van Toan", "Quang Hai", "Xuan Truong", "Cong Phuong", "Huyen My", "My Linh", "Duc Chinh", "Phan Van Duc"}
Weight = [40 63 62 68 64 45 50 66 67]
JHI = [1450 3817 3708 4300 3950 1896 2339 4200 4312]
VanLam = 72
fprintf('--------------------------------------\n\n')
Order = 1
fprintf('--------------------------------------\n\n')
if Order==1
    fprintf('Polyfit 1st order\n');
    f = polyfit(Weight, JHI, 1)
    func = @(x) f(1)*x + f(2)
    hold on
    grid on
    fplot(func, [20 80]);
    plot(Weight, JHI, 'g.');
    plot(VanLam, func(VanLam), 'r+');
    fprintf('Predicted JHI number of Van Lam: %f', func(VanLam));
    hold off
elseif Order == 2
    fprintf('--------------------------------------\n\n')
    fprintf('Polyfit 2nd order\n');
    f = polyfit(Weight, JHI, 2)
    func = @(x) f(1)*x^2 + f(2)*x + f(3)
    hold on
    grid on
    fplot(func, [20 80]);
    plot(Weight, JHI, 'g.');
    plot(VanLam, func(VanLam), 'r+');
    fprintf('Predicted JHI number of Van Lam: %f', func(VanLam));
    hold off
elseif Order == 3
    fprintf('--------------------------------------\n\n')
    fprintf('Polyfit 3rd order\n');
    f = polyfit(Weight, JHI, 3)
    func = @(x) f(1)*x^3 + f(2)*x^2 + f(3)*x + f(4)
    hold on
    grid on
    fplot(func, [20 80]);
    plot(Weight, JHI, 'g.');
    plot(VanLam, func(VanLam), 'r+');
    fprintf('Predicted JHI number of Van Lam: %f', func(VanLam));
    hold off
elseif Order == "lsqcurvefit"
    fprintf('--------------------------------------\n\n')
    fprintf('lsqcurvefit\n');
    c =  @(f, x) f(1)*x + f(2);
    pkg load optim
    a = lsqcurvefit(c, [2;3], Weight, JHI)
    func = @(x) a(1)*x +a(2);
    hold on
    grid on
    fplot(func, [20 80]);
    plot(Weight, JHI, 'g.');
    plot(VanLam, func(VanLam), 'r+');
    fprintf('Predicted JHI number of Van Lam: %f', func(VanLam));
    hold off
end




