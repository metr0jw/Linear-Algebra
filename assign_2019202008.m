function [A] = assign_2019202008(A, b)
%UNTITLED 이 함수의 요약 설명 위치
%   자세한 설명 위치

row_len = size(A, 1);
col_len = size(A, 2);

% #1 Column-wise interchange
% Exchange the first column with the last column of the matrix A
v = A(:, 1);
A(:, 1) = A(:, col_len);
A(:, col_len) = v;

% #2 Sort the odd rows elements of the matrix A
% in ascending order by each row
for i = 1:2:row_len
    A(i, :) = sort(A(i, :));
end

% #3 Add ones to all diagonal terms in matrix
A = A + eye(row_len, col_len);

% #4 Using loop statement, calculate inner product of the input matrix.
B = zeros(1, col_len);
for i = 1:row_len
    for j = 1:col_len
        B(1, j) = B(1, j) + A(i, j)*A(i, j);
    end
end

% #5 Create a new vector u in the form of m*1 by performing
% sampling without replacement from the elements of vector b.
end