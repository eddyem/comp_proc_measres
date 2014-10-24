%hail.m, which produces the hailstone or 3n+1 function, and
%plots a bar chart

  n=input('Enter n')
  f=[n]; 
  k=1; 
    while n>1 
      k=k+1; 
      if rem(n,2)==0 
        n=n/2; 
      else   
        n=3*n+1; 
      end
    f(k)=n; 
    end
  bar(f)