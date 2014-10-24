% 2 x 2 matrix iteration with scaling.
% 
% The 2x2 matrix A has to be given before the file is run.
% The starting vector v is input, and the file works out
% in succession Av, (A^2)v,... but it scales each
% answer to be unit length.  The resulting vectors
% are written into an n x 2 matrix w, which is
% displayed after the calculations are complete.
%
% Long format is used, but format returns to short at the
% end.

format long

x=input('Type first coordinate of starting vector ');
y=input('Type second coordinate of starting vector ');
n=input('Type the number of iterations ');
v=[x y]';


for i=1:n
        v=A*v;
        denom=sqrt(v(1)*v(1)+v(2)*v(2));
        v(1)=v(1)/denom;
        v(2)=v(2)/denom;
        w(i,1)=v(1);
        w(i,2)=v(2);
        
end;

disp('The unit length iterates of the starting vector are:')
disp(w)

format short

