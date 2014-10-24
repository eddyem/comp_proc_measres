function  odegr(F,tmin,tmax,xmin,xmax)
%
%   odegr plots the "grain" (direction field) for the ODE
%                  dx/dt = f(x,t)
%                  on a 20x30 grid
%
%          F is a string containing the name of a real
%            function f(x,t), supplied in an M-file.
%        tmin,tmax are the initial and final t values.
%  xmin,xmax are limits for the plot
%
%

% Initialization
Nt = 15; Nx = 8;
dt = (tmax-tmin)/Nt; 		dtp0 = dt/4;
dx = (xmax-xmin)/Nx; 	dxp0 = dx/4; tn0 = dxp0/dtp0;
t = tmin:dt:tmax;
x = xmin:dx:xmax;
tp = [tmin,tmax]; xp = [xmin,xmax];
plot(tp,xp,'.')
title('ODE Grain Plot')
xlabel('t')
ylabel('x')
hold on

% Loop over grid points


for i = 2:Nt
    for j = 2:Nx
       tn = feval(F,t(i),x(j));
       if (abs(tn) < abs(tn0)) 
	dtp = dtp0; dxp = dtp*tn;
       else
	dxp = dxp0; dtp = dxp/tn;
       end
       tp = [t(i)-dtp, t(i)+dtp];
       xp = [x(j)-dxp, x(j)+dxp];
       plot(tp,xp,'g')
       plot(tp(2),xp(2),'.r')
    end
end
pause

ok = 1;

