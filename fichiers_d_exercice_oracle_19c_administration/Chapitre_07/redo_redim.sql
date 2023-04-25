-- Procédure de redimensionnement des fichiers redo logs

/*
Commandes utiles :
	alter system switch logfile;
	alter system checkpoint;
*/

-- Controle initial
select group#, status, members, bytes/1024/1024 as taille_mo from v$log order by group#;
select * from v$logfile order by group#;


-- Modifications
alter database drop logfile group 1;
alter database add logfile group 1
('C:\APP\ORACLE\ORADATA\COMPTA\REDO01a.rdo', 
 'C:\APP\ORACLE\ORADATA\COMPTA\REDO01b.rdo')
 size 100M;
 
alter database drop logfile group 2;
alter database add logfile group 2
('C:\APP\ORACLE\ORADATA\COMPTA\REDO02a.rdo', 
 'C:\APP\ORACLE\ORADATA\COMPTA\REDO02b.rdo')
 size 100M;

alter database drop logfile group 3;
alter database add logfile group 3
('C:\APP\ORACLE\ORADATA\COMPTA\REDO03a.rdo', 
 'C:\APP\ORACLE\ORADATA\COMPTA\REDO03b.rdo')
 size 100M;
 

