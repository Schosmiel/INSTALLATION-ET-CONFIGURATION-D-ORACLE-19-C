-- Création d'un tablespace FACTU dans la base COMPTA
-- Si Windows, adapter les chemins en conséquence

CREATE TABLESPACE FACTU
	DATAFILE
	'/u01/app/oracle/oradata/COMPTA/factu01.dbf' SIZE 10M AUTOEXTEND ON NEXT 50M MAXSIZE 5G,
	'/u01/app/oracle/oradata/COMPTA/factu02.dbf' SIZE 10M AUTOEXTEND ON NEXT 50M MAXSIZE 5G;
