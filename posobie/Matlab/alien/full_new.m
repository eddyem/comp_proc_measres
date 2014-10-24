function [x,F]=full_Newton(FunFcn,x0,nmax,tol,trace)
% Full Newton method for solving a system of nonlinear equations:
%
% USAGE:   [X F] = full_New('xyz',x0,nmax,tol,trace)
% ==or==      X  = full_New('xyz',x0)
%          nmax is the maximum number of iterations allowed
%           tol is the stopping tolerance
%         trace is the option for printing all iterates (0 or 1).
% For example,      sin(x) + y^2 + log(z) - 7 = 0
%                         3*x + 2^y - z^3 + 1 = 0
%                               x + y + z - 5 = 0.
% Use X = full_new('xyz',[1 1 1]')       where XYZ is the M-file
%         function [q J] = xyz(p)
%         x = p(1); y = p(2); z = p(3);
%         q = [];
%         q(1) = sin(x) + y^2 + log(z) - 7;
%         q(2) = 3*x + 2^y - z^3 + 1;
%         q(3) = x + y + z - 5;
%         J=[ cos(x),          2*y,     1/z;
%                  3,   log(2)*2^y,  -3*z^2;  % See also
%                  1,            1,      1];  % gauss_ja, nesolve
if nargin<2, help full_new, return, end
if nargin<5 
    trace=0;
end;

if nargin<4
    tol=0.001;
end;

if nargin<3 
    nmax=20;
end;

% these default settings of nmax and tol are arbitrary

f=[];J=[];x=[x0'];F=[ ];
x1=x0;

for n=2:nmax
  [f,J]=feval(FunFcn,x1);
  if det(J)==0|det(J)==Inf,x=Inf;F=Inf;return;end % Stop Failures
  x1=x1-J\f;
  if norm(f)<tol
     n=nmax;
  elseif trace==0
        x=x1;F=f;
     else
        x=[x; x1'];F=[F; f'];
     end
  end
end
