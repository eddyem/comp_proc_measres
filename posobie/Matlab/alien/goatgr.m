% M-file for the goat problem: draws the graph and the x-axis

hold off % Sometimes a good idea in case there is held graphics!

x=-19:.05:19;
y=2*(x.*x-200).*acos(x/20)-x.*sqrt(400-x.*x) + 100*pi;
plot(x,y)
hold on
plot([-19 19],[0 0],'w')
hold off

