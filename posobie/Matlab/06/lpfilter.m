function [H, D] = lpfilter(type, M, N, D0, n)
% H = lpfilter(type, M, N, D0, n)
% вычисляет передаточную функцию H низкочастотного фильтра
% типа type размера MxN
% значения type:
% 'ideal' идеальный НЧ фильтр с частотой отсечки D0>0
%         n необязательно
%
% 'btw' НЧ фильтр Баттеуоса (Butterworth) порядка n (по умолч. 1)
%         с частотой отсечки D0>0
%
% 'gaussian' НЧ фильтр Гаусса с частотой отсечки D0>0, n необязательно
%
% расчет маски для измерения расстояний от центра:
[U, V] = dftuv(M,N);
D = sqrt(U.^2 + V.^2);
switch type % выбираем тип фильтра
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
        error('Неизвестный тип фильтра')
end