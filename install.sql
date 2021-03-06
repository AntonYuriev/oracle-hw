-- выкл отображение замены переменных
set verify off

-- считываем версию патча
@services/patch_ver.sql

-- спулим в файл
spool install_&patch_num..log replace

-- описание приложения
set appinfo 'Install Script Oracle patch &patch_num'

-- при возникновении ошибки выходим
whenever sqlerror exit failure

-- вывод системной инфы
@@services/banner.sql

-- отключение считывания символов &
set define off


prompt ================
-------- объекты --------

-- другое
prompt >>>> others/_others.sql
prompt 
@@others/_others.sql

-- таблицы
prompt >>>> tables/_tables.sql
prompt 
@tables/_tables.sql

-- пакеты
prompt >>>> packages/_packages.sql
prompt 
@packages/_packages.sql

-- unit тесты
prompt Run unit tests
prompt 
select * from table(ut.run('test_product_api_pack'));

prompt ================
prompt 
prompt Patch was successfull installed

-- отрубаем спулл
spool off

exit;