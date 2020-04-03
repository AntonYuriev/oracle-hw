create or replace package product_api_pack is

  -- Purpose : API для работы с таблицей Product

  -- создание продукта
  function create_product(
    pi_name product.prd_name%type,
    pi_price product.prd_price%type
  ) return product.prd_id%type;

  -- обновление данных продукта
  procedure update_product(
    pi_id product.prd_id%type,
    pi_name product.prd_name%type,
    pi_price product.prd_price%type
  );

  -- удаление продукта
  procedure delete_product(pi_id product.prd_id%type);

end;
/
