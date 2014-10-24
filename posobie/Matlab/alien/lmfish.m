%
%       lmfish.m
%
% usage:
%	lmfish
%
% output:
%		10x10 matrix H
%
%     	Constructs a basic Leslie matrix H to model the dynamics  of
%       the fish population 
%	NEEDS ALTERING to give decent model
%


disp('Leslie matrix model for fish population ')
disp('       NB assumes data matrix fish(:,:) has')
disp('           been loaded using fishy.m)')

%Set up Leslie matrix
% age bands are 1,2,...10 years
H=zeros(10);

% eggs produced from *females* of all ages (data was in 1000's)
H(1,:) = 1000*fish(:,4)';   % not right if only females produce eggs!

% fish surviving into the first year (1 in 10,000 chance)
H(1,:)=H(1,:)*0.0001;

% deaths due to fishing
pc  = [0.0, .1, .2, .3, .4, .5, .6, .7, .8, .9]; % prob of being caught
pnc = 1.0 -pc;					 % prob not caught
% This bit needs altering to incorporate the effect of net size and
% fish size on the probability of being caught
% The above numbers are just more or less arbitrary probabilities (<1.0)

% ageing
% loop over 2nd, 3rd years etc. and pick up survivors from previous year
for i=2:10
    H(i,i-1)=pnc(i-1);
end

disp(' Leslie matrix is:')
disp(H)

