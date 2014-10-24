function f = adpmedian(g, Smax)
% adpmedian ������������ ���������� ��������� ����������
% ��������� ������ �������� � �������� 3 � 3 �
% ������������� �� ������� Smax x Smax
% Smax ������ ���� �������� �����, ������� 1
% 
if (Smax <= 1) | (Smax/2 == round(Smax/2)) | Smax ~= round(Smax)
    error('Smax ������ ���� �������� ����� ������ 1')
end
[M, N] = size(g);
f = g;
f(:) = 0;
alreadyProcessed = false(size(g));
% �������� ����������
for k = [ 3:2:Smax]
    zmin = ordfilt2(g, 1, ones(k, k), 'symmetric');
    zmax = ordfilt2(g, k*k, ones(k, k), 'symmetric');
	zmed = medfilt2(g, [k k], 'symmetric');
    processUsingLevelB = (zmed > zmin) & (zmax > zmed) & ...
        ~alreadyProcessed;
    zB = (g > zmin) & (zmax > g);
    outputZxy = processUsingLevelB & zB;
    outputZmed = processUsingLevelB & ~zB;
    f(outputZxy) = g(outputZxy);
    f(outputZmed) = zmed(outputZmed);
    alreadyProcessed = alreadyProcessed | processUsingLevelB;
    if all(alreadyProcessed(:))
        break;
    end
end
f(~alreadyProcessed) = zmed(~alreadyProcessed);