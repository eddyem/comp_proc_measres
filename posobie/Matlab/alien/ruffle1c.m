% ruffle1c.m
% a rough riffle of 2k cards, with the cycle structure found


k=input('Type k, where there are 2k cards ');
m=k+round(2*rand(1,1));
% The pack is cut into m and 2k-m cards where k <= m <= k+2

m

p2=input('Type the probability of 2 cards going into a slot  ' );
p3=input('Type the probability of 3 cards going into a slot  ' );
p1=m/(2*k-m+1) - 2*p2 -3*p3;
p0=1-p1-p2-p3;

break_out=0;

     if ((p1<0)|(p0<0))
     break_out=1;
     end

if break_out==0   %This is just to safeguard against negative probabilities

first=1;  % The first card in slot 1
re_ordering=[];  % re_ordering will be the face-value ordering after the ruffle
slot=1;
last=1;
position_perm=[];   % position_perm will be the 
                    % position permutation after the ruffle

while (slot<2*k-m+1) & (last<m)
        r=rand(1,1);
                if r<p0 number_in_slot=0;
                elseif r<p0+p1 number_in_slot=1;
                elseif r<p0+p1+p2 number_in_slot=2;
                else number_in_slot=3;
                end
        last=first+number_in_slot-1;
                if last>m last=m;
                end
                if slot<2*k-m+1 re_ordering=[re_ordering first:last m+slot];
                else re_ordering=[re_ordering first:last];
                end

first=last+1;
slot=slot+1;
end

        if last<m re_ordering=[re_ordering last+1:m];
        end

        if length(re_ordering)<2*k re_ordering=[re_ordering length(re_ordering)+1:2*k];
        end
disp('*******************************************************')
disp('The new face-value ordering, when the cards started as')
disp('1,2,3,...,2k  is')
re_ordering
disp('Hit Enter to continue')
pause


% Now want to invert the ordering of the cards to get the permutation
% in the form position_perm(i)=j means card in position i goes to position j

standard=1:2*k;

[sortperm index]=sort(re_ordering);
disp('********************************************************')
disp('The position permutation is ')
position_perm=standard(index)

disp('Hit Enter to continue')
pause

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


end % of if break_out=0




