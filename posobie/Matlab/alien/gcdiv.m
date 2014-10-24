% Function for calculating the gcd of a and b.
% To use, type e.g. gcd(69,15)
% For convenience we make sure a,b non-negative to start with
 
  function h=gcdiv(a,b) 
  if a<0 a=-a;
  end
  if b<0 b=-b;
  end
    while b > 0 
      r=rem(a,b); 
      a=b; 
      b=r; 
    end
    h=a;

