% 3 x 3 matrix iteration with scaling.
%
% The 3x3 matrix A has to be given before the file is run.
% In other respects this is like matit2.m

x=input('Type first coordinate of starting vector ');
y=input('Type second coordinate of starting vector ');
z=input('Type third coordinate of starting vector ');
n=input('Type the number of iterations ');
v=[x y z]';

format long

for i=1:n
        v=A*v;
        denom=sqrt(v(1)*v(1)+v(2)*v(2)+v(3)*v(3));
        v(1)=v(1)/denom;
        v(2)=v(2)/denom;
        v(3)=v(3)/denom;
        w(i,1)=v(1);
        w(i,2)=v(2);
        w(i,3)=v(3);
end;

disp('These are the unit length iterates of the starting vector')
disp(w)

format short

