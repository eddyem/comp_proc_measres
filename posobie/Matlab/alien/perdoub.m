% M-file to plot the 75th...100th iterates of 0.5 under
% the quadratic sequence function
% f(x)=lambda.x(1-x) for lambda (=l)
% between two input values l1 and l2.
% The resulting plot in with horizontal axis between
% l1 and l2 and vertical axis between 0 and 1

clear n y z 

l1=input('Type the lower limit l1 of l ');
l2=input('Type the upper limit l2 of l ');
dl=(l2-l1)/100;
clg
hold off


l=l1;
v=ones(1,25);
while l < l2
x=0.5;
    for i=1:100
        x=l*x*(1-x);
        if i>75 
        z(i-75)=x;
        end;
    end;        
plot(l*v,z,'.')
axis([l1 l2 0 1]);
if l==l1 
        hold on
end;
l=l+dl;
end;

hold off




