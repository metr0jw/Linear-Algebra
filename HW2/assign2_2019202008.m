t = 0.01:0.01:0.2;
freq = 11:30;
A = zeros(20, 20);
for freq = 11:30 
    A(freq-10, :) = cos(2*pi*freq*t);
end

A_inv_builtin = inv(A);

% Find inverse of A using PLU factorization
A_inv = zeros(20, 20);
I = eye(20);
for i = 1:20
    A_inv(:, i) = slv(A, I(:, i));
end

diff = A_inv - A_inv_builtin;

% A = input
% x = to find
% b = output
x = A_inv * output;
x_builtin = A_inv_builtin * output;
