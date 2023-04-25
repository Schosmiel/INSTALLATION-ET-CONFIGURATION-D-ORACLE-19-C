-- Génère un script qui supprime tous les fichiers de la base courante
-- mais préserve les archivelogs et les sauvegardes

-------------------------------
-- Adaptez vos variables ici --
-------------------------------
DEFINE NOM_BASE=COMPTA
DEFINE SCRIPT=/home/oracle/rman/supprime_base_&NOM_BASE..sql
DEFINE CMD_DEL=rm
-------------------------------
-- Fin de section adaptable  --
-------------------------------


-------------------------------
-- Génère le script de suppression --
-------------------------------

set linesize 120
set heading off
set verify off
set feedback off

spool &SCRIPT

-- Arrêt de la base
select 'shutdown abort' 
from dual;

-- Fichiers permanents
select 'host &CMD_DEL ' || FILE_NAME
from dba_data_files
order by 1;

-- Fichiers temporaires
select 'host &CMD_DEL ' || FILE_NAME
from dba_temp_files
order by 1;

-- Fichiers de contrôle
select 'host &CMD_DEL ' || NAME
from v$controlfile
order by 1;

-- Fichiers REDO
select 'host &CMD_DEL ' || MEMBER 
from v$logfile
order by 1;

-- Fichier SPFILE
select 'host &CMD_DEL ' || VALUE 
from v$parameter where name='spfile'
order by 1;

-- Sortie
select 'exit' 
from dual;


spool off

