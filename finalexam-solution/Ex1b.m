clc;
clear;

A = [1 2 3; 4 5 6; 7 8 9];
B = [1 1 2; 0 1 0; 0 0 1];
fprintf('Sum of A and B\n')
C = (A+B);
fprintf("C = \n");
disp(C');
fprintf('Inverse of the matrix D\n')
D = inv(A-B);
fprintf("D = \n");
disp(D);
fprintf('Reduce the size of D to 2x2 by removing row 3 and column 3 of the original matrix using operator\n')
D(:,3) = [];
fprintf("reduce_column = \n");
disp(D);

D(3,:) = [];
fprintf("reduce_row = \n");
disp(D);