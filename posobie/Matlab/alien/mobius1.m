% M-file to print out Mobius sequences.
% If x is the current term then the next one is
% (ax+b)/(cx+d).  The constants a,b,c,d are input
% by the user.  Also the starting value x0 and the
% number n of iterations.  The terms of the sequence are
% displayed in a column, using long format.

format long

a=input('Type a ');
b=input('Type b ');
c=input('Type c ');
d=input('Type d ');

x0=input('Type x0 ');
n=input('Type the number of times to be iterated ');

x=[x0];

for j=1:n
  if x(j)==Inf
  x(j+1)=a/c;
  else
  x(j+1)=(a*x(j)+b)/(c*x(j)+d);
  end
end;

disp('The iterates are')
disp(x')

format short
