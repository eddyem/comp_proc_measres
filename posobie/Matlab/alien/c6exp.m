% c6exp.m - Chapter 6: exponential distribution illustration
%
help c6exp
disp('This M-file illustrates 3 probability distributions...')

      rand('seed',0); n=20000;% Reset the 'seed' value
      m=1.2; s=1.2;           % mean and std
      x = unirand(0,2.4,n,1); % Uniform in (0,2.4)

     randn('seed',0);         % Reset the 'seed' value
      y = normrand(m,s,n,1);  % Normal N(1.2,1.2)

      rand('seed',0);         % Reset the 'seed' value
      z = exprand(m,n,1);     % Exponential

      subplot(311); hist(x,90)% Plot x
      axis([0 2.4 0 225])     % Cut the right half
      hold on; plot([m m],[0 225],':r'); hold off

      subplot(312); hist(y,20)% Plot y
      hold on; plot([m m],[0 4000],':r'); hold off

      subplot(313); hist(z,40)% Plot z
      axis([0 10 0 6852])     % Cut the right half
      hold on; plot([m m],[0 6852],':r'); hold off

%%% The following lines are for "cumsum" %%%
t=cumsum(z); 
fprintf('For n = %d, t first and last = %10.4f, %10.4f\n',n,t(1),t(n));
format compact; tm=hist(z,40); sum(tm);tm=max(tm)
