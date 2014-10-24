%%%%%%%%%%%%%%%%%%%%%% fouran.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% load in signal data and then Fourier analyse
% 
%
%   Usage:-
%           fouran
%
%       press return as required
%
%	'fourdata' loads the same data with no Fourier analysis
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

function fouran

load noisyt.mat
load noisys.mat

%
disp('times and signal values read in OK.   No. of sample points is')
nt=length(t)

%make a plot of some of these
np=min(256,nt);nt2=nt/2;np2=np/2;
disp('Press RETURN for a plot of first so many values')
pause
xp=t(1:np); yp=s(1:np);
plot(xp, yp,'g+')
pause

% work out time scale and hence frequency scale
dt=t(2)-t(1);  			% the time spacing
f=(1:np2-1)/(dt*(np-1)); 	% the corrresponding frequency values
T=1 ./f;			% a corresponding period scale for plotting

% Take the Fourier transform
yf=fft(yp,np); 			% take the Fourier transform
%
spect=yf(2:np2).*conj(yf(2:np2));	% this is the mod^2 of the
clg					% frequency strength
disp(' Now plot against frequency....press RETURN')
pause

% put on a log/linear plot
semilogy(f,spect,'g+')
title(' Frequency spectrum')
xlabel('f /secs')
ylabel('P')
pause

% a log-log plot this time showing the periodicity
disp(' Now plot against period....press RETURN')
pause
loglog(T,spect,'r+')
title(' Periodicity spectrum')
xlabel('T secs')
ylabel('P')


