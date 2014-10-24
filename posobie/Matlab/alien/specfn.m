function  y1 = specfn(k,t,y)
%
%      y1 = specfn(k,t,y)
%               supplies the derivative vector for use
%      in ode23k as called by species.m. N.B. The output is a
%      COLUMN vector.  y(1) is #x, and y(2) is #y.
%
% 	It implements the Lotka-Volterra differential equations
%
y1 = [ (k(1)-k(2)*y(1)-k(3)*y(2))*y(1), (k(4)-k(5)*y(1)-k(6)*y(2))*y(2) ]';

