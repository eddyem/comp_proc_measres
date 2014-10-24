%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% snowboat.m %%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  function  snowboat
%
%       Solver for 1st order equations associated with snowboat problem
%		
%	Solution is for Vector  [u v x y]' 	where u=x' , v=y'
%	It prompts  for:
%		mean coefft. of kinetic friction mu
%		coefft of air resistance kr
%		starting coords [x0 y0]  
%		starting veloc. [u0 v0]  
%		time interval  dt
%	and requests permission to complete another time step.
%	The derivatives specifying the motion are given in snbtfn.m
%
%  Uses: snbtfn.m, snowsl.m, fsnow1.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  snowboat
% Initialization
hold off; clg;format bank;
disp('Equations of motion for snow boat')
disp(' ')
disp('When you press RETURN you will see a contour plot and then')
disp(' an empty plan view of the area')
disp('You will then be asked for the initial coordinates/velocities')
disp('Press RETURN to end any pauses.')
pause;
next = 'y';
dt = 0.5; trace = 0; tol = 0.05; 
%
a=2000; nx=20; dx=a/nx;			% square area 2km x 2km
[X,Y]=meshdom(0:dx:a,0:dx:a);		% set up contour plot of the hill
Z=snowsl(X,Y);
contour(Z,20)
title('Countour plot of snow slopes')
pause;
clg;
%
xp = [0,2000]; yp = xp;

plot(xp,yp,'.r')
title('Plan view of snow slopes')
xlabel('x')
ylabel('y')
hold on
% pause

% Input parameters
mu = input(' Input coefft of friction : ');
kr = input(' Input coefft of air res. : ');
m  = 150.0;	% mass of snowboat + one passenger (kgs)
k= [mu,kr,m];
while next ~= 'n'
    initpos = input('Initial x,y position, enter as [x0 y0]: ');
    initvel = input('Initial velocity,     enter as [u0 v0]: ');
    dt=input('Suggest a time step (try 10 secs if you have no better suggestion): ');
    disp('Initial z and vertical velocity component are');
    z0=snowsl(initpos(1),initpos(2)); [fx fy]=fsnow1(initpos(1),initpos(2));
    vz0=fx*initvel(1)+fy*initvel(2);
    disp([z0 vz0])  

    disp('please wait...')
    y0 = [initpos,initvel]'; t0 = 0; tf = dt; step = 'y'; mti=1;
    while step == 'y'
        [tout,yout] = ode23k('snbtfn', k, t0, tf, y0, tol, trace);
%
        xp = yout(:,1); yp=yout(:,2);	% these are output x,y, coords
%       xp = yout(:,3); yp=yout(:,4);	% these are output veloc. components
%
        np = length(xp); mtf=mti+np-1;
        plot(xp,yp,'r'); 
% pause

% plot this segment of run
        disp('          t           x(t)          y(t)            u(t)          v(t)')
        disp([tf xp(np) yp(np) yout(np,3) yout(np,4)])  
        disp('          z(t)          vz(t)');
        z=snowsl(xp(np),yp(np)); [fx fy]=fsnow1(xp(np),yp(np));
        vz=fx*yout(np,3)+fy*yout(np,4);
        disp([z vz])  

% store the height and speed as a function of distance from starting point
	yp1(mti:mtf)=snowsl(xp,yp);			%height
	yp2(mti:mtf)=10.0*sqrt(yout(:,3).^2+yout(:,4).^2);	%speed
	xp=xp-initpos(1); yp=yp-initpos(2);
	xpp(mti:mtf)=sqrt(xp.*xp+yp.*yp);		%horiz. dist.
	mti=mtf+1;

        step = input('Another time step? (y/n): ','s');
        t0 = tf; tf = t0 + dt;
        num = size(tout); y0 = yout(num(1),:)';
    end
    next = input('Do you want another simulation? (y/n): ','s');
end

% now plot the height and speed overall as promised
hold off
clg
disp('Press ENTER for a plot of the height Z  and the speed V ...');
disp(' as a function of the horiz. dist. travelled  ');
pause

xp = [0,1500]; yp = [400,800];
plot(xp,yp,'.r')
title('Height Z is White, Speed V (x10+400) is Green')
xlabel('d')
ylabel('Z,V')
hold on
plot(xpp,yp1,'w')
yp2=yp2+400;		% add 400 to make visible on same plot
plot(xpp,yp2,'g')



