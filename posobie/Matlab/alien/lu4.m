function [L, U, P] = lu4(A, t)
%LU4.m   computes the factorization P*A = LU by Gaussian
%        elimination with NO partial pivoting.  Here A 
%should be sparse("help sparse") to observe less "flops" 
%than LU3, though stored as a `full matrix form'. 
%For full matrices, this M-file is identical to LU3.
%
%USAGE: [L, U, P] = LU4(A, t);
%
%==OR== [L, U]    = LU4(A, t);
%
%==OR== [L, U]    = LU4(A);
%
%where A is the input matrix (of N x N) and
%      t is in [0,16] -- an integer for t-digit arithmetic.
%
%Notes: (1) t=0 is the same as t=16.
%       (2) For usage 3, t=8 will be used.   
%       (3) IF there are no output variables specified, 
%           LU4(A) returns the reduced matrix as LU would.
%
% See also CHOP, LU, LU2, LU3, LIN_SOLV

if nargin  < 1, help LU4, return, end
if nargin == 1, t = 8; end
if t == 0, t = 16; end   
[n, n] = size(A); TOL=10^(-t);
 
for k = 1:n-1
    for irow=(k+1):n
    if abs(A(irow,k)) > TOL
    A(irow,k) = chop( A(irow,k)/A(k,k), t );          % Multipliers
    for jcol=(k+1):n   % Elimination
    A(irow,jcol) = chop(A(irow,jcol) - chop(A(irow,k) * A(k,jcol), t), t);
    end %for
    end %if
    end %for
end
 
if nargout <= 1, L = A; return, end
 
L = tril(A,-1) + eye(n);
U = triu(A);
if nargout==3,P = eye(size(A));end % dummy parameter for consistency
