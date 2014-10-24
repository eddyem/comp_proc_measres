% M-file for producing a random permutation of 1,...,n
% and then breaking it into disjoint cycles

n=input('Type n ');

p=randperm(n)

pstart=p;  % Just in case you want to be reminded what p was at the end

disp('Now follow the cycles of this permutation')

i=0;

while i<n
        i=i+1;
        if p(i)>0 
                v=[];
                flag=0;  % flag is just to trick
                         % the computer into entering
                         % the while loop
                first=i;
                while (first ~=i) | (flag==0)             

                                     % ~= means not equal
                                     % and | means or
                        flag=1;
                        r=first;
                        v=[v r];
                        first=p(first);
                        p(r)=0;  % The entries in the cycle are changed
                                 % to zero to indicate that they
                                 % have been `used'
                end;
                disp(v)
        end;
end;

