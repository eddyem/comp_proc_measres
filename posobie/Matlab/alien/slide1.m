
% Approximate times of descent for a parabola from (0,c)
% to (d,0).  The parabola y=alpha x^2 + beta x + c
% is determined by the value m of x at the lowest point.
% We only use quad8 for x=.01 to d and estimate the integral
% from 0 to .01 separately.
% NOTE The function y and its derivative need to be entered
% once in this M-file (marked by asterisks below) and
% also in the function file slide1fn.m

g=0.1;   % g is "gravity".  0.1 seems to produce reasonable values
         % for the time

%*********************************************************************
% There is a problem when using quad8.m to evaluate integrals
% in that, if the function being integrated has "parameters" such
% as alpha, beta and c, then these parameters have to be made
% "global". This is so that their values can be passed from an M-file
% such as this one (slide1.m) to the funtion file (slide1fn.m).
% This means that some tiresome additions are needed, and these
% are given below for the parabola case.  The "obvious" changes
% need to be made for other cases studied in the project.
% Look also at the M-file slide1fn.m to see that is needed there.
%**********************************************************************

global alpha_gl beta_gl c_gl

% The _gl is for two purposes: to remind you it's global and
% (very important) to make it unlikely that the name will clash 
% with other variables in current use, in your M-files or in
% the M-files in Matlab's library.
% NOTE The "global" statement MUST NOT be within a for or while loop!

          % c always needs to be made global since it occurs in the
          % formula for the function being integrated. On the
          % other hand d occurs as a limit of integration,
          % and does not need to be made global UNLESS 
          % it occurs also in the definition of the function y.
          % For the parabola this is not the case, since
          % we use alpha and beta instead.


c_gl=input('Type c ');
d=input('Type d ');

m=0;
while m <= d/2   % This is to prevent m <= d/2 being entered!
m=input('Type m, greater than d/2 ');
end;

alpha_gl=c_gl/(d*(2*m-d));  % The parabola is y=alpha x^2 + beta x + c
beta_gl=-2*alpha_gl*m;

time=quad8('slide1fn',0.01,d)             

% This at least is easy: integrate slide1fn with the values
% of alpha and beta and c given above, between x=.01 and x=d.
% It gives the time from x=.01 onwards.

x=.01;  

% It remains to estimate the time from x=0 to x=.01 (see the
% notes for the reason why this is necessary).  For this you
% need to put the formulae for y and its derivative y1 here
% as well as in the function file slide1fn.m
% In the formulae below you can use either the local or
% global forms of the parameters.

%********************************************************************

        y=alpha_gl*x^2+beta_gl*x+c_gl;
        y1=2*alpha_gl*x+beta_gl;

%********************************************************************

% The next line can always be left alone and simply
% estimates the "initial" time from x=0 to x=.01 by the
% method given in the notes.

       initial=-sqrt(2*(1+y1^2))*sqrt(c_gl-y)/(y1*sqrt(g))
     
       disp('The total time of descent is')
       disp(time+initial)
     

