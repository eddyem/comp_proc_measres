function Rate_k = name(Root, Id);
% f_rate.m
%
% Estimates the convergence rate of a given sequence 
%       of scalars (Root=Vector) or vectors (Root=Matrix).
%
% Usage:    K = f_rate ( Root, id)
% ==or==    K = f_rate ( Root )
%
% where Root is of size (m x n), with n = dimension, and
%                id=1 is to show all intermediate estimates.
% For usage 2, id=0; 
%                in all cases the very last estimate is shown.
% For example, to check the convergence of the iterates,   
%               (1, 2, 3, 4, 4.5, 5, 5.11) 
%      USE       Root = [1  2  3  4  4.5  5  5.11]';
%                kc_1 = f_rate(Root,1)   %% Giving 1.3914 ... 2.8614
%                kc_2 = f_rate(Root)     %% Giving 1.7101 and 2.8614

if (nargin < 1), help f_rate; return, end
if  nargin==1, Id=0; end
[m n] = size(Root) ;                % Check if  m  is more than 4
if (m < 4 & n >= 4), Root=Root'; [m n]=size(Root); end
abort_id = 0;
x_exact = Root(m,:) ;    % Take as exact solution "x"
keep = [] ; Rate_k = []; i=3;
     if  m >= 4
     while (i < m)                       % Assume  m > 3 or m = 3
     d_n_m = norm(Root(i-2,:)-x_exact) ; % d_(n-1)
     d_n   = norm(Root(i-1,:)-x_exact) ; % d_n
     d_n_p = norm(Root(i,:)  -x_exact) ; % d_(n+1)
     if (d_n_m < eps) d_n_m = eps*7; end   % In case of 0
     if (d_n   < eps) d_n   = eps*7; end   % In case of 0
     if (d_n_m < eps) d_n_m = eps*7; end   % In case of 0
     if (d_n   < eps) d_n   = eps*7; end   % In case of 0
     if (d_n_p < eps)
	      d_n_p = eps*7  ;     % In case of 0
	      i = m - 1; abort_id = 1; % No need to continue
     end
	top = d_n_p / d_n ;              % numerator
     bottom = d_n   / d_n_m ;            % denominator
     if (top == 1) top = 1 + eps*7 ; end   % Safeguard for Log
     if (bottom == 1) bottom = 1 + eps*7 ; end
     rate_k = log(top) / log(bottom) ;   % Estimate of the order
     if (abort_id == 0 & rate_k > 0), keep = [keep; rate_k];  end
     i = i + 1;
     end                                 % End  WHILE-loop
	disp('  ');
     if Id == 1
	Rate_k = keep ;
	disp('  (Individual estimates for rate)') ;
     else
	m = length(keep);  m=keep(m);
	fprintf('Average Rate =%5.1f\n',mean(keep));
	fprintf('Last estimate=%5.1f\n',m);
	Rate_k = [mean(keep) m];
     end % End for IF
else
       fprintf('Rate_k is not estimated, because size = %d\n',m)
       disp('Not enough iterates have been supplied for f_rate.m');
       help f_rate ;
end;                                 % END the main IF m>4
