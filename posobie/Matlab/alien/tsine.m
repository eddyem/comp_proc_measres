% Draws the Taylor approximation 
% to a sine curve of degree 2k-1
k=input('Type the number of terms of the Taylor series for sine:  ');
x=0:.05:2*pi;
z=sin(x);
plot(x,z,'g') %Actual sine curve is drawn in green
hold on
pause % This holds up execution until Enter is pressed
        w=x;
        y=x;
        s=-1;
        for j=1:k-1
                w=w.*x.*x/(2*j*(2*j+1));
                y=y+s*w;
                s=-s;
        end
plot(x,y,'r') % approximation is drawn in red  
hold off