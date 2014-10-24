
% Finds all odd pseudoprimes to base 2 which are <= m
% for a value of m input by the user.

m=input('Enter the largest number to be tested: ');
disp('Pseudoprimes to base 2 are: ')
for n=3:2:m           % Want to test odd numbers n from 3 to m.
   if pow(2,n-1,n)==1 % This tests whether 2^(n-1) leaves remainder
                      % 1 on division by n.
                      % If it doesn't then we go on to the next n.
                      % If it does then we test whether n is in fact
                      % prime by trial dividing n by odd numbers
                      % less than the square root of n. If none of
                      % these divides exactly into n then n is
                      % certainly prime, so should not be included
                      % in the list of pseudoprimes.

      k=3;            % The first odd number to trial divide into n
      while k<=sqrt(n)
         if rem(n,k)==0   % Tests whether k divides exactly into n
             k=n+1;   % This just gets out of the while loop,
                      % because n has been shown to be composite
                      % (multiple of k) so can be displayed 
                      % as a pseudoprime. 
         else k=k+2;  % otherwise go on to the next odd k to trial
                      % divide into n.
         end;
      end;
      if k==n+1 disp(n); end;
   end; % of if pow==1 loop  
end;    % of for n=3:2:m loop
   

