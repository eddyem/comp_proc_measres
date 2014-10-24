function  y1 = snbtfn(k,t,y)
%
%      y1 = snbtfn(k,t,y)
%               supplies the derivative vector for use
%      in 'snowboat.m' as a column vector.  
%	y(1)=x, y(2)=y, y(3)=u, y(4)=v 
%	k(1)=mu, k(2)=kr, k(3)=m
%
%

% parameters and coordinates
mu=k(1); kr=k(2); m=k(3);    g=9.81;
u=y(3); v=y(4);
% derivatives
[fx,fy]	      = fsnow1(y(1),y(2));      % slopes in x and y
[fxx,fxy,fyy] = fsnow2(y(1),y(2));      % second derivs.
zdot   = fx*u + fy*v; 			% z'
zddotx = fxx*u*u+2*fxy*u*v+fyy*v*v;	% easy part of z''
nx=-fx; ny=-fy;		                % components of surface normal
nz=1./sqrt(nx*nx+ny*ny+1);
nx=nx*nz; ny=ny*nz;
rdot=sqrt(u*u+v*v+zdot*zdot);           % |r'|, the speed

% some useful definitions
px=nx-mu*u/rdot; py=ny-mu*v/rdot; pz=nz-mu*zdot/rdot; 
qx=px/pz; qy=py/pz;        
km=kr*rdot/m; gt=km*zdot+zddotx+g;

% set up some matrix notation
D = [-km*u+qx*gt, -km*v+qy*gt]';
A = [1.0-qx*fx, -qx*fy; -qy*fx, 1.0-qy*fy];
X = inv(A)*D;

% finally the derivative column vector
y1 = [ 	y(3)
	y(4)	
        X(1)
        X(2)];        


