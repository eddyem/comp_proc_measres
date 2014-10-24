% randme.m --- in the Appendix of Chapter 6
%
% Generates random numbers by a congruential method
%
% USAGE:      randme
%     or  a = randme(n)  for generating "n" random numbers
%
% *Note*  Formula:  seed = rem( K*seed, M),   rand_num=seed/M 

function dummy=name(n) 
         if nargin<1,n=8;end;  if n==0,n=8;end
         if n<0,n=abs(n);end;  format compact; help randme
 K=input('Type in Multiplier K? (7^5) '); 
 M=input('Type in Integer M? (2^31-1) '); 
seed=input('Type in a seed? (1) '); 
seed_sav = seed;     shift=0;

fprintf('\n... Random numbers by randme.m ... from seed=%5d\n',seed)
for j=1:n
   KS = K*seed + shift;
   seed = rem(KS,M);
   rand_num = seed / M;
   fprintf('KS=%14.0f  seed=%11.0f   rand=%11.9f\n',KS,seed,rand_num);
end
fprintf('   where KS = K*seed\n')

% For comparisons with the same seed
fprintf('\n... Random numbers by MATLAB ... from seed=%5d\n',seed_sav)
  rand('seed',seed_sav)
  a=rand(n,1)
return
