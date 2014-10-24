% M-file to calculate the nth iterate of the function
% f(x)=lambda.x(1-x).  You specify the upper and lower bounds
% of x and y for the graphics, and then the value of lambda.
% You then have the opportunity to change lambda.



clear n k x y xl xu yl yu z u v
n=input('Type the number of iterations of f ');

xl=input('Type the lower bound of x ');
xu=input('Type the upper bound of x ');
yl=input('Type the lower bound of y ');
yu=input('Type the upper bound of y ');

dx=(xu-xl)/100;
x=xl:dx:xu;   
z=1;
while z>0
        clg
        hold on
        
        k=input('Type the value of lambda ');
        y=k*x.*(1-x);
                for i=1:n-1
                         y=k*y.*(1-y);
                end
        u=[xl xu];
        v=[.5 .5];
        plot(u,v,'g')
axis([xl xu yl yu]);
        u=[.5 .5];
        v=[yl yu];
        plot(u,v,'g')
        plot(x,y)
        pause
        z=input('Type 0 <Enter> now to end, otherwise type 1 <Enter> ');
        hold off
end







