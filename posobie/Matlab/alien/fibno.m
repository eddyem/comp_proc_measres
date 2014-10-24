%M-file to plot the Fibonacci numbers f(i) less than 1000.
%The Fibonacci numbers are defined by f(1)=f(2)=1
%and f(i+2)=f(i+1)+f(i) for i=1,2,3,...
%They are calculated and then plotted with i along the
%horizontal axis and f(i) along the vertical axis.

 f=[1  1]; 
  k=1; 
    while f(k) < 1000 
      f(k+2)=f(k+1)+f(k); 
      k=k+1; 
    end
  f
  plot(f) 