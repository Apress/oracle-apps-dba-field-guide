select ss.sid,ss.value CPU ,se.username,se.program 
from v$sesstat ss, v$session se
where ss.statistic# in 
(select statistic# 
from v$statname 
where name = 'CPU used by this session')
and se.sid=ss.sid 
and ss.sid>6 -- disregard background processes
order by CPU;
