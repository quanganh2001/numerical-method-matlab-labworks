clc;
clear;
clf;

A = ones(3)

%a
printf('a. Create matrix B that is transposed to A\n')
B = A'

%b
printf('b. Compute the Sum of A and B\n')
printf('A+B = ')
A+B

%c
printf('c. Compute A*B and B*A\n')
printf('A*B = ')
A*B

printf('B*A = ')
B*A

%d
printf('d. Increase all the element of A by 2\n')
A
A .+= 2
