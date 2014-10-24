
% This implements the power algorithm for finding
% rem(a^n,m) (the remainder on dividing a^n by m) reliably
% for large numbers (up to about 8 digits).
%
% Usage: Type pow(a,n,m) where a,n,m are already
% defined, or are explicit numbers as in pow(2,1000,25).


function x=pow(a,n,m)
b = a;
x = 1;
    while n > 0
         d=rem(n,2);
         if d==1
              x=rem(x*b,m);
         end
         b=rem(b * b,m);
         n=(n-d)/2;
    end

