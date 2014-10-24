% riffle1c.m
% in-shuffle with even number of cards
% breaks it into cycles

k=input('Type k, where there are 2k cards ')

start_ordering=1:2*k;

position_perm=start_ordering;

store=zeros(1,2*k);
                for i=1:2*k
                        store(i)=rem(2*position_perm(i),2*k+1);
                end
        position_perm=store;


disp('**********************************************')
disp('Now follow the cycles')

p=position_perm;

pstart=p;  % Just in case you want to be reminded what p was at the end

i=0;
cyclen=[];

while i<2*k
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
                cyclen=[cyclen length(v)];
        end;
end;

disp('*******************************************')
disp('Now follow the cycle lengths')


cyclen
