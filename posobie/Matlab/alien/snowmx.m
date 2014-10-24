%%%%%%%%%%%%%%%%%%%%%% snowmx.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%		maximising function for the snow slope
%
%	uses snowsl.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f = snowmx(p)

f = -snowsl(p(1),p(2));


