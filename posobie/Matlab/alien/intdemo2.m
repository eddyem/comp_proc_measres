%  intdemo2.m  --- Chapter 18 : example M-file illustrating (in 2D)
%
%  Piecewise linear and cubic interpolations vs global LS appxomations.
%
help intdemo2; 
disp('                     Press any key to continue');pause 

xt = 0:0.01:1;  yt = 0:0.01:1 ;  
xplot = xt;  yplot = yt ; %<<=== 1D vector
[xt yt]=meshgrid(xt,yt) ; %<<::: 2D Points for Plots ::::::::::::::
x=xt;  y=yt ;             %<<==== Set up Plot Points 
 R = sqrt ( (x-1/2).^2 + (y-1/4).^2 ) ;
zt = R.*log(R+eps^2) ;   %% <<==== Main Function for Plots
                         %% True values at lots of points for plot
v1 = min(min(zt)) ;
v2 = max(max(zt)) ;
V = [v1 v1/2 v1/4 (v1+v2)/2 v2/4 v2/2 v2]

x = 0:0.25:1  ;  y = 0:0.25:1 ; % <<<=== Interpolation points given
[X Y]=meshgrid(x,y) ;
x = X;  y = Y ; clear X; clear Y;
 R = sqrt ( (x-1/2).^2 + (y-1/4).^2 ) ;
 z = R.*log(R+eps) ;

%_____________% Global
% First  test %        % Test points xi yi for error tests
%-------------%

xi = 0.1:.15:0.9 ;  yi = xi ; [n m] = size(xi) ; m = m*n;
[u v]=meshgrid(xi,yi) ;
xi = u; yi = v;    R = sqrt ( (xi-1/2).^2 + (yi-1/4).^2 );
yi_t = R.*log(R+eps) ;  % True values for error checks
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part I  - Least squares fitting %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  CL = polyfit2(x,y,z, 'linear') ;
  ZL = polyval2(CL, xi,yi, 'linear');
  CC = polyfit2(x,y,z, 'cubic') ;
  ZC = polyval2(CC, xi,yi, 'cubic');
Error_L = sqrt( norm( ZL - yi_t, 'fro')^2 / m)  ; clear ZL;
Error_C = sqrt( norm( ZC - yi_t, 'fro')^2 / m)  ; clear ZC;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part II - Piecewise fitting %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
li = interp2(x,y,z, xi,yi);
ci = interp2(x,y,z, xi,yi, 'cubic'); clear xi; clear yi;
error_L = sqrt( norm( li - yi_t, 'fro')^2 / m)  ;
error_C = sqrt( norm( ci - yi_t, 'fro')^2 / m)  ;


%_____________%         Piecewise 
% Second test %         % Re-select Test points xi yi for error tests
%-------------%

xi = 0.25:.05:0.65 ;  yi = 0.1:0.05:0.4;  [n m] = size(xi) ; m = m*n;
[u v]=meshgrid(xi,yi) ;
xi = u; yi = v;  R = sqrt ( (xi-1/2).^2 + (yi-1/4).^2 ) ;
yi_t = R.*log(R+eps);  % True values for error checks

li = interp2(x,y,z, xi,yi);
ci = interp2(x,y,z, xi,yi, 'cubic'); clear xi; clear yi;
error_L2 = sqrt( norm( li - yi_t, 'fro')^2 / m)  ;
error_C2 = sqrt( norm( ci - yi_t, 'fro')^2 / m)  ;

lt = interp2(x,y,z, xt,yt) ;
ct = interp2(x,y,z, xt,yt, 'cubic') ;

%________________________%
% Plot at lots of points %
%------------------------%
figure(1);clg
         contour(zt,V, xplot,yplot,'-y'); hold on;
         contour(lt,V,xplot,yplot, ':r');
    c2 = contour(ct,V,xplot,yplot, ':g');   %% clabel(c2) ;
ylabel('Function of SIN(x^2+y^3)');
xlabel('File intdemo2.m - example 2D (yellow : true)');
title('2D interpolations - Red Bi-linear vs Green Bi-Cubic');

figure(2);clg, meshz(lt); title('Viewing 3D graph - meshz');  
figure(3);clg, surf(ct);  title('Viewing 3D graph - surf'); 

disp('May try waterfall at this stage')

disp('%%%%%%%%%%%% RMS Error Comparisons %%%%%%%%%%%')
fprintf('AT set 1 of test points, errors are \n')
fprintf('   Linear least squares = %9.3f \n',Error_L)
fprintf('   Cubic  least squares = %9.3f \n',Error_C)
fprintf('   Linear interpolation = %9.3f (smallest = best)\n',error_L)
fprintf('   Cubic  interpolation = %9.3f \n',error_C)
fprintf('AT set 2 of test points, errors are \n')
fprintf('   Linear interpolation = %9.3f \n',error_L2)
fprintf('   Cubic  interpolation = %9.3f \n',error_C2)
disp('........................ End of intdemo2.m...............')

