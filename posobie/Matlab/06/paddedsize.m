function PQ = paddedsize(AB, CD, PARAM)
%     paddedsize
% ��������� ������� ����������� ������� ��� ����������
% �� ������ ���
%
% PQ = paddedsize(AB, 'pwr2')
% ��������� PQ ��� ��������� ������� 2 � max(AB)
%
% PQ = paddedsize(AB, CD)
% ��������� ���������� ����� ������ �����,
% ������� ��� ������ AB+CD+1
%
% PQ = paddedsize(AB, CD, 'pwr2')
% ��������� PQ ��� ��������� ������� 2 � max([AB CD])
%
if nargin == 1 % paddedsize(AB)
    PQ = 2*AB;
elseif nargin == 2 & ~ischar(CD) % paddedsize(AB,CD)
    PQ = AB + CD + 1;
    PQ = 2 * ceil(PQ/2); % ��������� ������
elseif nargin == 2 % paddedsize(AB, 'pwr2')
    m = max(AB);
    P = 2^nextpow2(2*m); % ��������� ������� 2 � 2m
    PQ = [P, P];
elseif nargin == 3
    m = max([AB CD])
    P = 2^nextpow2(2*m);
    PQ = [P, P];
else
    error('�������� ����� ����������')
end