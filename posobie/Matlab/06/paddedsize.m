function PQ = paddedsize(AB, CD, PARAM)
%     paddedsize
% вычисляет размеры дополненной матрицы для фильтрации
% на основе ДПФ
%
% PQ = paddedsize(AB, 'pwr2')
% вычисляет PQ как ближайшая степень 2 к max(AB)
%
% PQ = paddedsize(AB, CD)
% вычисляет наименьшие целые четные числа,
% меньшие или равные AB+CD+1
%
% PQ = paddedsize(AB, CD, 'pwr2')
% вычисляет PQ как ближайшие степени 2 к max([AB CD])
%
if nargin == 1 % paddedsize(AB)
    PQ = 2*AB;
elseif nargin == 2 & ~ischar(CD) % paddedsize(AB,CD)
    PQ = AB + CD + 1;
    PQ = 2 * ceil(PQ/2); % ближайшее четное
elseif nargin == 2 % paddedsize(AB, 'pwr2')
    m = max(AB);
    P = 2^nextpow2(2*m); % ближайшая степень 2 к 2m
    PQ = [P, P];
elseif nargin == 3
    m = max([AB CD])
    P = 2^nextpow2(2*m);
    PQ = [P, P];
else
    error('Неверное число аргументов')
end