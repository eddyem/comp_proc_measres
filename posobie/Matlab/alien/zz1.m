% Draws a zigzag based on lengths of 100 and l
% and angles theta1, theta2 (input in degrees).
% This is the most basic version where you have to provide
% the size of the graphics window and the number of steps.

l=input('Type the value of l ');
theta1=input('Type the angle theta1 in degrees ');
theta2=input('Type the angle theta2 in degrees ');
steps=input('Type the number of steps ');
xl=input('Type the lower bound of x ');
xu=input('Type the upper bound of x ');
yl=input('Type the lower bound of y ');

yu=yl+xu-xl;  % This is to make the window square

theta1=theta1*pi/180;  % Convert to radians!
theta2=theta2*pi/180;



x1=100; y1=0; x2=100+l; y2=0; 
% (x2,y2) is the point reached at the end of step 1

x=[0 x1]; y=[0 y1]; plot(x,y,'g'); 
% This plots the line joining (0,0) to (100,0) in green

axis([xl,xu,yl,yu]);
axis('square');


hold on  % So that all plots are made on the same picture

x=[x1 x2]; y=[y1 y2]; plot(x,y,'r');
% This plots the line joining (100,0) to (100+l,0) in red

        for j=1:steps-1   % Now we do the zigzag, starting with step 2

        x1=x2+100*cos(j*theta1);
        y1=y2+100*sin(j*theta1);
        % These calculate the end of the next 'zig'

        x=[x2 x1]; y=[y2 y1]; plot(x,y,'g');
        % This plots the next 'zig' in green

        x2=x1+l*cos(j*theta2);
        y2=y1+l*sin(j*theta2);
        % These calculate the end of the next 'zag'

        x=[x1 x2]; y=[y1 y2]; plot(x,y,'r');       
        % This plots the next 'zag' in red
        end;

hold off

                                            



