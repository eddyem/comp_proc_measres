% Hypocycloids: circle radius b rolling inside
% circle radius a > b; curve is traced out by a
% point at distance d from centre of rolling circle
% Windows version

clg
a=input('Type a ');
b=input('Type b ');
d=input('Type d ');
upper=abs(a-b)+abs(d);
disp('The lower limit of the parameter t is 0')
tu=input('If the upper limit of t is n*pi, then type n ');
tl=0;
tu=tu*pi;

tstep=(tu-tl)/200;

t=tl:tstep:tu;

x=(a-b)*cos(b*t/(a-b))+d*cos(t);  %  Put the x and y parametric functions
y=(a-b)*sin(b*t/(a-b))-d*sin(t);  %  in these two lines

plot(x,y)
axis('square');
axis([-upper upper -upper upper]);


