function x=lin_solv(lufcn,A,b,t);
% __________________________________________________________
% lin_solv.m  solves  Ax=b  using a LU method defined by 
% 'lufcn', and arithmetic of t decimal digits
% ----------------------------------------------------------
% USAGE:  x = lin_solv('lufcn', A, b, t);
%
% ==OR==  x = lin_solv('lufcn', A, b);
%
%where for t > 0, use t decimal digits,
%      for t = 0, use full 16 decimal digits, and
%      `lufcn' must be one of lu2, lu3, lu4.
%For usage 2, t=8 is taken as a default.
%
% See lu2, lu3, lu4, chop
 
if nargin < 3, help lin_solv, return, end
if nargin == 3, t = 8; end 
if t == 0, t = 16; end  

[L,U,P]=feval(lufcn,A,t); 

%% y=forward(L,(P*b),t);
n = length(b); y=P*b; 
for k = 1:n-1;     
    y(k+1:n) = chop(y(k+1:n) - chop(y(k)*L(k+1:n,k),t), t); 
end

%% x=backward(U,y,t);
x=y;
for k = n:-1:1;
    x(k)=chop(x(k)/U(k,k),t);
    x(1:k-1) = chop(x(1:k-1) - chop(x(k)*U(1:k-1,k),t), t);
end
