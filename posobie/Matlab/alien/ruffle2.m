% ruffle2.m
% a sequence of number_of_ruffles rough riffles of 2n cards
% This version then displays the new ordering of the cards
% and invites you to move the i-th card to some other position.
% The cards are then arranged in columns in a certain way
% according to the final ordering. 

clear

number_of_ruffles=input('Type the number of ruffles  ');
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

if break_out==0

position_perm=zeros(number_of_ruffles,2*k);
combined_position_perm=zeros(1,2*k);
newperm=zeros(1,2*k);

for ruff=1:number_of_ruffles   % doing more than one rough riffle

first=1;  % The first card in slot 1
re_ordering=[];
slot=1;
last=1;
record=[];

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
        record=[record number_in_slot];
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

% Now want to invert the ordering of the cards to get the permutation
% in the form position_perm(i)=j means card in position i goes to position j

[sortperm index]=sort(re_ordering);
position_perm(ruff,:)=index;

end % of ruff=1:number_of_ruffles


% Now we combine all the ruffles together

storeperm=position_perm(1,:);
newperm=storeperm;
        for ruff=2:number_of_ruffles
                for i=1:2*k
                newperm(i)=position_perm(ruff,storeperm(i));
                end
                storeperm=newperm;
        end

newperm;      % So newperm(i)=j means that altogether the card
              % in position i (that is card number i)
              % goes to position j after
              % number_of_ruffles ruffles.

[sortperm new_ordering]=sort(newperm);

disp('********************************************************')

disp('Now follows the face-value ordering of the cards after the ruffles')

disp(new_ordering)   % This is the ordering after the ruffles are completed


card_in=input('Move the i-th card to position j. Type [i j] ')

card_in_perm=1:2*k;
card_in_perm(card_in(1))=card_in(2);
        for i=card_in(1)+1:card_in(2)
                card_in_perm(i)=i-1;
        end


% Now we compose this permutation with the newperm above

final_perm=zeros(1,2*k);

        for i=1:2*k
                final_perm(i)=card_in_perm(newperm(i));
        end

% Now we turn this into an ordering on the cards

[sortperm final_ordering]=sort(final_perm);

disp('****************************************************')

disp('Now follows the final face-value ordering after a card is moved')

disp(final_ordering)

disp('Hit Enter to see the cards from the final ordering arranged in columns')

pause

% The rest of the program is to arrange the cards in columns

A=-1*ones(2*k,k);  % There is a very slight chance that k columns isn't
                   % enough
A(1,1)=final_ordering(1);
col_length=zeros(1,k);
col_length(1)=1;
no_of_cols=1;
for i=2:2*k
        x=final_ordering(i);
        flag=0;
        for j=1:no_of_cols
                if x==A(col_length(j),j)+1
                        A(col_length(j)+1,j)=x;
                        col_length(j)=col_length(j)+1;
                        flag=1;
                end
        end % of j-loop
                if flag==0
                        A(1,no_of_cols+1)=x;
                        no_of_cols=no_of_cols+1;
                        col_length(no_of_cols)=1;
                end

end

A(1:max(col_length),1:no_of_cols)

end % of if break_out=0




