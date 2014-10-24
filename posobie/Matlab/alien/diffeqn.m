function  diffeqn
%
%       diffeqn
%            solves a second order difference equation 
%		
%		x_(n+2) = f[x_(n+1), x_n, n]	
%	
%	     by simple iteration. It prompts  for starting values of 
%	     x_0 and x_1, the number of iterations for each "time" step,
%            and permission to complete another time step.
%	     The particular difference equation is defined by 'dfeqfn.m'
%
%       diffeqn.m uses: dfeqfn.m
%

% Initialization
disp('Simple interation of a second order difference equation.')
disp(' ')
disp('When you press RETURN you will see an empty plot of x_n vs n')
disp('You will be asked for the initial values of x_0 and x_1.')
disp('Press RETURN to end any pauses.')
pause
more = 'y';
nt = 10; 
xp = [0 50]; yp = [-100 100];
clg; hold off
plot(xp,yp,'.')
title('Second order difference equation')
xlabel('n')
ylabel('x')
hold on
pause

% Input parameters
while more ~= 'n'
    init = input('Initial values, enter as [x0 x1]: ');
    nt=input('How many iterations? (try 4 if you have no better idea): ');
    disp('please wait...')
    step = 'y'; yp(1:2)=init; 
    n = 1; xp(1) = 0; xp(2)=1;
    while step == 'y'
	m = 1; n1 = n;
	while m < nt        
	  m= m+1; n = n+1; xp(n+1)=n;
	  yp(n+1) = dfeqfn(yp(n), yp(n-1), n-2);
	end
        plot(xp(n1:n+1),yp(n1:n+1),'r'); pause
	disp('n and x_n were:-'); 
	disp(xp(n1:n+1));
	disp(yp(n1:n+1));
        step = input('More iterations? (y/n): ','s');
    end
    more = input('Do you want another solution? (y/n): ','s');
end
hold off

