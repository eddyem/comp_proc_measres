% Example M-file == cont4.m
%
% is an illustration File for use of "contour" command
%
help cont4
disp('Contour plot 1')
      x0 = -2 : 0.4 : 2;       y0 = -2 : 0.25 : 2;    % Two 1D vectors

      [x y]=meshgrid(x0,y0) ;   % Two matrices
   F1=(x.^6-y.^3-0.5) .* exp(-x.^2-y.^2);          % Note F1 is now a matrix
   M=max(F1);  m=min(F1);             % These are row vectors
   V=[m 0 M];                         % a vector of some heights of F1
   C1 = contour(x,y,F1,V,'-r');       % MAIN step

%% C1 = contour(F1,V, x0,y0, '-r');   % Old Usage - Confusing %
%% C1 = contour(x0,y0,F1,V,'-r');     % MAIN step - alternative zero
%% C1 = contour(F1,V,'-r');           % MAIN step - alternative one
%% C1 = contour(x0,y0,F1,V,'-r');     % MAIN step - alternative two
%% C1 = contour(F1,6,'-r');           % MAIN step - alternative three

   clabel(C1);                        % Optional labels (numbers)
   grid ;                             % Optional
   title('Contour plot of 2 variables')
disp('..............   ......... pause'); pause
   
disp('Contour plot 2')
   hold off
   F2 = (x.^2 - y.^2)*20 - 5 ;
   V = [-eps 0 eps] ;
   contour(x0,y0,F2,V, 'ob'); hold on
   contour(x0,y0,F2,V, '-b'); 
   contour(x, y, F1,V, '*g');
   contour(x, y, F1,V, '-g');
   title('Green circles for F1=0 and blue stars for F2=0'); hold off
