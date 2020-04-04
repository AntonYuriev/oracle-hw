create or replace package product_api_pack is

  -- Purpose : API для работы с таблицей Product

  -- Коды ошибок
  c_error_code_wrong_input_param constant number := -20100;
  c_error_code_product_not_found constant number := -20110;

  -- Сообщения ошибок
  c_error_msg_wrong_input_param constant varchar2(200 char) := 'Некорректное значение параметра';
  c_error_msg_product_not_found constant varchar2(200 char) := 'Продукт не найден';

  -- Создание продукта
  function create_product(
    pi_name product.prd_name%type,
    pi_price product.prd_price%type
  ) return product.prd_id%type;

  -- Обновление данных продукта
  procedure update_product(
    pi_id product.prd_id%type,
    pi_name product.prd_name%type,
    pi_price product.prd_price%type
  );

  -- Удаление продукта
  procedure delete_product(pi_id product.prd_id%type);

end;
/
