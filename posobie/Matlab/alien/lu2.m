function [L, U, P] = lu2(A, t)
%LU2.m   computes the factorization P*A = LU by Gaussian
%        elimination with partial pivoting:
%
%USAGE: [L, U, P] = LU2(A, t);
%
%==OR== [L, U, P] = LU2(A);
%
%where A is the input matrix (of N x N) and
%      t is in [0,16] -- an integer for t-digit arithmetic.
%
%Notes: (1) t=0 is the same as t=16.
%       (2) For usage 2, t=8 will be used.   
%       (3) IF there are no output variables specified, 
%           LU2(A) returns the reduced matrix as LU would.
%
% See also CHOP, LU, LU3, LU4, LIN_SOLV

if nargin  < 1, help lu2, return, end
if nargin == 1, t = 8; end
if t == 0, t = 16; end
[n, n] = size(A);
pp = 1:n;
 
for k = 1:n-1
 
    [big,row] = max(abs(A(k:n,k)));
    row = row+k-1;   % Make row an index w.r.t. whole matrix A.
    A( [k, row], : ) = A( [row, k], : );
    pp( [k, row] ) = pp( [row, k] );
 
    A(k+1:n,k) = chop( A(k+1:n,k)/A(k,k), t );          % Multipliers
 
    % Elimination
    i = k+1:n;
    A(i,i) = chop(A(i,i) - chop(A(i,k) * A(k,i), t), t);
 
end
 
if nargout <= 1, L = A; return, end
 
L = tril(A,-1) + eye(n);
U = triu(A);
if nargout == 3, P = eye(n); P = P(pp,:); end

