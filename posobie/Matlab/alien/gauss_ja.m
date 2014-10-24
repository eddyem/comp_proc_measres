function x = Gauss_Jacobi(FunFcn,x0,nmax,tol,trace)
% Gauss Jacobi method for solving a system of nonlinear equations:
%
% USAGE: X = gauss_ja( 'f_name', x0, max_no, Tol, Trace)  
%            max_no is the maximum number of iterations allowed
%            Tol    is the stopping tolerance
%            Trace  is the option (=1) for printing all iterates.
% For example, X = Gauss_Ja('xyz',[1 1 1]') 
%            solves the following system                          
%          /  sin(x) + y^2 + log(z) - 7 = 0,
%         ||        3*x + 2^y - z^3 + 1 = 0,
%          \              x + y + z - 5 = 0.
%       Here the M-file, xyz.m, contains the following:
%       function q = xyz(p)
%         x = p(1); y = p(2); z = p(3);
%         q(2) = sqrt(7-sin(x)- log(z));
%         q(1) = - (2^y - z^3 + 1)/3;    %%  See also  
%         q(3) = 5 - x - y;           %%%%%  full_new,  nesolve
if nargin<2, help gauss_ja, return, end
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

x=[];g=[];
x1=x0;

for n=1:nmax
  [g]=feval(FunFcn,x1);
  if norm(g)==Inf, x=Inf; return; end %% Stop failures
  if norm(g)==NaN, x=Inf; return; end %% Stop failures
  if norm(x1-g)<tol
     n=nmax;
  elseif trace==0
        x1=g;x=x1';
     else
        x1=g;x=[x; x1'];
     end
  end
end
