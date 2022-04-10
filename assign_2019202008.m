function [] = assign_2019202008(A, b)
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치

row_len = size(A, 1);
col_len = size(A, 2);

% #1 Column-wise interchange
% Exchange the first column with the last column of the matrix A
v = A(:, 1);
A(:, 1) = A(:, col_len);
A(:, col_len) = v;
disp('#1 Column-wise interchange in the matrix - A')
disp(A)

% #2 Sort the odd rows elements of the matrix A
% in ascending order by each row
for i = 1:2:row_len
    A(i, :) = sort(A(i, :));
end
disp('#2 Sort the odd rows elements of the matrix - A')
disp(A)


% #3 Add ones to all diagonal terms in matrix
A = A + eye(row_len, col_len);
disp('#3 Add ones to all diagonal terms in matrix - A')
disp(A)


% #4 Using loop statement, calculate inner product of the input matrix.
B = zeros(1, col_len);
for i = 1:row_len
    for j = 1:col_len
        B(1, j) = B(1, j) + A(i, j)*A(i, j);
    end
end
disp('#4 Calculated inner product of the input matrix - B')
disp(B)


% #5 Create a new vector u in the form of m*1 by performing
% sampling without replacement from the elements of vector b.
u = datasample(b, col_len);
disp('#5 m*1 sampled vector from b - u')
disp(u)

% #6 Create a new vector t by dot product of matrices A and u.
t = A*u;
disp('#6 Create a new vector t by dot product of matrices A and u.')
disp(t);

% #7 Concatenate vectors t and u to create a matrix C of the form m*2.
C = [t u]
disp('#7 Concatenate vectors t and u to create a matrix C, m*2')
disp(C)


% #8 Create a matrix D of the form m*m using inner product of vectors t and
% u.
D = dot(t, u)