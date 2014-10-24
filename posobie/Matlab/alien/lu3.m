function [L, U, P] = lu3(A, t)
%LU3.m   computes the factorization P*A = LU by Gaussian
%        elimination with NO partial pivoting:
%
%USAGE: [L, U, P] = LU3(A, t);
%
%==OR== [L, U]    = LU3(A, t);
%
%==OR== [L, U]    = LU3(A);
%
%where A is the input matrix (of N x N) and
%      t is in [0,16] -- an integer for t-digit arithmetic.
%
%Notes: (1) t=0 is the same as t=16.
%       (2) For usage 3, t=8 will be used.   
%       (3) IF there are no output variables specified, 
%           LU3(A) returns the reduced matrix as LU would.
%
% See also CHOP, LU, LU2, LU4, LIN_SOLV

if nargin  < 1, help lu3, return, end
if nargin == 1, t = 8; end
if t == 0, t = 16; end
[n, n] = size(A);
 
for k = 1:n-1
  
    A(k+1:n,k) = chop( A(k+1:n,k)/A(k,k), t ); % Multipliers
 
    % Elimination
    i = k+1:n;
    A(i,i) = chop(A(i,i) - chop(A(i,k) * A(k,i), t), t);
 
end
 
if nargout <= 1, L = A; return, end
 
L = tril(A,-1) + eye(n);
U = triu(A);
if nargout==3,P = eye(size(A));end % dummy parameter for consistency with lu2

