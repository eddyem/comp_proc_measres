% M-file to find the gcds of n pairs of numbers 
% which are <= 1000 and
% find what percentage have gcd equal to 1.  

n=input('How many pairs of numbers to do want to consider?  ');
count1=0;           % count1 counts the number of pairs with gcd 1
t=fix(clock);
s=t(6);
rand('seed',s);
for i=1:n

        a=round(1000*rand);
        b=round(1000*rand);
        x=gcdiv(a,b);
                if x==1 count1=count1+1;
                end;

end;
disp('The percentage of the numbers with gcd 1 is')
disp(count1*100/n)


