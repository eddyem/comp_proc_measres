function [H, D] = lpfilter(type, M, N, D0, n)
% H = lpfilter(type, M, N, D0, n)
% ��������� ������������ ������� H ��������������� �������
% ���� type ������� MxN
% �������� type:
% 'ideal' ��������� �� ������ � �������� ������� D0>0
%         n �������������
%
% 'btw' �� ������ ��������� (Butterworth) ������� n (�� �����. 1)
%         � �������� ������� D0>0
%
% 'gaussian' �� ������ ������ � �������� ������� D0>0, n �������������
%
% ������ ����� ��� ��������� ���������� �� ������:
[U, V] = dftuv(M,N);
D = sqrt(U.^2 + V.^2);
switch type % �������� ��� �������
    case 'ideal'
        H = double(D<=D0);
    case 'btw'
        if nargin == 4
            n = 1;
		end
		H = 1./(1 + (D./D0).^(2*n));
	case 'gaussian'
        H = exp((D.^2)./(2*(D0^2)));
    otherwise
        error('����������� ��� �������')
end