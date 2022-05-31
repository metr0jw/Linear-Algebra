function [k, pivot_k] = check_pivot(A, k, pivot_k, tol)     % row exchage�� ���� slu���� ȣ�� �Ǵ� check_pivot �Լ�
    [n,  n] = size(A);              % n�� �迭�� ��,�� ���� (���簢����̱� ������ ����)
    r = find(abs(A(:)) > tol);      % r�� ifnd�� ���� A�迭�ȿ� 0���� ū���� �ִ°��� üũ�Ͽ� ���� (0�� �����ϴ� ����)
    if isempty(r)
        return
    end      % isempty�Լ��� ���� r �迭�� ����ִ��� Ȯ�� ����ִٸ� ����
    r = r(1);                       % ���� �ʱ�ȭ
    j = fix((r-1)/n)+1;             % r-1���� n���� ������ �Ҽ��� ���� ����
    k = k+r-(j-1)*n-1;              % k�� (��������;multipliers) ����� �Ҵ�
    pivot_k = pivot_k+j-1; 
end      % pivot_k�� j���� ������ ���� -1 (���Ͻ� slu���� �ٽ� ����)