
% Draws envelope of lines px+qy+r=0, p,q,r functions of t
% The functions p(t), q(t), r(t) have to be stated in the
% M-file, so you have to insert these in the appropriate
% place.  The lower and upper bounds of x on the screen
% and the lower bound of y are input by the user (the
% upper bound of x is calculated so that a square area
% is displayed).  The lower and upper limits of the parameter
% are also input by the user.

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



   p=                 ;   % These three lines are where the
   q=                 ;   % equation of the line, px+qy+r=0,
   r=                 ;   % is placed. p,q,r are functions of t.

   % BEWARE!! that say q=4 will not produce a vector but a constant
   % number.  So if any of p,q,r is constant, say k, then you need
   % to write it as k*ones(size(t)).  Here, ones(size(t)) is a 
   % vector of 1's of the same length as the vector t.
   
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
                        hold on
                end
        end
        axis([xl,xu,yl,yu]);
        axis('square');

        hold off

  
