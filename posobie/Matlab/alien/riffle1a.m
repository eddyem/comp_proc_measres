% riffle1a.m
% order of 2 mod 2k+1
% n=2k

k=input('Type k, where 2k=n ');
a=2;
r=1;
        while a~=1
                a=rem(2*a,2*k+1);
                r=r+1;
        end

disp('The smallest power of 2 congruent to 1 mod 2k+1 is the rth power where')
r

