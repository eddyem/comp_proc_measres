function  vderpol
%
%       vderpol
%            solves the second order Van der Pol equation 
%		
%		w" -k*(1-w*w)*w' + w = 0	
%	
%	     as an autonomous first order system in v (=w') and w
%	     over a time interval 'dt'. It prompts  for starting 
%	     coordinates 'w0' and 'v0,' and requests
%            permission to complete another time step.
%	     The derivatives specifying the equation are given in
%	     vdplfn.m
%
%       vderpol.m uses: vdplfn.m, ode23k.m
%

% Initialization
disp('First order system for Van der Pol equation.')
disp(' ')
disp('When you press RETURN you will see an empty plot of v vs w.')
disp('You will be asked for the model parameter k, and initial coordinates.')
disp('Press RETURN to end any pauses.')
pause
more = 'y';
dt = 0.5; trace = 0; tol = 0.05;
xp = [-5 5]; yp = [-5 5];
k = 0;
clg; hold off
plot(xp,yp,'.')
title('1st order system for Van der Pol equation')
xlabel('w')
ylabel('v')
hold on
pause

% Input parameters
k = input(' Model parameter k : ');
while more ~= 'n'
    init = input('Initial coordinates (from -4 to 4), enter as [w0 v0]: ');
    dt=input('Suggest a time step (try 0.5 if you have no better suggestion): ');
    disp('please wait...')
    y0 = init'; t0 = 0; tf = dt; step = 'y'; mti=1;
    while step == 'y'
%
        [tout,yout] = ode23k('vdplfn', k, t0, tf, y0, tol, trace);
%
        xp = yout(:,1); yp=yout(:,2);
	nti = length(tout); mtf=mti+nti-1;
	xpp(mti:mtf)=tout(1:nti); 
	ypp(mti:mtf)=xp(1:nti);   mti=mtf+1;
        plot(xp,yp,'r'); 
	pause 
        disp('       t        w(t)      v(t)')
        disp([tf xp(nti) yp(nti) ])
        step = input('Another time step? (y/n): ','s');
        t0 = tf; tf = t0 + dt;
        num = size(tout); y0 = yout(num(1),:)';
    end
    more = input('Do you want another solution? (y/n): ','s');
end
hold off
clg
disp('Press ENTER for a plot of the last solution: w(t) vs t '); 
pause
plot(xpp,ypp,'g');
title('Van der Pol equation')
xlabel('t')
ylabel('w')
