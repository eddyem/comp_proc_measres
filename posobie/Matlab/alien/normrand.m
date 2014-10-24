function values=normrand(mu,sigma,n,m);
% Usage:   V = normrand( mu, sigma)        % for 1 x 1
%    or    V = normrand( mu, sigma, n)     % for n x n
%    or    V = normrand( mu, sigma, n, m)  % for n x m
%
% computes a matrix of size n x m, normally distributed 
%             with mean mu and standard deviation sigma.
if nargin < 2, help normrand, return, end
if nargin == 2, 
    n=1; m=1;
elseif nargin == 3, 
    m=n;
end
 z=randn(n,m);
 z=mu+z*sigma;
 values=z; 
