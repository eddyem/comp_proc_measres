% M-file to do complex Newton-Raphson iteration for a quadratic
% equation with complex roots p, q
% This M-file takes 10 random starting points and traces the paths
% obtained by joining up successive approximations until
% these get very close to one of the roots.

i=sqrt(-1); % This is just in case i has been used as an integer lately

p=input('Type the complex number p, using the form p1 + i*p2  ');
q=input('Type the complex number q, using the form q1 + i*q2  ');

a=-p-q;
b=p*q;

% So p and q are the roots of the equation x^2+ax+b=0


%**********************************************************

xl=input('Type the lower bound of x ');
xu=input('Type the upper bound of x ');
yl=input('Type the lower bound of y ');
yu=yl+xu-xl;

%**********************************************************

% The next section draws crosses at the two roots.
% The cross size can be adjusted via the next line.

cross_size=(xu-xl)/30;

p1=real(p); p2=imag(p);
q1=real(q); q2=imag(q);


x=[p1-cross_size p1+cross_size];
y=[p2 p2];
plot(x,y,'r')

hold on

x=[p1 p1];
y=[p2-cross_size p2+cross_size];
plot(x,y,'r')

x=[q1-cross_size q1+cross_size];
y=[q2 q2];
plot(x,y,'g')

y=[q2-cross_size q2+cross_size];
x=[q1 q1];
plot(x,y,'g')    

% Axis commands come next 

axis([xl,xu,yl,yu]);
axis('square');
% The screen is now a square area in the Argand diagram,
% with xl + i yl at bottom left and xu + i yu at top right.


%******************************************************

% Now we iterate using the Newton-Raphson
% method, looking for the roots p, q of z^2 + az + b = 0,
% starting at 10 random points z = x + iy.
% The computer draws a broken line joining the starting
% point to the successive approximations to a root.
% You hit Enter to choose the next random starting point.

epsilon=0.00001;

for j=1:10
	x=xl+rand*(xu-xl);
	y=yl+rand*(yu-yl);

	count=0;
	z=x+i*y;
		while (abs(z-p)>epsilon)&(abs(z-q)>epsilon)&(count<20)
			znew=(z^2-b)/(2*z+a);
			plot([real(z) real(znew)], [imag(z) imag(znew)])
			z=znew;
			count=count+1;
		end;
	pause
end;

hold off
