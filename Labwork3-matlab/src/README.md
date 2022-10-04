# V. Gauss elimination

## Exercise 1

Solve the system of linear equation:

$$
\left\{\begin{matrix}2x + y - z = 8 \\-3x - y + 2z = -11 \\-2x + y + 2z = -3 \\\end{matrix}\right.
$$

a) using *inv* or *mldivide* in Matlab

```matlab
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2]
b = [8; -11; -3]

A1 = inv(A) * b

x = midivide(A, b)

x = A\b
```

Output:

```
A =

   2   1  -1
  -3  -1   2
  -2   1   2

b =

    8
  -11
   -3

A1 =

   2.0000
   3.0000
  -1.0000
```

b) Use the function GaussPivot.m

```matlab
function x = GaussPivot(A,b)
    % GaussPivot: Gauss elimination pivoting
    % x = GaussPivot(A,b): Gauss elimination with pivoting. % input:
    % A = coefficient matrix
    % b = right hand side vector
    % output:
    % x = solution vector
    [m,n]=size(A);
    if m~=n,
        error('Matrix A must be square');
    end
    nb=n+1;
    Aug=[A b];
    % forward elimination
    for k = 1:n-1
                % partial pivoting
        [big,i]=max(abs(Aug(k:n,k))); ipr=i+k-1;
        if ipr~=k
            Aug([k,ipr],:)=Aug([ipr,k],:);
        end
        for i = k+1:n
            factor=Aug(i,k)/Aug(k,k);
            Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);
        end
    end
            % back substitution
    x=zeros(n,1); 
    x(n)=Aug(n,nb)/Aug(n,n); 
    for i = n-1:-1:1
        x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
    end
```

```matlab
clc;
clear;
clf;

A = [2 1 -1; -2 -1 2; -2 1 2]
b = [8; -11; -3]

x = GaussPivot(A,b)
```

Output

```
A =

   2   1  -1
  -2  -1   2
  -2   1   2

b =

    8
  -11
   -3

x =

   0.5000
   4.0000
  -3.0000
```

c) Modify the code above to Gauss Elimination without Pivoting. Explain the code

GaussNoPivot_Describe.m

```matlab
function x = GaussNoPivot_Describe(A,b)
    % GaussPivot: Gauss elimination pivoting
    % x = GaussPivot(A,b): Gauss elimination with pivoting. % input:
    % A = coefficient matrix
    % b = right hand side vector
    % output:
    % x = solution vector
    [m,n]=size(A);
    if m~=n, error('Matrix A must be square');
    end
    nb=n+1;
    Aug=[A b];
    % forward elimination
    for k = 1:n-1
                % partial pivoting
        %[big,i]=max(abs(Aug(k:n,k))); ipr=i+k-1;
        %if ipr~=k
        %    Aug([k,ipr],:)=Aug([ipr,k],:);
        %end
        for i = k+1:n
            factor=Aug(i,k)/Aug(k,k);
            Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);
        end
    end
            % back substitution
    x=zeros(n,1); 
    x(n)=Aug(n,nb)/Aug(n,n); 
    for i = n-1:-1:1
        x(i)=(Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
    end
```

```matlab
clc;
clear;
clf;

A = [2 1 -1; -2 -1 2; -2 1 2]
b = [8; -11; -3]

%x = GaussPivot(A,b)
x = GaussNoPivot(A,b)
```

Output

```
A =

   2   1  -1
  -2  -1   2
  -2   1   2

b =

    8
  -11
   -3

x =

   NaN
   NaN
   NaN
```

# VI. LU Decomposition

## Exercise 2: LU decomposition

Solve the following set of equations with LU factorization with pivoting

$$
\left\{\begin{matrix}2x + y - z = 8 \\-3x - y + 2z = -11 \\-2x + y + 2z = -3 \\\end{matrix}\right.
$$

a) Using function *lu* in Matlab

```matlab
% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];

% a) Using function lu in MATLAB
[L, U] = lu(A);
d = L\B;
x = U\d
```

Output

```
x =

   2.0000
   3.0000
  -1.0000
```

b) Use the function *LU_pivot.m* code

