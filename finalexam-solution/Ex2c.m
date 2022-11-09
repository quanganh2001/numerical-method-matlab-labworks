clc;
clear;
fprintf('compute 1 - 1/3 + 1/5 - 1/7 + 1/9 - ... - 1/1003\n')
sum = 0;
for k=1:4:1001
    sum=sum+1/k;
end
for k=3:4:1003
    sum=sum-1/k;
end
fprintf('sum is: ')
disp(sum)