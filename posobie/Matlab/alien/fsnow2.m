%%%%%%%%%%%%%%%%%%%%%%%%%% fsnow2.m %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 	2nd order partial derivatives of the
%	function defining the surface of a snow slope for modelling purposes
%
%
%   Usage:-
%               [fxx,fxy,fyy] = fsnows2(x,y)
%
%       x,y are scalars
%	f itself is in fsnow0.m
%	fx, fy are  in fsnow1.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
function   [fxx,fxy,fyy] = fsnows2(x,y)

d=1000; di=.001;

fxx = -7.0*(y-d)*di^2*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2)+ ...
70.0*(y-d)*(x*di-1.5)^2*di^2*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2);
fxx=fxx-.60*di*exp(-2*(x*di-.1)^2-3*(y*di-2)^2) ...
+2.40*(x*di-.1)^2*di*exp(-2*(x*di-.1)^2-3*(y*di-2)^2);
fxx=fxx-.8*di*exp(-2*x^2*di^2-2*(y*di-.7)^2)+3.2*di^3*x^2* ...
exp(-2*x^2*di^2-2*(y*di-.7)^2)-.2*di*exp(-(x*di-1.5)^2 ...
-(y*di-.6)^2)+.4*(x*di-1.5)^2*di*exp(-(x*di-1.5)^2-(y*di-.6)^2);

fxy = -7.0*(x*di-1.5)*di*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2)+ ...
42.0*(y-d)*(x*di-1.5)*di^2*(y*di-1)*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2);
fxy=fxy+3.60*(x*di-.1)*(y*di-2)*di*exp(-2*(x*di-.1)^2-3*(y*di-2)^2)+ ...
3.2*di^2*x*(y*di-.7)*exp(-2*x^2*di^2-2*(y*di-.7)^2)+ ...
.4*(x*di-1.5)*(y*di-.6)*di*exp(-(x*di-1.5)^2-(y*di-.6)^2);

fyy = -8.4*(y*di-1)*di*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2) ...
-4.2*(y-d)*di^2*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2);
fyy=fyy+25.2*(y-d)*(y*di-1)^2*di^2*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2) ...
-.90*di*exp(-2*(x*di-.1)^2-3*(y*di-2)^2);
fyy+fyy+5.40*(y*di-2)^2*di*exp(-2*(x*di-.1)^2-3*(y*di-2)^2) ...
-.8*di*exp(-2*x^2*di^2-2*(y*di-.7)^2)+3.2*(y*di-.7)^2*di* ...
exp(-2*x^2*di^2-2*(y*di-.7)^2)-.2*di*exp(-(x*di-1.5)^2-(y*di-.6)^2)+ ...
.4*(y*di-.6)^2*di*exp(-(x*di-1.5)^2-(y*di-.6)^2);


