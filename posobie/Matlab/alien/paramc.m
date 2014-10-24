% Plots parametrized curves.  INCOMPLETE UNTIL 
% you type in the x and y coordinates
% in two lines of the file, as functions
% of the parameter t.  The file
% calls for the lower and upper bounds of x and y
% so the scales on the two axes need not be equal.
% It also calls for the lower and upper bounds of
% the parameter t to be used.


clg
xl=input('Type the lower bound of x  ');
xu=input('Type the upper bound of x  ');
yl=input('Type the lower bound of y  ');
yu=input('Type the upper bound of y  ');

tl=input('Type the lower limit of t, the parameter  ');
tu=input('Type the upper limit of t, the parameter  ');

tstep=(tu-tl)/200;

t=tl:tstep:tu;

x=             ;                %  Put the x and y parametric functions
y=             ;                %  in these two lines

% REMEMBER that an added
% constant k must be entered as k*ones(size(t))

plot(x,y)
axis([xl,xu,yl,yu]);