```matlab
function [L, U, P] = LU_pivot_Describe(A)
    [n, n1] = size(A);
    printf('[n, n1] = size(A) = [%d %d]', n, n1);
    printf('\nCreate matrices L and U with ones on the main diagonal and zeros elsewhere: L=eye(n), and P=eye(n):\n\n');
    L=eye(n)
    P=eye(n)
    U=A
    for j = 1:n
        printf('\n===============\n j = %d\n\n', j)
        printf('U(j:n, j) = U(%d:%d, %d)\n', j, n, j)
        U(j:n, j)
        [pivot m] = max(abs(U(j:n, j)));
        printf('[pivot m] = max(abs(U(j:n, j))) = max(abs(U(%d:%d, %d))) = [%f %d]\n', j, n, j, pivot, m);
        m = m+j-1;
        printf('\nm = m+j-1 = %d + %d - 1 = %d\n', m+1-j, j, m);
        if m ~= j
            printf('\nm = %d ~= j = %d => change the order\n', m, j)
            printf('\nU([m,j],:) =  U([j,m], :) \n=> U([%d,%d],:) =  U([%d,%d], :) = \n', m, j, j, m);
            U([m,j],:) =  U([j,m], :)   % interchange rows m and j in U
            printf('\nP([m,j],:) =  P([j,m], :) \n=> P([%d,%d],:) =  P([%d,%d], :) \n', m, j, j, m);
            P([m,j],:) =  P([j,m], :)   % interchange rows m and j in P
                if j >= 2;    % very_important_point
                    printf('\nj>2\n')
                    printf('\nL([m,j],1:j-1) =  L([j,m], 1:j-1) \n=> L([%d,%d],1:%d-1) =  L([%d,%d], 1:%d-1)\n', m, j, j, j, m, j);
                    L([m,j],1:j-1) =  L([j,m], 1:j-1) % interchange rows m and j in columns 1:j-1 of L
                end; 
        end
        for i = j+1:n
            printf('\n---------------\n i = %d\n\n',i)
            printf('\nL(i, j) = U(i, j) / U(j, j) \n=> L(%d, %d) = U(%d, %d) / U(%d, %d)\n', i, j, i, j, i, j)
            L(i, j) = U(i, j) / U(j, j)
            printf('\nU(i, :) =  U(i, :) - L(i, j)*U(j, :) \n=> U(%d, :) =  U(%d, :) - L(%d, %d)*U(%d, :)\n', i, i, i, j, j)
            U(i, :) =  U(i, :) - L(i, j)*U(j, :)
        end 
    end
end
```

```matlab
% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];

% b) Using function LU_pivot
%[L1, U1, P1] = LU_pivot(A);
[L1, U1, P1] = LU_pivot_Describe(A);

B1 = P1*B
d1 = L1\B1;
x1 = U1\d1
```

Output

```
[n, n1] = size(A) = [3 3]
Create matrices L and U with ones on the main diagonal and zeros elsewhere: L=eye(n), and P=eye(n):

L =

Diagonal Matrix

   1   0   0
   0   1   0
   0   0   1

P =

Diagonal Matrix

   1   0   0
   0   1   0
   0   0   1

U =

   2   1  -1
  -3  -1   2
  -2   1   2

===============
 j = 1

U(j:n, j) = U(1:3, 1)
ans =

   2
  -3
  -2

[pivot m] = max(abs(U(j:n, j))) = max(abs(U(1:3, 1))) = [3.000000 2]

m = m+j-1 = 2 + 1 - 1 = 2

m = 2 ~= j = 1 => change the order

U([m,j],:) =  U([j,m], :)
=> U([2,1],:) =  U([1,2], :) =
U =

  -3  -1   2
   2   1  -1
  -2   1   2

P([m,j],:) =  P([j,m], :)
=> P([2,1],:) =  P([1,2], :)
P =

   0   1   0
   1   0   0
   0   0   1

---------------
 i = 2

L(i, j) = U(i, j) / U(j, j)
=> L(2, 1) = U(2, 1) / U(2, 1)
L =

   1.0000        0        0
  -0.6667   1.0000        0
        0        0   1.0000

U(i, :) =  U(i, :) - L(i, j)*U(j, :)
=> U(2, :) =  U(2, :) - L(2, 1)*U(1, :)
U =

  -3.0000  -1.0000   2.0000
        0   0.3333   0.3333
  -2.0000   1.0000   2.0000

---------------
 i = 3

L(i, j) = U(i, j) / U(j, j)
=> L(3, 1) = U(3, 1) / U(3, 1)
L =

   1.0000        0        0
  -0.6667   1.0000        0
   0.6667        0   1.0000

U(i, :) =  U(i, :) - L(i, j)*U(j, :)
=> U(3, :) =  U(3, :) - L(3, 1)*U(1, :)
U =

  -3.0000  -1.0000   2.0000
        0   0.3333   0.3333
        0   1.6667   0.6667

===============
 j = 2

U(j:n, j) = U(2:3, 2)
ans =

   0.3333
   1.6667

[pivot m] = max(abs(U(j:n, j))) = max(abs(U(2:3, 2))) = [1.666667 2]

m = m+j-1 = 2 + 2 - 1 = 3

m = 3 ~= j = 2 => change the order

U([m,j],:) =  U([j,m], :)
=> U([3,2],:) =  U([2,3], :) =
U =

  -3.0000  -1.0000   2.0000
        0   1.6667   0.6667
        0   0.3333   0.3333

P([m,j],:) =  P([j,m], :)
=> P([3,2],:) =  P([2,3], :)
P =

   0   1   0
   0   0   1
   1   0   0

j>2

L([m,j],1:j-1) =  L([j,m], 1:j-1)
=> L([3,2],1:2-1) =  L([2,3], 1:2-1)
L =

   1.0000        0        0
   0.6667   1.0000        0
  -0.6667        0   1.0000

---------------
 i = 3

L(i, j) = U(i, j) / U(j, j)
=> L(3, 2) = U(3, 2) / U(3, 2)
L =

   1.0000        0        0
   0.6667   1.0000        0
  -0.6667   0.2000   1.0000

U(i, :) =  U(i, :) - L(i, j)*U(j, :)
=> U(3, :) =  U(3, :) - L(3, 2)*U(2, :)
U =

  -3.0000  -1.0000   2.0000
        0   1.6667   0.6667
        0        0   0.2000

===============
 j = 3

U(j:n, j) = U(3:3, 3)
ans = 0.2000
[pivot m] = max(abs(U(j:n, j))) = max(abs(U(3:3, 3))) = [0.200000 1]

m = m+j-1 = 1 + 3 - 1 = 3
B1 =

  -11
   -3
    8

x1 =

   2.0000
   3.0000
  -1.0000
```

