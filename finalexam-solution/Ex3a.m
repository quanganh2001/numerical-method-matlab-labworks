%Exercise 3
clc
%a
fprintf('Part a');
T=[-50 -30 0 60 90 110]; 
c=[1270 1280 1350 1480 1580 1700]; 
c0=100;

%%
fprintf('Part i: Use fit function');
f=fit(T',c','poly1')
func=@(x) f.p1*x+f.p2
figure 
hold on
grid on
box on
fplot(func, [-50 110],'k')
plot(T',c','b*','LineWidth',2);
plot(c0, func(c0), 'r*', 'LineWidth',2);
legend('T', 'c', '100','Location', 'northwest')
hold off
fprintf('the heat capacity c at 100oC');
func(c0)
fprintf('Part ii: Use polyfit function');
%%
f=polyfit(T,c,2);
func=@(x) f(1)*x^2+f(2)*x+f(3)
figure 
hold on
grid on
box on
fplot(func, [-50 110],'k')
plot(T',c','b*','LineWidth',2);
plot(c0, func(c0), 'r*', 'LineWidth',2);
legend('T', 'c', '100','Location', 'northwest')
hold off
fprintf('the heat capacity c at 100oC');
func(c0)

fprintf('Part iii: Use function');
d=@(f,x) f(1)*x+f(2);
a=lsqcurvefit(d,[2;3],T,c);
figure 
hold on
grid on
box on
fplot(func, [-50 110],'k')
plot(T',c','b*','LineWidth',2);
plot(c0, func(c0), 'r*', 'LineWidth',2);
legend('T', 'c', '100','Location', 'northwest')
hold off
fprintf('the heat capacity c at 100oC');
func(c0)