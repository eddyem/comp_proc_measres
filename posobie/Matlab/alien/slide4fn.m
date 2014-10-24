                
function u=slide4fn(theta)                

global r_gl c_gl
g=.1;                
                
                x=r_gl*(theta-sin(theta));
                y=c_gl-r_gl+r_gl*cos(theta);
                x1=r_gl*(1-cos(theta));
                y1=-r_gl*sin(theta);

       u=sqrt(x1.*x1+y1.*y1)./sqrt(2*g*(c_gl-y));
