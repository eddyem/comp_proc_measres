%%%%%%%%%%%%%%%%%%%%%% snowsl.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function defining the surface of a snow slope for modelling purposes
% 
%
%   Usage:-
%       	Z = snowsl(X,Y)
%
%	X,Z are vectors or arrays
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%

function Z = snowsl(X,Y)

d=1000; di=.001;
Z = 0.5*d + 0.7*(Y-d).*exp(-((X*di-1.5).^2)*5.0-((Y*di-1).^2)*3.0);
Z = Z     + 0.15*d*exp(-((X*di-0.1).^2)*2-((Y*di-2).^2)*3.0);
Z = Z     + 0.2*d*exp(-((X*di).^2)*2-((Y*di-0.7).^2)*2.0);
Z = Z     + 0.1*d*exp(-(X*di-1.5).^2-(Y*di-0.6).^2);

