%%%%%%%%%%%%%%%%%%%%%% fourdat.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Loads a noisy signal similar to fftdemo.m. Same as that used by
% fouran.m
%
%   Usage:-
%           fourdat
%
%       and press return as required
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

echo off
% load the data
load noisyt.mat;
load noisys.mat;


disp('Press RETURN for a plot of some of the data')
pause
plot(t(1:50),s(1:50),'g')

