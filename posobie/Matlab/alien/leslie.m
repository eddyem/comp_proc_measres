%
%       leslie.m
%
% usage:
%	leslie
%
% output:
%		4x4 matrix L
%
%     	Constructs a Leslie matrix L to model the behaviour  of
%       the population's age structure using the age bands:-
%
%            0-5, 6-19, 20-59, 60-69
%
%	You are prompted for:-
%
%         b  the birth rate        	as a % of 20-59 band /year
%         di the infant death rate 	as a % of  0-5  band /year
%         da the age-related death rate as a % of 60-69 band /year
%
%


% Initialization
disp('Leslie matrix model for population age structure')
disp(' ')
disp(' the age bands 0-5, 6-19, 20-59, 60-69.')
disp('You will be prompted for birth and death rates etc.')
b = input('Birth rate as a percentage of 20-59 band /yr?: ');
di = input('Infant death rate as a percentage of 0-5 band /yr?: ');
da = input('Age-related death rate as a percentage of 60-69 band /yr?: ');


%Set up Leslie matrix
b = b/100; di = di/100; da = da/100;
disp(' Leslie matrix is:')

L = [ 5*(1-di)/6 0      b      0;
      (1-di)/6 13/14    0      0;
       0        1/14  39/40    0;
       0         0    1/40 9*(1-da)/10]

