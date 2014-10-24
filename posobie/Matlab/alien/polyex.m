% M-file find the polyfit approximation to a sine curve

a=0:.05:2*pi;
b=sin(a);
c=polyfit(a,b,5);
d=polyval(c,a);
plot(a,d,'r')
hold on
pause
plot(a,b,'g')
hold off
