
function u=slide1fn(x)

global alpha_gl beta_gl c_gl

% This is the function needed for the parabola case.
% Note that the versions alpha_gl, beta_gl, c_gl
% of the parameters need to be used here.

g=.1;

%******************************************************************

                y=alpha_gl*x.^2+beta_gl*x+c_gl;
                y1=2*alpha_gl*x+beta_gl;

%******************************************************************

% The remaining line can be left alone when y and y1 are changed.
% It is the function actually integrated to find the time.

       u=sqrt(1+y1.*y1)./sqrt(2*g*(c_gl-y));

