function  xn2 = dfeqfn(xn1, xn, n)
%
%       dfeqfn
%            Defines the second order difference equation solved
%	     by diffeqn.m i.e. it supplies
%
%		x_(n+2) = f[x_(n+1), x_n, n]	
%	
%	     This simple example solves
%	     
%		x_(n+2) = 5*x_(n+1)-6* x_n	
%	
% 	     Modify as required

xn2 = 5*xn1 - 6*xn;

