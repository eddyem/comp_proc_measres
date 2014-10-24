function  species
%
%       species
%            	simulates  the  behaviour  of an  ecological
%            	system over a time interval 'dt'. It is based on the 
% 		classic Lotka-Volterra model. 
%		It prompts for starting populations 'X0' and 'Y0,' and
%      		permission to complete another time step.
%
%       species.m  uses: 	ode23k.m,  specfn.m
%

% Initialization
disp('Ecological system with two competing species.')
disp(' ')
disp('When you press RETURN you will see an empty plot of #Y vs #X.')
disp('You will be asked for the model parameters and an initial population.')
disp('Press RETURN to end any pauses.')
pause
more = 'y';
dt = 0.1; trace = 1; tol = 0.1;
xp = [0 10]; yp = [0 10];
k = [0 0 0 0];
clg; hold off
plot(xp,yp,'.')
title('Autonomous system of competing species X and Y')
xlabel('#X')
ylabel('#Y')
hold on
pause

% Input parameters
kx = input(' Model parameters for dx/dt eqns, enter as [a b c] : ');
ky = input(' Model parameters for dy/dt eqns, enter as [d e f] : ');
k(1:3)=kx; k(4:6)=ky;
while more ~= 'n'
    pop0 = input('Initial populations (from 0 to 24), enter as [X0 Y0]: ');
    dt=input('Suggest a time step (try 0.1 if you have no better suggestion): ');
    disp('please wait...')
    y0 = pop0'; t0 = 0; tf = dt; step = 'y';
    while step == 'y'
        [tout,yout] = ode23k('specfn', k, t0, tf, y0, tol, trace);
        xp = yout(:,1); yp=yout(:,2);
        plot(xp,yp,'r'); pause
        step = input('Another time step? (y/n): ','s');
        t0 = tf; tf = t0 + dt;
        num = size(tout); y0 = yout(num(1),:)';
    end
    more = input('Do you want another simulation? (y/n): ','s');
end
hold off
