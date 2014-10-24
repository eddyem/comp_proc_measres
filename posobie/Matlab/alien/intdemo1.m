%  intdemo1.m  --- Chapter 18 : Example M-file for illustrating
%
%  Piecewise linear, cubic and spline 1D interpolations
%
help intdemo1; disp('Press any key to continue');pause

% (1) True Solution Curve by (x_plot,y_plot)
% (2) Interpolation Points(x,y)
% (3) Test points = x_test           (for error testing)
% (4) Approximation at (x_test) test points = y_test
% (5) Approximation at (x_plot) plot points = y_p 
% (6) Analytical (true solution at x_test)  = y_test_t

x_plot = -2 : 0.0095 : 4  ;  %  <<=== For plot only
y_plot = cos(2*x_plot)  ;    %  <<=== For Plot only
 x_test = -1.8 : 0.4:3.8 ;   %  <<--- Test Points   
y_test_t = cos(2*x_test);    % The true function values at x_test
  x = -2 : .5 : 4 ;          % <<::: Interpolation Points
  y = cos(2*x) ;          %  <<::: Values at Interpolation points
m = length(x_test);       %  <<=== m is the number of test points
format compact

figure(1); plot(x_plot,y_plot,':y');   hold on; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part 1 - Global approximations %  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       C = polyfit(x,y,1) ;
y_test = polyval(C, x_test);
        error_1 = sqrt( norm(y_test - y_test_t)^2 / m ) ;
       y_p = polyval(C, x_plot) ;             % For plot only ---
       plot(x_test,y_test,'ro', x_plot,y_p,'-r');

       C = polyfit(x,y,3) ;
y_test = polyval(C, x_test);
        error_3 = sqrt( norm(y_test - y_test_t)^2 / m ) ;
       y_p = polyval(C, x_plot) ;             % For plot only ---
       plot(x_test,y_test,'g*', x_plot,y_p,'-g');

       C = polyfit(x,y,6) ;
y_test = polyval(C, x_test);
        error_6 = sqrt( norm(y_test - y_test_t)^2 / m ) ;
       y_p = polyval(C, x_plot) ;             % For plot only ---
       plot(x_test,y_test,'bx', x_plot,y_p,'-b');

ylabel('Interpolation to function COS(2x)');
xlabel('File intdemo1.m - example 1D (yellow : true)');
title('1D global approximations:  Linear(o), Cubic(*),  Order 6(x)');

% These are global approximations
figure(1); disp('Press any key to continue');pause

figure(2);   plot(x_plot,y_plot,':y');      hold on;   
text(-2.5,-2.0, 'Please wait .......')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part 2 - Piecewise approximations %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_test = interp1(x,y, x_test,'linear')';          % AT test points
        error_l = sqrt( norm(y_test - y_test_t)^2 / m ) ;
       y_p= interp1(x,y, x_plot,'linear')';  % For plot only ---
       plot(x_test,y_test,'ro', x_plot,y_p,'-r')';

y_test = interp1(x,y, x_test,'cubic')';      % AT test points
        error_c = sqrt( norm(y_test - y_test_t)^2 / m ) ;
       y_p= interp1(x,y, x_plot,'cubic')';   % For plot only ---
       plot(x_test,y_test,'g*', x_plot,y_p,'-g');

y_test = interp1(x,y, x_test,'spline')';     % AT test points
        error_s = sqrt( norm(y_test - y_test_t)^2 / m ) ;
       y_p= interp1(x,y, x_plot,'spline')';  % For plot only ---
       plot(x_test,y_test,'bx',  x_plot,y_p,'-b');
ylabel('Interpolation to function COS(2x)');
xlabel('File intdemo1.m - example 1D (yellow : true)');
title('1D piecewise approximations:  Linear(o),  Cubic(*),  Spline(x)');

fprintf('intdemo1.m --- Piecewise linear, cubic and spline 1D interpolations\n\n')

disp('........... RMS Error Comparisons ..........')
Global_Case = [error_1 error_3 error_6]
fprintf('from DEG=1    DEG=3     DEG=6\n')
Piecew_Case = [error_l error_c error_s]
fprintf('from Linear   Cubic     Spline\n')
fprintf('----------------- Conclusions --------------\n')
fprintf('Best = Spline   --->>   Worst = Global linear\n')

axis([-2 4 -1 1])
figure(2);disp('Press any key to continue');pause;hold off
disp('...........  End of intdemo1.m .................');

% note: interp1 can take x of n x 1 but output is in 1 x n %

