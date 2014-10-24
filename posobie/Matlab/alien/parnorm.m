

% Draws envelope of normals to a parabola y=x^2
% You need to input the lower and upper bounds of x
% and the lower bound of y (the upper bound is fixed
% by making a square region displayed on the screen).
% You also need to input the lower and upper bounds of the
% parameter t, where the parabola is parametrized as (t,t^2).

xl=input('Type the lower bound of x ');
xu=input('Type the upper bound of x ');
yl=input('Type the lower bound of y ');
yu=xu-xl+yl;
tl=input('Type lower bound of parameter t ');
tu=input('Type upper bound of parameter t ');
diag=sqrt((xl-xu)*(xl-xu)+(yl-yu)*(yl-yu));
tstep=(tu-tl)/60;
cx=(xl+xu)/2;   %Coordinates of the centre of the
cy=(yl+yu)/2;   %screen rectangle
hdiag=sqrt((cx-xl)*(cx-xl)+(cy-yl)*(cy-yl));   %Half diagonal of screen

   t=tl:tstep:tu;



   p=ones(size(t));                % These three lines are where the
   q=2*t;                    % equation of the line, px+qy+r=0,
   r=-t-2*t.*t.*t;         % is placed. p,q,r are functions of t.

   % BEWARE!! that say q=4 will not produce a vector but a constant
   % number.  So if any of p,q,r is constant, say k, then you need
   % to write it as k*ones(size(t)).  Here, ones(size(t))
   % is a vector of 1's of the same length ("size") as the vector t.
   
   y=t.*t;
   plot(t,y,'r')

axis([xl,xu,yl,yu]);
axis('square');

hold on  
   
        for j=1:61
        z=cx*p(j)+cy*q(j)+r(j);
        w=p(j)*p(j)+q(j)*q(j);
        sw=sqrt(w);
        len=abs(z)/sw;   %Perpendicular distance from
                              %centre of screen to line
                if len < hdiag

                        fx=cx-p(j)*z/w;  %Coordinates of foot of perpendicular
                        fy=cy-q(j)*z/w;    %from centre of screen to line

                        u=[-1 1];         %u just takes values -1 and 1
                        x=fx-u*q(j)*hdiag/sw;
                        y=fy+u*p(j)*hdiag/sw;
                        plot(x,y,'g');
                end
        end

        x=-4*t.*t.*t;
        y=0.5*(1+6*t.*t);
        pause
        plot(x,y,'w')                % Plots the evolute of the parabola
				     % with the same axes as the normals

hold off

  
