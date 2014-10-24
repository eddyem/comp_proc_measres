%%%%%%%%%%%%%%%%%%%%%% tides.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% load in tide time and height data
% 
%
%   Usage:-
%           tides
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
echo off
load times.mat
load heights.mat
%
disp('Tide times and heights read in OK')
disp('Times in tm(1:nt), heights in hm(1:nt)')
disp('           nt           dt            tmin          tmax ')
format bank;
nt=length(tm); dt=tm(2)-tm(1);
disp([nt,dt,tm(1),tm(nt)])
format short;


