----------------------------------------------
-- Liste de tous les fichiers de la base
----------------------------------------------
COL NOM FORMAT A90
SELECT TYPE, NOM FROM
(SELECT 1 AS NB, 'INIT' AS TYPE, VALUE AS NOM FROM V$PARAMETER WHERE NAME='spfile'
UNION
SELECT 2, 'CTL', NAME FROM V$CONTROLFILE
UNION
SELECT 3, 'DATA', NAME FROM V$DATAFILE
UNION
SELECT 4, 'LOG', MEMBER FROM V$LOGFILE
UNION
SELECT 5, 'TEMP', NAME FROM V$TEMPFILE
UNION
SELECT 6, 'ARCH', NAME FROM V$ARCHIVED_LOG WHERE NAME IS NOT NULL)
ORDER BY NB, NOM;