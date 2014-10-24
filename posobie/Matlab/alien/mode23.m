function [tout, yout] = mode23(F, t0, tfinal, y0, tol, trace)
%ODE23  Integrate a system of ordinary differential equations using
%       2nd and 3rd order formulas.  See also ODE45.
%
% [tout, yout] = mode23(F, t0, tfinal, y0, tol, trace)
%
% INPUT:
% F     - String containing name of user-supplied problem description.
%         Call: yprime = fun(t,y) where F = 'fun'.
%         t      - Time (scalar).
%         y      - Solution column-vector.
%         yprime - Returned derivative column-vector; yprime(i) = dy(i)/dt.
% t0    - Initial value of t.
% tfinal- Final value of t.
% y0    - Initial value column-vector.
% tol   - The desired accuracy. (Default: tol = 1.e-3).
% trace - If nonzero, each step is printed. (Default: trace = 0).
%
% OUTPUT:
% tout  - Returned integration time points (row-vector).
% yout  - Returned solution, one solution column-vector per tout-value.
%
% The result can be displayed by: plot(tout, yout).

%   C.B. Moler, 3-25-87.
%   Copyright (c) 1987 by the MathWorks, Inc.
%   All rights reserved.

% Initialization
pow = 1/3;
if nargin < 5, tol = 0.001; end
if nargin < 6, trace = 0; end

% Initialization
t = t0;
hmax = (tfinal - t)/5;
hmin = (tfinal - t)/20000;
h = (tfinal - t)/100;
y = y0(:);
tout = t;
yout = y.';
tau = tol * max(norm(y, 'inf'), 1);

if trace
   clc, t, h, y
end

% The main loop
   while (t < tfinal) & (h >= hmin)
      if t + h > tfinal, h = tfinal - t; end

      % Compute the slopes
      s1 = feval(F, t, y);
      s2 = feval(F, t+h, y+h*s1);
      s3 = feval(F, t+h/2, y+h*(s1+s2)/4);

      % Estimate the error and the acceptable error
      delta = norm(h*(s1 - 2*s3 + s2)/3,'inf');
      tau = tol*max(norm(y,'inf'),1.0);

     % Update the solution only if the error is acceptable
      if delta <= tau
         t = t + h;
         y = y + h*(s1 + 4*s3 + s2)/6;
         tout = [tout; t];
         yout = [yout; y.'];
      end
      if trace
         home, t, h, y
      end

      % Update the step size
      if delta ~= 0.0
         h = min(hmax, 0.9*h*(tau/delta)^pow);
      end
   end;

   if (t < tfinal)
      disp('SINGULARITY LIKELY.')
      t
   end
