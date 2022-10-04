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
