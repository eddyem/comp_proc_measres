% Draws the Taylor approximation to a sine curve or order n
% but here the scaling is left fixed after the actual sine
% curve is drawn

k=input('Type the number of terms of the Taylor series for sine:  ');

x=0:.05:6.30;

z=sin(x);
plot(x,z,'g')    %Actual sine curve is drawn in green

axis(axis)  % Freeze the scaling
hold on

pause

        y=x;
        s=-1;
        w=x;
        for j=1:k-1
                w=w.*x.*x/(2*j*(2*j+1));
                y=y+s*w;
                s=-s;
        end;
plot(x,y,'r')   %Approximation is drawn in red
hold off



