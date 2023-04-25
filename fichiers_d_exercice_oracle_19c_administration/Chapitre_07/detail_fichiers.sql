SELECT * FROM 
( -- fichiers permanents
SELECT file_id, df.tablespace_name, file_name, round(bytes/1024/1024) as courant_mo, autoextensible as autoext, 
    round(increment_by * tbs.block_size/1024) as increment_by_ko, round(maxbytes/1024/1024) as limite_mo,
    power(2,22)*tbs.block_size/1024/1024 as max_mo
    FROM dba_data_files df JOIN dba_tablespaces tbs ON df.tablespace_name=tbs.tablespace_name
UNION
-- fichiers temporaires
SELECT file_id, tf.tablespace_name, file_name, round(bytes/1024/1024) as courant_mo, autoextensible as autoext, 
    round(increment_by*tbs.block_size/1024) as increment_by_ko, round(maxbytes/1024/1024) as limite_mo,
    power(2,22)*tbs.block_size/1024/1024 as max_mo
FROM dba_temp_files tf JOIN dba_tablespaces tbs ON tf.tablespace_name=tbs.tablespace_name)
WHERE tablespace_name IN ('&NOM_TBS');
