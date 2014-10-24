%%%%%%%%%%%%%%%%%%%%%% topog.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Produce and plot a nice topographical surface
%
%	Then allows one find a local minimum of the surface
% 
%   Usage:-
%           topog
%
%	then follow the prompts. 
%
%	uses: snowls.m, snowmn.m, snowmx.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
echo off
clg;
a=2000; nx=20; dx=a/nx;
[X,Y]=meshdom(0:dx:a,0:dx:a);

Z=snowsl(X,Y);

mesh(X,Y,Z)

hold on
title('Snow slopes')
next=input(' More? (y/n): ','s');
if next == 'y',
  hold off;
  clg
  contour(Z,20)
  X0=input(' Input guess for Minimum: [x,y]: ');
  disp('please wait...');
  format bank;
  Xmin=fmins('snowmn',X0);
  result=[Xmin,snowsl(Xmin(1),Xmin(2))];
  disp('         Xmin         Ymin           Zmin');
  disp(result);
  X0=input(' Input guess for Maximum: [x,y]: ');
  disp('please wait...');
  Xmax=fmins('snowmx',X0);
  result=[Xmax,snowsl(Xmax(1),Xmax(2))];
  disp('         Xmax         Ymax           Zmax');
  disp(result);
end

