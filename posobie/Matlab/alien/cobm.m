% Plots a "cobweb" diagram for Mobius sequences, starting value x0.
% You have to input the constants a,b,c,d and the lower and
% upper values of x and y which will appear on the graphics
% screen.
%
% Iteration is done 30 times, or until it seems that
% convergence is definitely taking place.
%
% If you break into the program with <Ctrl><C>, then
% remember to type "hold off" to release the graph.  You can
% still see the graphics window.


a=input('Type the value of a ');
b=input('Type the value of b ');
c=input('Type the value of c ');
d=input('Type the value of d ');
x0=input('Type the value of x0 ');

xl=input('Type the lower limit of x ');
xu=input('Type the upper limit of x ');
yl=input('Type the lower limit of y ');
yu=input('Type the upper limit of y ');


dx=(xu-xl)/100;
x=xl:dx:xu;
y=(a*x+b)./(c*x+d);
plot(x,y)
axis([xl xu yl yu]);

hold on

plot([xl xu],[xl xu],'b')   % Draws the diagonal in blue

clear x y iterate
x(1)=x0;
y(1)=0;
x(2)=x0;
y(2)=0;
x(3)=x0;
y(3)=(a*x0+b)/(c*x0+d);

iterate(1)=x0;
iterate(2)=y(3);

plot(x,y,'g')
i=1;
x(1)=x0+.1;  % To trick it into entering this while loop
while abs(x(3)-x(1)) > .001 & i < 30
    x(1)=x(3);
    y(1)=y(3);
    x(2)=y(1);
    y(2)=x(2);
    x(3)=x(2);
    y(3)=(a*x(2)+b)/(c*x(2)+d);
    iterate(i)=y(3);
    plot(x,y,'g')
    pause
    i=i+1;
end

xlabel('No more iterations will be done.  Press <Enter> to return to MatLab')
pause

iterate'

hold off

