create or replace package test_product_api_pack is

  --%suite(Test product_api_pack)
  --%suitepath(shop)  

  --%test(Создание продукта с валидными параметрами должно быть успешно)
  procedure create_product_valid_params;

  --%test(Создание продукта с null наименованием должно завершиться ошибкой)
  --%throws(-1400)
  procedure create_product_null_name;

  --%test(Создание продукта с null стоимостью должно завершиться ошибкой)
  --%throws(-1400)
  procedure create_product_null_price;

  --%test(Создание продукта с отрицательной стоимостью должно завершиться ошибкой)
  --%throws(-2290)
  procedure create_product_negative_price;

  --%test(Изменение данных продукта с валидными параметрами должно быть успешно)
  procedure update_product_valid_params;

  --%test(Изменение данных продукта с null наименованием должно завершиться ошибкой)
  --%throws(-1407)
  procedure update_product_null_name;

  --%test(Изменение данных продукта с null стоимостью должно завершиться ошибкой)
  --%throws(-1407)
  procedure update_product_null_price;

  --%test(Изменение данных продукта с отрицательной стоимостью должно завершиться ошибкой)
  --%throws(-2290)
  procedure update_product_negative_price;

  --%test(Изменение данных продукта c null id должно завершиться ошибкой)
  --%throws(-20100)
  procedure update_product_with_null_id;

  --%test(Изменение данных несуществующего продукта должно завершиться ошибкой)
  --%throws(-20110)
  procedure update_non_existing_product;

  --%test(Удаление существующего продукта должно быть успешно)  
  procedure delete_existing_product;

  --%test(Удаление несуществующего продукта должно быть успешно)
  procedure delete_non_existing_product;

  --%test(Удаление продукта c null id должно завершиться ошибкой)
  --%throws(-20100)
  procedure delete_product_with_null_id;

end;
/
