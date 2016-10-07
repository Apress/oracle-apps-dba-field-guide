spool db_parameters.log
select name, value
from v$parameter order by name;
spool off
