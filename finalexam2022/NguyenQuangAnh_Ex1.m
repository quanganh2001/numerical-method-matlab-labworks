clc;
clear;
% M is the last digit of your student ID: example: BA10-002 -> M = 2
% Calculate the arithmetic operations
fprintf('Calculate the arithmetic operations\n')
y = 12^3 + factorial(15) - sqrt(002)
disp(y);

% Define a column vector x and transpose vector
x = [1 2 3 4 5];
fprintf('x = ')
disp(x);
fprintf('transpose_vector = \n')
disp(x');

% Calculate the matrix
A = [1 2 3; 4 5 6; 7 8 9]
B = [1 1 2; 0 1 0; 0 0 1]
fprintf('Multiplication matrix C of A and B is: \n');
C = (A * B);
disp(C);

fprintf('Multiplication matrix D of A and B is: \n');
D = (A.*B);
disp(D);

fprintf('Inverse of the matrix E is: \n');
E = inv(A - B);
disp(E);

fprintf('Reduce the size of E to 2x2 by removing row 2 and column 2 of the original matrix using operator : \n');
E(:,2) = [];
fprintf('reduce_column = \n');
disp(E);

E(2,:) = [];
fprintf('reduce_row = \n');
disp(E);

% Give appropriate title, axis labels and legned for the plot
fprintf('Part c: Give appropriate title, axis labels and legned for the plot\n')
x=0:1:30
y = @(x) 2*x + 2
fprintf('Value of y of x = 0, 1, 2, ... , 30: ')
disp(y(x))
plot(x,y(x),'b+')