c) Change the code of LU with pivoting in *LU_pivot.m* to LU non pivoting code

LU_nopivot_Describe.m

```matlab
function [L, U, P] = LU_nopivot_Describe(A)
    [n, n1] = size(A);
    printf('[n, n1] = size(A) = [%d %d]', n, n1);
    printf('\nCreate matrices L and U with ones on the main diagonal and zeros elsewhere: L=eye(n), and P=eye(n):\n\n');
    L=eye(n)
    P=eye(n)
    U=A
    for j = 1:n
        printf('\n===============\n j = %d\n\n', j)
        printf('U(j:n, j) = U(%d:%d, %d)\n', j, n, j)
        U(j:n, j)
        
        for i = j+1:n
            printf('\n---------------\n i = %d\n\n',i)
            printf('\nL(i, j) = U(i, j) / U(j, j) \n=> L(%d, %d) = U(%d, %d) / U(%d, %d)\n', i, j, i, j, j, j)
            L(i, j) = U(i, j) / U(j, j)
            printf('\nU(i, :) =  U(i, :) - L(i, j)*U(j, :) \n=> U(%d, :) =  U(%d, :) - L(%d, %d)*U(%d, :)\n', i, i, i, j, j)
            U(i, :) =  U(i, :) - L(i, j)*U(j, :)
        end 
    end
end
```

```matlab
% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];

% c) Using function LU_nopivot
%[L2, U2, P2] = LU_nopivot(A);
[L2, U2, P2] = LU_nopivot_Describe(A);

B2 = P2*B
d2 = L2\B2;
x2 = U2\d2
```

Output

```
[n, n1] = size(A) = [3 3]
Create matrices L and U with ones on the main diagonal and zeros elsewhere: L=eye(n), and P=eye(n):

L =

Diagonal Matrix

   1   0   0
   0   1   0
   0   0   1

P =

Diagonal Matrix

   1   0   0
   0   1   0
   0   0   1

U =

   2   1  -1
  -3  -1   2
  -2   1   2

===============
 j = 1

U(j:n, j) = U(1:3, 1)
ans =

   2
  -3
  -2

---------------
 i = 2

L(i, j) = U(i, j) / U(j, j)
=> L(2, 1) = U(2, 1) / U(1, 1)
L =

   1.0000        0        0
  -1.5000   1.0000        0
        0        0   1.0000

U(i, :) =  U(i, :) - L(i, j)*U(j, :)
=> U(2, :) =  U(2, :) - L(2, 1)*U(1, :)
U =

   2.0000   1.0000  -1.0000
        0   0.5000   0.5000
  -2.0000   1.0000   2.0000

---------------
 i = 3

L(i, j) = U(i, j) / U(j, j)
=> L(3, 1) = U(3, 1) / U(1, 1)
L =

   1.0000        0        0
  -1.5000   1.0000        0
  -1.0000        0   1.0000

U(i, :) =  U(i, :) - L(i, j)*U(j, :)
=> U(3, :) =  U(3, :) - L(3, 1)*U(1, :)
U =

   2.0000   1.0000  -1.0000
        0   0.5000   0.5000
        0   2.0000   1.0000

===============
 j = 2

U(j:n, j) = U(2:3, 2)
ans =

   0.5000
   2.0000

---------------
 i = 3

L(i, j) = U(i, j) / U(j, j)
=> L(3, 2) = U(3, 2) / U(2, 2)
L =

   1.0000        0        0
  -1.5000   1.0000        0
  -1.0000   4.0000   1.0000

U(i, :) =  U(i, :) - L(i, j)*U(j, :)
=> U(3, :) =  U(3, :) - L(3, 2)*U(2, :)
U =

   2.0000   1.0000  -1.0000
        0   0.5000   0.5000
        0        0  -1.0000

===============
 j = 3

U(j:n, j) = U(3:3, 3)
ans = -1
B2 =

    8
  -11
   -3

x2 =

   2
   3
  -1
```

