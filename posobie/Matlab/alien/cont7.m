% cont7.m - Chapter 18 : example M-file for illustrating
%
%      Contour plots and approximations by 2D least squares
format compact;help cont7
      
  x = 0:0.25:1;          y = x ;       % To set up
  [x y]=meshgrid(x0,y0) ;              % interpolation nodes
       R = sqrt ( (x-1/2).^2 + (y-1/4).^2 );
       z = R.*log(R+eps) ;             % z values at (x,y)

%%%%% (0) %%%% 3D Curve (true solution)

      x0 = 0:0.01:1;  y0 = x0 ;     
      [xi yi]=meshgrid(x0,y0) ;     
       R = sqrt ( (x-1/2).^2 + (y-1/4).^2 );
  z_plot = R.*log(R+eps) ;          % z_plot values at (x,y)

          figure(1); waterfall(z_plot);    clear z_plot;
          title('Example 3 of Chapter 18');clear R;
%%%%% (1) %%%% LS

      C1 = polyfit2( x,y,z, 'linear') ;
      C2 = polyfit2( x,y,z, 'cubic' ) ;       
      Z1 = polyval2( C1, xi,yi, 'linear');    %% Global Bilinear
      Z2 = polyval2( C2, xi,yi, 'cubic' );    %% Global Bicubic

               figure(2) % Open a new figure
      %%%%%%%%%%%%%%% Contour Plots %%%%%%%%
      contour(x0,y0,Z1,9,'-g');   hold on;
      contour(x0,y0,Z2,9,'-r');
      title('LS method: Green for linears and Red for cubic')
      ylabel('Example 3 of Chapter 18')

%%%%% (2) %%%% Piecewise bilinear and bicubic

           zL = interp2(x,y,z, xi,yi) ;       % Piecewise linear values
           zC = interp2(x,y,z, xi,yi,'cubic');% Piecewise cubic values
      contour(x0,y0,zL,9, '-y');   hold on;
      contour(x0,y0,zC,9, ':b');
      xlabel('Yellow for p linears and Blue for p cubic')

      hold off
