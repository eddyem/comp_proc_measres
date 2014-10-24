%%%%%%%%%%%%%%%%%%%%%%% fishdat.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%		Loads fish weight/age data for fitting purposes
%
%	Usage:
%		fishdat
%
%	Loads in xi = fish(:,1) age in years
%		 yi = fish(:,2) mass in gms
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%

echo off;

% load all fish data using fishy.m
fishy; xi = fish(:,1); yi=fish(:,2);

% combine data into one matrix
alldat=[xi yi];

%plot the data
disp(' Press RETURN for plot')
pause
%define limits of the plot (bottom LH, top RH)
xp=[0 12]; yp=[0 1500];
plot(xp,yp,'.w')
hold on

plot(xi,yi,'*g')
title('Fish growth')
xlabel('years')
ylabel('m')
hold off