d) Comparison and explain the difference between *LU_pivot.m* and *mylup.m* code:

```matlab
function [ L, U, P ] = mylup( A )
%% LU DECOMPOSITION WITH PIVOTING
[n,m] = size(A);
C = zeros(n, n+1);
% initialize
C(1:n, 1:n) = A;
C(1:n, n+1) = (1:n)';
% main algorithm
for j=1:n-1
    if (sum(C(1:n,j)) == 0)
        error('mylup:input', 'The solution is not determined.');
    end
    [~, i] = max(abs(C(1:n, j)));
    
    if (i ~= j)
        tt = C(i, 1:n+1);
        C(i, 1:n+1) = C(j, 1:n+1);
        C(j, 1:n+1) = tt;
    end
    
    for i = j+1:n
        t = C(i, j) / C(j, j);
        C(i, j) = t;
        C(i, j+1:n) = C(i, j+1:n) - t*C(j, j+1:n);
    end
end
% refine the results
PP = C(1:n, n+1);
C = C(1:n, 1:n);
L = tril(C, -1);
U = triu(C);
P = zeros(n, n);

for i=1:n
    L(i,i)=1;
    P(i, PP(i)) = 1;
end
end
```

```matlab
% (c)2021 Hien PHAN.
clc;
clear;
clf;

A = [2 1 -1; -3 -1 2; -2 1 2];
B = [8; -11; -3];

% d) Using function mylup.m
[L3, U3, P3] = mylup(A);

B3 = P3*B
d3 = L3\B3;
x3 = U3\d3
```

Output:

```
B3 =

  -11
   -3
    8

x3 =

   2.0000
   3.0000
  -1.0000
```

# VII. Common

## Exercise 1

Create a vector x that:

- is a column vector
- has all integer value elements from 1 to 20 respectively from the top

a) Create a vector **y** that has the same length and size as **x**’s but all entries is 1.

b) Calculate vector **z** that is the sum of **x** and **y**

c) Calculate the dot product between **x** and **y**

d) Increment the first, the 5th, the 16th and the last element of **z** by 3

e) After step d, multiply those elements with 6.

```matlab
clc;
clear;
clf;
x = 20:-1:1
x = x'

%a
y = ones(20, 1)

%b
z = x + y

%c
c = x.*y

%d
z(1) += 3;
z(5) += 3;
z(16) += 3;
z(length(z)) += 3;
z

%e
z(1) *= 6;
z(5) *= 6;
z(16) *= 6;
z(length(z)) *= 6;
z
```

Output:

```
x =

 Columns 1 through 16:

   20   19   18   17   16   15   14   13   12   11   10    9    8    7    6    5

 Columns 17 through 20:

    4    3    2    1

x =

   20
   19
   18
   17
   16
   15
   14
   13
   12
   11
   10
    9
    8
    7
    6
    5
    4
    3
    2
    1

y =

   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1
   1

z =

   21
   20
   19
   18
   17
   16
   15
   14
   13
   12
   11
   10
    9
    8
    7
    6
    5
    4
    3
    2

c =

   20
   19
   18
   17
   16
   15
   14
   13
   12
   11
   10
    9
    8
    7
    6
    5
    4
    3
    2
    1

z =

   24
   20
   19
   18
   20
   16
   15
   14
   13
   12
   11
   10
    9
    8
    7
    9
    5
    4
    3
    5

z =

   144
    20
    19
    18
   120
    16
    15
    14
    13
    12
    11
    10
     9
     8
     7
    54
     5
     4
     3
    30
```

## Exercise 2

Create a matrix A that:

- has size of 3*3
- all the entries is 1

a) Create matrix b that is transpose of A

b) Compute sum of A and B

c) Compute A*B and B*A

d) Increment all the elements of A by 2.

```matlab
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
```

Output:

```
A =

   1   1   1
   1   1   1
   1   1   1

a. Create matrix B that is transposed to A
B =

   1   1   1
   1   1   1
   1   1   1

b. Compute the Sum of A and B
A+B = ans =

   2   2   2
   2   2   2
   2   2   2

c. Compute A*B and B*A
A*B = ans =

   3   3   3
   3   3   3
   3   3   3

B*A = ans =

   3   3   3
   3   3   3
   3   3   3

d. Increase all the element of A by 2
A =

   1   1   1
   1   1   1
   1   1   1

A =

   3   3   3
   3   3   3
   3   3   3
```
