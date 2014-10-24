%%%%%%%%%%%%%%%%%%%%%% foursig.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Creates noisy signal similar to fftdemo.m ready for loading into
% fouran.m with which it can be analysed
%
%   Usage:-
%           foursig
%
%       and press return as required
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function foursig
pi2=pi*2.0;

% time scale
t=0:.0001:.1;

% signal
s=sin(pi2*500*t) + 2*sin(pi2*1750*t) + 3*cos(pi2*1000*t) ;
rand('normal')
s = s + .1*rand(t);


% save the data (if required)
%save noisyt.mat t;
%save noisys.mat s;


disp('Press RETURN for a plot of some of the data')
pause
plot(t(1:50),s(1:50),'g')



