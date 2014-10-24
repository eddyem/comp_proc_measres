%%%%%%%%%%%%%%%%%%%%%%%%%% fsnow1.m %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 	ist order partial derivatives of the
%	function defining the surface of a snow slope for modelling purposes
%
%
%   Usage:-
%               [fx,fy] = fsnows1(x,y)
%
%       x,y are scalars
%	f itself is in fsnow0.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
function   [fx,fy] = fsnows1(x,y)

d=1000; di=.001;

fx = -7.0*(y-d)*(x*di-1.5)*di*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2) ...
-.60*(x*di-.1)*exp(-2*(x*di-.1)^2-3*(y*di-2)^2);
fx = fx-.8*di*x*exp(-2*x^2*di^2-2*(y*di-.7)^2)-.2*(x*di-1.5)* ...
exp(-(x*di-1.5)^2-(y*di-.6)^2);

fy = .7*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2)-4.2*(y-d)*(y*di-1)*di* ...
exp(-5*(x*di-1.5)^2-3*(y*di-1)^2);
fy = fy-.90*(y*di-2)*exp(-2*(x*di-.1)^2-3*(y*di-2)^2)-.8*(y*di-.7)* ...
exp(-2*x^2*di^2-2*(y*di-.7)^2)-.2*(y*di-.6)*exp(-(x*di-1.5)^2-(y*di-.6)^2);

