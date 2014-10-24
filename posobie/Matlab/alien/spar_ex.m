% spar_ex.m - Chapter 17 example (S17.5) M-file: illustration
format compact; help spar_ex; figure(1)

 A = diag(0:9);    % Generate a diagonal matrix of size 10
 spy(A); grid      % See what it looks like
 a = eye(10,1)*ones(1,10)*2;  % Only Non-zero Row 1 
 b = ones(10,1)*eye(1,10)*3;  % Only Non-zero Column 1
 A = A + a + b;    % Formed an arrow head matrix
 spy(A); grid      % See what it looks like now

 A1 = A;           % Note this A follows the above
 flops(0)          % Flops counter reset (try also tic/toc)
 [L1 U1]=lu3(A1);  % Factorise A as a full matrix
 Work_1 = flops    % Operations performed
 a1 = symrcm(A1)   % Find a new ordering for matrix A1
 A2 = A1(a1,a1)    % Re-order A2=P*A1*P'
 flops(0)          % Flops counter reset (try also tic/toc)
 [L2 U2]=lu4(A2);  % Factorise A as a sparse matrix
 Work_2 = flops    % Operations performed (new)

    xy = [   0       0
            1.5     1.3
            0.35    2.0
           -1.0     1.7
           -1.9     0.68
           -1.9    -0.68
           -1.0    -1.7
            0.35   -2.0
            1.5    -1.3
            2.0     0.0 ],  figure(2)
 gplot(A,xy); hold on        % Plot all edges  
 gplot(A,xy,'o')             % Plot all nodes as 'o'
 for k=1:10,
     tt = sprintf('%d\n',k);
     text(xy(k,1),xy(k,2),tt)    % Print numbers
 end; axis off
 title('A with original ordering a')

 hold off;  figure(3)        % Now plot G(A2) below %%
 xy2 = xy(a1,:);             % Re-order nodes by a1 
 gplot(A2,xy2); hold on      % Plot all edges  
 gplot(A2,xy2,'o')           % Plot all nodes as 'o'
 for k=1:10,
     tt = sprintf('%d\n',k);
     text(xy2(k,1),xy2(k,2),tt)  % Print numbers
 end; hold off; axis off
 title('A1 with new ordering a1')
