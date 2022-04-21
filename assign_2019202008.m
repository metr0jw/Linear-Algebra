function E = assign_2019202008(A, b)
% Implementation of Linear Algebra assignments from #1 to #9
% Comments are located at the above of the each problems

% Define length of row and column for later usage
row_len = size(A, 1);
col_len = size(A, 2);


% #1 Column-wise interchange Exchange the first column with the last column of the matrix A
% v is a temp vector for exchange
% temp = a, a = b, b = temp swap
v = A(:, 1);
A(:, 1) = A(:, col_len);
A(:, col_len) = v;
disp('Condition 1 : A')
disp(A)


% #2 Sort the odd rows elements of the matrix A in ascending order by each row
% i=1, 3, 5, ...
% Sort i th rows
for i = 1:2:row_len
    A(i, :) = sort(A(i, :));
end
disp('Condition 2 : A')
disp(A)


% #3 Add ones to all diagonal terms in matrix
% Add identity matrix to matrix A
A = A + eye(row_len, col_len);
disp('Condition 3 : A')
disp(A)


% #4 Using loop statement, calculate inner product of the input matrix.
% Preallocate 1*m zero vector for performance
B = zeros(1, col_len);
% And add the multiplications to B
for i = 1:row_len
    for j = 1:col_len
        B(1, j) = B(1, j) + A(i, j)*A(i, j);
    end
end
disp('Condition 4 : B')
disp(B)


% #5 Create a new vector u in the form of m*1 by performing sampling without replacement from the elements of vector b.
% Sample the number of col_len from vector b without replacement
u = datasample(b, col_len, 'Replace', false);
disp('Condition 5 : u')
disp(u)


% #6 Create a new vector t by dot product of matrices A and u.
% Simple dot product of matrix A and vector u
% if u is row vector, transpose u vector
if size(u,1) == 1
    u = u.';
    t = A*u;
else
    t = A*u;
end
disp('Condition 6 : t')
disp(t)


% #7 Concatenate vectors t and u to create a matrix C of the form m*2.
% Simple concatenation vectors t and u
C = [t u];
disp('Condition 7 : C')
disp(C)


% #8 Create a matrix D of the form m*m using inner product of vectors t and u.
% Size of vector t is m*1, and u is m*1, so it needs to be transposed one of them
D = dot(t, transpose(u));       
D = repmat(D, size(A, 1), size(A, 1));
disp('Condition 8 : D')
disp(D)


% #9 Calculate the element-wise power between matrices B and D to create
% matrix E.
% I could solve this line with power(B, D), but it overflows when B and D gets bigger
E = power(D, B);
disp('Condition 9 : E')
disp(E)
