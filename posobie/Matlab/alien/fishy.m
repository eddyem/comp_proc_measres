%
%       fishy.m
%
% usage:
%	fishy
%
% purpose:
%	Load some data on fish populations
%	
% data provided:
%       fish: 	fish(:,1)	age in years
%	      	fish(:,2)	mean weight (mass) in gms
%		fish(:,3)	current no./sq. km of a given age
%		fish(:,4)	no. of eggs (/1000) /per female of given age
%

% Some data

% ages
fish(:,1)=[1 2 3 4 5 6 7 8 9 10]';
% weights
fish(:,2)=[120 250 350 500 680 820 980 1110 1220 1300]';
% frequencies/sq km
fish(:,3)=0.5*[10000, 8197, 2725, 907, 302, 101, 33, 11, 4, 1]';
% egg production
fish(:,4)=20*[0, 0.7, 1.4, 2.2, 3.0, 3.8, 4.4, 5.0, 5.0, 5.0]'; 

disp(' fish data loaded in matrix fish(:,:)')
disp(' ')

