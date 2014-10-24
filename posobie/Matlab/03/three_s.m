% three_s.m
% [ X sigma ] = three_s(x, n)
% ���������� ����� ������� x � ���������������� ��������� n
% ��� ������ �������� "���� ����"
% ���������: ������� �������� X � ��� ������������������ ����������, sigma

function [ X sigma ] = three_s(x, n)
newx = []; % ��������������� ������
Data = [x ; n]; % ����������� ������ ������
X = sum(x.*n)/sum(n); % ������� ��������������
sigma = sqrt(sum(n.*(x-X).^2)/sum(n)); % ������������������ ����������
down = X-3*sigma; % ������ ������� �������������� ���������
up = X+3*sigma;   % ������� ������� -//-
a=find(x < down); % a � b - ������ ���������, ��������� �� �������
b=find(x > up);
while (length(a)>0) || (length(b)>0) % ���� ���� �������� ��������
	Data = Data(:, find(Data(1, find(Data(1,:) >= down)) <= up)); % ����������� ��
	x = Data(1,:);
	n = Data(2,:);
	X = sum(x.*n)/sum(n);
	for a = [1:length(n)]
		newx = [newx ones(1,n(a)).*x(a)];
	end
	X = median(newx);
	sigma = sqrt(sum(n.*(x-X).^2)/sum(n));
	down = X-3*sigma;
	up = X+3*sigma;
	a = find(x < down);
	b = find(x > up);
end
