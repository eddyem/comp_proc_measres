%%%%%%%%%%%%%%%%%%%%%% locmax.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 	Find local maxima of a vector
%	
% 	Searches for sign changes in differences
%
%   Usage:-
%           [n, lmax, imax]= locmax( vect )
%
%       n is the number of local maxima
%	lmax is a vector of local maxima (length n)
%	imax is a vector containing their positions
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [n,lmax,imax] = locmax( vect)

m = length(vect); 
n = 0; last = vect(2)-vect(1);
for i=3:m,
	this = vect(i)-vect(i-1);
	if ((last*this<0) & (this<0)) 	% turning value & a maximum
		n = n+1; imax(n)=i-1; lmax(n)=vect(i-1);
	end
	last = this;
end


