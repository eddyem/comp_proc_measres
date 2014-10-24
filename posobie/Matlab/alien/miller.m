% Miller's test for an odd n with base b.
% Here, n and b are input at the prompt and the
% powers and residues occurring during the calculation
% are put in the vectors power and remainder.
% These are then transposed and printed out
% to form a table.  The message printed
% is just that Miller's test has been passed or failed.
% The vectors power and remainder are removed after running
% the M-file since otherwise, if it is run again and
% the resulting vectors are shorter, the tail-end
% of the old vectors is still present and can cause
% confusion!

  n=input('Type n, the number to be tested  ');
  b=input('Type b, the base  ');

  n1=n-1;
  r=1;
  i=1;


  while (n1==floor(n1) & r==1)

             power(i)=n1;
             r=pow(b,n1,n);
             n1=n1/2;
             if r==n-1, r=-1;  % -1 is easier to recognise than n-1
                end
             remainder(i)=r;
             i=i+1;
        end


  disp('The first column is the powers, the second column is the remainders')
  disp('Remainder n-1 is printed as remainder -1')
  disp(' ')    % A blank line!
  disp([power' remainder'])


  if (r==1) | (r == -1),  % Note that | is the symbol for "or"
   disp(' This n has passed Millers test to base b')

  else
   disp(' This n has failed Millers test to base b')

  end
  clear power remainder   % This is just to prevent problems
                          % when you run the M-file again
