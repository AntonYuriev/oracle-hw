-- выкл отображение замены переменных
set verify off
-- считываем версию патча
@services/patch_ver.sql

-- спулим в файл
spool uninstall_&patch_num..log replace

-- описание приложения
set appinfo 'Uninstall Script Oracle patch &patch_num'

-- при возникновении ошибки идем дальше
whenever sqlerror continue

-- вывод системной инфы
@@services/banner.sql

prompt ================

---- удаляются объекты
prompt drop package test_product_api_pack;
drop package test_product_api_pack;

prompt drop package product_api_pack;
drop package product_api_pack;

prompt drop sequence product_pk;
drop sequence product_pk;

prompt drop table product;
drop table product;

prompt ================
prompt 
prompt Patch was successfull uninstalled


-- отрубаем спулл
spool off

exit;
