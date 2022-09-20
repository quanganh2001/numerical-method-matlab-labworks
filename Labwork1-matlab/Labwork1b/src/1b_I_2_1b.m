% ©2021 HP.
 % Use plot to graph the following functions: y = tan(x/2) for -pi <= x <= pi, -10 <= y <= 10. (Hint: first draw the plot; then use axis).
clc;
clear;
clf;

%fplot(@(x) tan(x/2), [-pi pi -10 10]);

fplot(@(x) tan(x/2), [-pi pi -10 10]) ;

%x =linspace(-10, 10,1000)
%y = tan(x/2)
%plot(x,y)
%xlim([-pi pi])
%ylim([-10 10])

grid on
