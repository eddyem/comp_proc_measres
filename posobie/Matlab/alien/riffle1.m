% in-shuffle with even number of cards

k=input('Type k, where there are 2k cards ')
number_of_shuffles=input('Type the number of shuffles ')

start_ordering=1:2*k;

position_perm=start_ordering;
store=zeros(1,2*k);
        for j=1:number_of_shuffles
                for i=1:2*k
                        store(i)=rem(2*position_perm(i),2*k+1);
                end
        position_perm=store;
        end
position_perm
[sortperm final_ordering]=sort(position_perm);
final_ordering



