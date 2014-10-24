
function [mean_queue,service_utility,waitingtime,stoptime]...
                                   =queue(arrivetime,servicetime)
% Usage:   
% [mean_q,s_util,wait_time,stop_time] = QUEUE(arrivetime, servicetime);
%
% INPUTS:
%         arrivetime  is the vector of arrival times;
%         servicetime is the vector of service times.
%
% OUTPUTS:
%         stop_time is the vector of end-of-service times;
%         wait_time is the vector of queueing times,  
%                      excluding service times;
%            mean_q is the mean queue length for the period of 
%                      the simulation;
%            s_util is the fraction of total time that service was in use.
format compact;
 if nargin<2, 
 fprintf('Please supply 2 input vectors... \n... but you only gave me %d vectors\n',nargin);
              help queue, return, end
if nargout<4, 
fprintf('Please supply 4 output variables... \n... but you only gave me %d variables\n',nargout);
              help queue, return, end
queuelength=[];queuetime=[];
starttime=arrivetime;
stoptime=starttime;
queuelength=[queuelength 0];
queuetime=[queuetime arrivetime(1)];
n=length(arrivetime);
noservice=arrivetime(1);

% Arrival integrity checks
  a1(1) = arrivetime(1); a1(2:n+1)=arrivetime(1:n);
  a2(1:n) = arrivetime(1:n); a2(n+1)=arrivetime(n); 
  ad = sum (a1 > a2 );
if ad > 0, 
    fprintf('\n Error in calling  M-file = QUEUE.m  ');
  fprintf('\n\n Ooops, your arrival time is not increasing ...\n\n'); 
  mean_queue = 0;
  service_utility = 0;
  waitingtime = 0;
  stoptime = 0;
  return
end 
  clear a1;clear a2;

% queuelength(s) is the length of the queue for queuetime(s) timeunits
%  ie from cumsum(queuetime(s-1)) to cumsum(queuetime(s))
%  ie between event s-1 and event s

k=0;
for i=1:1:n-1;
    stoptime(i)=starttime(i)+servicetime(i);
    if k<i
      k=i;
    end;
    eventtime=starttime(i);

% customer i is being served (start of service is the most recent event)
% customer k is at the back of the queue
% length of queue is k-i+1
% the next event is either (a) the arrival of customer k+1 and Q increases by 1
%                    or (b) end of service for customer i and Q decreases by 1
%                          then if i=k (c) the queue is empty until k+1 arrives
%                                          and the noservicetime is increased
    for j=k+1:1:n;
       if stoptime(i)>arrivetime(j)
       %(a) increasing Q
          starttime(j)=stoptime(i);
          queuelength=[queuelength j-i];
          queuetime=[queuetime arrivetime(j)-eventtime];
          eventtime=arrivetime(j);
          k=j;            
       end;
    end;

%(b) decreasing Q
    queuelength=[queuelength k-i+1];                    
    queuetime=[queuetime stoptime(i)-eventtime];
    eventtime=stoptime(i);

    if k==i
    %(c) empty Q
       queuelength=[queuelength 0];
       wastedtime=starttime(i+1)-eventtime;
       noservice=noservice+wastedtime;
       queuetime=[queuetime wastedtime];
    else
        starttime(i+1)=stoptime(i);
    end;

end;
stoptime(n)=starttime(n)+servicetime(n);
queuelength=[queuelength 1];
queuetime=[queuetime servicetime(n)];

waitingtime=starttime-arrivetime;

mean_queue=queuelength*queuetime'/stoptime(n);

service_utility=1-noservice/stoptime(n);

