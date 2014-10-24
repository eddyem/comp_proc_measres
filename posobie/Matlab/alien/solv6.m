% solv6.m --- Chapter 17 - example M-file
%
help solv6

disp(' ')
disp('Analysis of solution to Ax=b for a 11x11 random A,')
disp('           using t=2 digit arithmetic: ')
rand('seed',1998) ;        %%%  To fix 'seed' (see Week 5 note)
 A = 10*rand(11,11) ;   b = rand(11,1);   %% Generate the system
 t = 2 ;                                  %% Set the precision
 x = A \ b ;                              %% <=== "Exact" solution
 y = lin_solv( 'lu3', A, b, t) ;          %% <--- Numerical solution
 A_rel = norm(A -chop(A,t))/norm(A) ;     %% Relative error in A
 b_rel = norm(b -chop(b,t))/norm(b);      %% Relative error in b
 k = cond(A) ;                     %% Condition number
 C = k / ( 1 - k * A_rel ) 
 if ( C >= 50), disp('Problem is ill-conditioned ...'), 
 else,          disp('Problem is well-conditioned.'), end
 error_theory = C * (A_rel + b_rel)       %%% The formula in Theorem
 error_found  = norm(x-y) / norm(x)       %%% Use exact x, numerical y
