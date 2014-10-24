
% Approximate times of descent for a cycloid from (0,c)
% to (d,0), corresponding to theta=0, theta=theta1 respectively
% and the value r for the radius of the rolling circle.
% Uses quad8 for theta=.01 to theta1 and estimates the integral
% from 0 to .01 separately.

g=0.1;   % g is "gravity".  0.1 seems to produce reasonable values
         % for the time

global r_gl c_gl

c_gl=input('Type c ');
d=input('Type d ');

% The values of r and theta you need here are calculated as
% in the text, using the M-file cycfun.m and the command fsolve.

r_gl=input('Type r ');
theta1=input('Type theta1  ');

time=quad8('slide4fn',.01,theta1);
% This uses Matlab's numerical integrator to find the
% time from theta=.01 to theta=theta1.

% Now we estimate the time from theta=0 to theta=.01

theta=.01

%******************************************************************
% These are the formulae for x, y and their derivatives
% x1, y1 with respect to theta.

                x=r_gl*(theta-sin(theta));
                y=c_gl-r_gl+r_gl*cos(theta);
                x1=r_gl*(1-cos(theta));
                y1=-r_gl*sin(theta);

%******************************************************************

       initial=sqrt(1+(x1/y1)^2)*2*sqrt(c_gl-y)/sqrt(2*g)

   time=time+initial;

   time


