function  y1 = vdplfn(k,t,y)
%
%      y1 = vdplfn(k,t,y)
%               supplies the derivative vector for use
%      in ODE23K as called by VDERPOL. 
%   N.B. * The output is a COLUMN vector (hence the [  ]'  )
%        * Here,  y(1) is w and  y(2) is v.
%
y1 = [ y(2), k*(1-y(1)*y(1))*y(2)-y(1) ]';

