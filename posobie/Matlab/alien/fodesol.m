function  fodesol(F,tmin,tmax,xmin,xmax)
%
%
%    function  fodesol(F,tmin,tmax,xmin,xmax)
%
%    fodesol obtains an approximate solution to  the ODE
%            dx/dt = f(x,t) by the Runge-Kutta-Fehlberg
%            method ODE23 supplied with MATLAB (2nd/3rd
%            order version) and compares the solutions
%            with a "grain" (or field) plot.
%
%          F is a string containing the name of a real
%            function f(x,t), supplied in an M-file.
%              e.g. fnxt.m
%  tmin,tmax 	and
%  xmin,xmax 	are limits for the plot
%
% usage e.g.
%	fodesol('fnxt',0,  2.5, -3 , 3)
%
%       fodesol.m uses: odegr.m and mode23.m
%

% Initialization
disp('Here is a grain or field plot of dx/dt = f(x,t)')
disp('Press Enter to see it')
pause
more = 'y';
clg; hold off

% Grain plot
%axis([tmin tmax xmin xmax])
odegr(F,tmin,tmax,xmin,xmax)
hold on
axis(axis)
% Superimpose numerical solution through given point
while more == 'y'
    t0 = input('Pick initial t-value: ');
    x0 = input('Pick initial x-value: ');
    disp('please wait...')
    [xp,yp] = mode23(F,t0,tmax,x0);
% use a spline to make it look smoother
    n=length(xp); x1=xp(1); x2=xp(n);
    dx=(x2-x1)/50; xi=x1:dx:x2;
    yi=spline(xp',yp',xi);
    plot(xi,yi,'r'); pause
    more = input('Do you want another solution? (y/n): ','s');
end
disp(' Initial and final points (t,x) of solution were')
l=length(yp);
tf=xp(l); xf=yp(l);
disp('   Initial      Final')
disp([t0 tf])
disp([x0,xf])
hold off

