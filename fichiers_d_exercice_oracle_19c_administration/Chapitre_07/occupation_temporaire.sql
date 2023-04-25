-- Occupation actuelle des tablespaces temporaires
select tablespace_name, 
	tablespace_size/1024/1024 as taille_mo, 
	allocated_space/1024/1024 as occupe_mo, 
	free_space/1024/1024 as libre_mo
from dba_temp_free_space;