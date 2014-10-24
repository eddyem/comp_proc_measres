% M-file to find primes < 5000

r=11;
p=[2,3,5,7];
i=4;  %i counts the number of primes so far
while r<5000
        s=3;
        while s*s<=r & rem(r,s)>0
                s=s+2;
        end;
        if  rem(r,s)>0 
                i=i+1;
                p(i)=r;
        end;
        r=r+2;
end;

                




