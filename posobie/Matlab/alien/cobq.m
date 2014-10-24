% Plots a "cobweb" diagram for y=lambda.x.(1-x), starting value x0.
% Upper and lower limits of x and y on the graphics screen
% need to be input, as do lambda and x0.
%
% This version prints out the iterates of x0 as the (column) vector
% iterate'.  This is done automatically unless the program has to
% be terminated by using Ctrl-Break.  In the latter case, type
% "hold off" to release the graph, and type "iterate'" to print the table.


lambda=input('Type the value of lambda ');
x0=input('Type the value of x0 ');

xl=input('Type the lower limit of x ');
xu=input('Type the upper limit of x ');
yl=input('Type the lower limit of y ');
yu=input('Type the upper limit of y ');

n=input('Type the number of iterations ');


dx=(xu-xl)/100;
x=xl:dx:xu;
y=lambda*x.*(1-x);
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
y(3)=lambda*x0*(1-x0);
iterate(1)=x0;
iterate(2)=y(3);

plot(x,y,'g')
i=3;
x(1)=x0+.1;  % To trick it into entering this while loop
while abs(x(3)-x(1)) > .001 & i < n
    x(1)=x(3);
    y(1)=y(3);
    x(2)=y(1);
    y(2)=x(2);
    x(3)=x(2);
    y(3)=lambda*x(2)*(1-x(2));
    iterate(i)=y(3);
    plot(x,y,'g')
    pause
    i=i+1;
end

iterate'

hold off

