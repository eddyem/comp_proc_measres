% M-file to do complex Newton-Raphson iteration for a quadratic
% equation with complex roots p, q

i=sqrt(-1); % This is just in case i has been used as an integer lately

p=input('Type the complex number p, using the form p1 + i*p2  ');
q=input('Type the complex number q, using the form q1 + i*q2  ');

a=-p-q;
b=p*q;

% So p and q are the roots of the equation x^2+ax+b=0

hold off

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

%**** Axis commands here 

axis([xl,xu,yl,yu]);
axis('square');

% The screen is now a square area in the Argand diagram,
% with xl + i yl at bottom left and xu + i yu at top right.

%******************************************************

% Now we iterate using the Newton-Raphson
% method, looking for the roots p, q of z^2 + az + b = 0,
% starting at 500 random points z = x + iy.
% If the iterates approach p we mark them in red and
% if they approach q we mark them in green. If after
% 20 iterates they are still far from both p and q
% then we abandon that starting point.

epsilon=0.00001;

for j=1:500
	x=xl+rand*(xu-xl);
	y=yl+rand*(yu-yl);

	count=0;
	z=x+i*y;
		while (abs(z-p)>epsilon)&(abs(z-q)>epsilon)&(count<20)
			z=(z^2-b)/(2*z+a);
			count=count+1;
		end;
	if abs(z-q)<=epsilon 
	plot(x,y,'go'); 
	elseif abs(z-p)<=epsilon 
	plot(x,y,'ro'); 
	end;
end;

hold off
