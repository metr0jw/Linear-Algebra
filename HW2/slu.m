function [P, L, U] = slu(A)     % ��Ʈ���� ���� ����� �Լ��� ���ϸ����� ȣ��� ���� ���� �Ҹ��� ������ slu�� slv���� �Ʒ��� ��ġ�߽��ϴ�.
[n, n] = size(A);               % n�� A����� ���� ���� ���� ���� (�׻� ���簢 ��������� n,n���� ���� �Ͽ��� ����)
P = eye(n, n);                  % (n,n)ũ���� ������� P ����
L = eye(n, n);                  % (n,n)ũ���� ������� L ����
U = zeros(n, n);                % (n,n)ũ���� ����� U ����

tol = 1.e-6; pivot_k=1;                 % tol = 0.000001 ���Ŀ� ���� �������� Ȯ���ϱ� ���� �� ������ ����
    for k = 1:n                         % LU factorization ���� ����
        chk_len = k-1;                  % ���� ������ ���� üũ ���� ����
       [r, pivot_k] = check_pivot(A(k:n, pivot_k:n), k, pivot_k, tol);    % row exchange�� ���� check_pivot �Լ� ���� n���� �����ϸ鼭 �Ѿ�� A��� ��ü�� ���� nȸ ��ŭ �ݺ����� Ȯ����!
       if ne(r,k)                                                   % r�� k�� ���� ���� ��� row exchage��  �����Ǿ���
          A([r k], 1:n) = A([k r], 1:n);                            % A ��Ŀ� k-r �� ��ȯ (�ش簪�� �������� row exchange ����)
          if k > 1, L([r k], 1:chk_len) = L([k r], 1:chk_len); 
          end          % k�� 1�̻��϶� (���� ��ȭ������)L ��Ŀ� k-r �� ��ȯ 
          P([r k], 1:n) = P([k r], 1:n); 
       end                        % P������ row exchage ����
       if abs(A(k, pivot_k)) >= tol   % A(k,k)->A(k,pivot_k)�� ��ȯ k�� ��ȯ���� �� ���� ���� ����
          for i = k+1:n               % �� k�� ������ ���� �ݺ���
             L(i, k) = A(i, pivot_k) / A(k, pivot_k); % �������� ���� k�� L��Ŀ� ���Ե� (LU����������̼� �⺻ ����)
             for j = k+1:n            %k��� k���� ����  �ҰŹ� ����
                A(i,j) = A(i, j) - A(k, j)*L(i, k); 
             end 
          end 
       end % ��Ұ� �ٲ������ �״�� A 
       for j = k:n                    % �����Ͽ� U ��� ������ ���� �ݺ���
          U(k, j) = A(k, j) * (abs(A(k, j)) >= tol); 
       end % A��Ұ� 0�� �ƴҰ�� U�� ������ ���� �����Ͽ� U��� ����
       
       if pivot_k < n
           pivot_k = pivot_k+1; 
       end
    end
end      % �ۿ� ������(check_pivot���� -1�Ѱ� ���)
