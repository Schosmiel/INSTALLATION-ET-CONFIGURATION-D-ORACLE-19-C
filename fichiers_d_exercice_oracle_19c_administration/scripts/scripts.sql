
----------------------------------------------
-- Liste de tous les fichiers de la base
----------------------------------------------
col nature format a8
col name   format a60
select 'TEMP' as nature, name from v$tempfile
union
select 'DBF', name from v$datafile
union
select 'LOG', member from v$logfile
union
select 'CTL', name from v$controlfile
union
select 'SPFILE', value from v$parameter 
where name='spfile'
order by 1;


----------------------------------------------
-- Simulation d'erreurs
----------------------------------------------
declare
	ORA600 exception;
	pragma exception_init(ORA600, -600);
begin
	raise ORA600;
end;
/

declare
	ORA4030 exception;
	pragma exception_init(ORA4030, -4030);
begin
	raise ORA4030;
end;
/

declare
	ORA1578 exception;
	pragma exception_init(ORA1578, -1578);
begin
	raise ORA1578;
end;
/



---------------------------------------------
-- Contrôle des opérations Datapump en cours
---------------------------------------------

-- Tâches Datapump en cours
select * from v$datapump_job;

-- Sessions Datapump en cours
select * from v$datapump_session;

-- Progression des opérations
set pagesize 50
set linesize 150
col message format a50
select sid, sofar, totalwork, trunc(sofar/totalwork*100, 1) as PCT, message, time_remaining, elapsed_seconds
from  v$session_longops 
where time_remaining >0
-- and sid=&SID
;

