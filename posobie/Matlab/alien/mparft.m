%%%%%%%%%%%%%%%%%%%%%%% mparft.m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%		
%
%	Usage:
%		mparft
%
%	NB Requires M-files corresponding to:
%		loadat, residfn     
%	to be set up FIRST using e.g. 'mparst3.m'
%
%	Performs a multiparameter fit to data with errors (if supplied)
%	The data is loaded (here by 'loadat') then a least squares
%	fit is performed using the MATLAB minimiser 'fmins.m'
%	The fitted function is specified in 'residfn'
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
echo off;
hold off;

disp('Example of least squares fit for arbitrary parametrisation');
disp('Load the data and plot it')
%load data here 
eval(loadat);
[n,m]=size(alldat);
pause; clg;

disp('See resid3.m for an example of a fitted function');
disp('Provide suitable starting values for parameters');
k=input(' start values in the form e.g. [ par1 par2 ... ]: ');

%create column vector of parameters
p=k';

%declare the data required as global so resids.m can find it
%yf will contain the fitted values
global xi yi dyi yf;
disp('please wait...');

%call the minimiser
p=fmins(residfn,p);

%display the best fit parameters
disp('Best fit parameters are:');
disp(p');
disp('Mimimum residual function is:');
R=eval([residfn,'(p)']);
disp(R);

%plot the data and fit
disp(' Press RETURN for plot')
pause

% when errors are present use this
if m > 2
%with upper error
    xp=xi; yp=yi+dyi; plot(xp,yp,'+g');
    hold on;
%with lower error
    yp=yi-dyi; plot(xp,yp,'+g')
%the central values
plot(xi ,yi, '*g');
else
%no errors present, use the central values only
plot(xi ,yi, '*g'); hold on;
end

% labels
title('Least squares fit ')
xlabel('x')
ylabel('y')

%the fitted values
plot(xi,yf,'w');

hold off;

