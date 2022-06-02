% Code by 20192008 Jiwoon Lee, 2022
% Generate input data as A
t = 0.01:0.01:0.2;                      % From time t=0.01 to 0.2, with increments of 0.01
A = zeros(20, 20);                      % Initialize a variable A as zero matrix for speed(prevent reallocation)
for freq = 11:30                        % Start loop, from frequency f=11 to 30
    A(:, freq-10) = cos(2*pi*freq*t);   % Add signal to matrix A
end                                     % Stop loop

load('output.mat'); % Load output.mat

% Find inverse of A using PLU factorization
A_inv = zeros(20, 20);              % Initialize a variable A_inv as zero matrix for speed(prevent reallocation)
I = eye(20);                        % Initialize I as a identity matrix, to find the inverse matrix using LU factorization
for i = 1:20                        % Loop from i=0 to i=20
    A_inv(:, i) = slv(A, I(:, i));  % Calculate inverse of A with using LU factorization
end                                 % Stop loop

A_inv_builtin = inv(A); % Calculate inverse of A with using built-in function

% A = input
% x = to find
% b = output
x = A_inv * output;                 % Calculate x with inverse matrix obtained using LU factorization
x_builtin = A_inv_builtin*output;   % calculated x with built-in inverse function

plot(A*x);                                  % Plot A*x
hold on;                                    % Wait to plot other calculated signal
plot(A*x_builtin);                          % Plot A*x, x is calculated with built-in bunction
plot(output);                               % Plot original signal output.mat
legend('A*x', 'A*x_built-in', 'Original');  % Legend in subplot
hold off;                                   % Show plotted signals

builtin_output_diff = A*x - A*x_builtin;                % Compare A*x with A*x_built-in
mean_builtin_output_diff = mean(builtin_output_diff, 1);% Mean of diffrence of each output
output_diff = A*x - output;                             % Compare A*x with original signal, which is signal at output.mat
mean_output_diff = mean(output_diff, 1);                % Mean of diffrence of each output
inv_diff = A_inv - A_inv_builtin;                       % Compare inverse of A obtained using LU factorization with inverse of A obtained using built-in function
