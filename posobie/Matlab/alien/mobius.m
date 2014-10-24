% M-file to plot Mobius sequences as bar chart.
% If x is the current term then the next one is (ax+b)/(cx+d).
% The constants a,b,c,d are input by the user.
% You are also asked for the number of iterations
% to be performed and the starting value x0.

a=input('Type a ');
b=input('Type b ');
c=input('Type c ');
d=input('Type d ');

x0=input('Type x0 ');
n=input('Type the number of times to be iterated ');

x=[x0];

for j=1:n
  if x(j)==Inf | x(j)==-Inf
  x(j+1)=a/c;
  else
  x(j+1)=(a*x(j)+b)/(c*x(j)+d);
  end
end;

bar(x)

