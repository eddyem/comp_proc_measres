% M-file for drawing some cubic graphs y=x^3-ax+1
% You need to input the lower and upper bounds
% of x and y on the screen, and also the
% value of a.

clg

xl=input('Type the lower bound of x  ');
xu=input('Type the upper bound of x  ');
yl=input('Type the lower bound of y  ');
yu=input('Type the upper bound of y  ');



a=input('Type the value of a  ');

xstep=(xu-xl)/200;


x=xl:xstep:xu;
y=x.*x.*x - a*x + ones(size(x));

plot(x,y,'r')
axis([xl xu yl yu]);
hold on

u=[xl xu];
v=[0 0];
plot(u,v,'w')

hold off
