%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								%
%	script.m						%
%								%
%		A simple example of a MATLAB script file	%
%		Just a list of commands, as you would have	%
%		typed them. Comment lines begin %....		%
%								%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A=[1   1/2  1/3
   1/2 1/3  1/4
   1/3 1/4  1/5]
B=[1 0  0]'
det(A)
X=inv(A)*B
disp('Press any key to continue')
pause

C=[1:4; 8:-1:5; 1 5 4 8; 2 6 3 7];
disp(C)
eig(C)
disp('Press any key to continue')
pause

S=C+C';
disp(S)
L=eig(S)
[U,D]=eig(S)
disp('Press any key to continue')
pause

C
for n=1:4
 row=C(n,:)
 col=C(:,n)
disp('Hit <Enter>')
 pause
end

for x=-2:2
 if x >= 0 
  y=sqrt(x)
 else
  y=sqrt(-x)
 end
end

