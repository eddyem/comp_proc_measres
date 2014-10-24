%%%%%%%%%%%%%%%%%%%%%%%%%% fsnow0.m %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Function defining the surface of a snow slope for modelling purposes
%
%
%   Usage:-
%               z = fsnows0(x,y)
%
%       x,y are scalars
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%
function   z = fsnows0(x,y)

d=1000; di=.001;

z = .5*d+.7*(y-d)*exp(-5*(x*di-1.5)^2-3*(y*di-1)^2);
z = z +.15*d*exp(-2*(x*di-.1)^2 -3*(y*di-2)^2)+.2*d*exp(-2*x^2*di^2-2*(y*di-.7)^2);
z = z +.1*d*exp(-(x*di-1.5)^2-(y*di-.6)^2);
