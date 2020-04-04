create or replace package body test_product_api_pack is  

  g_non_existing_product_id product.prd_id%type := -1;

  procedure create_product_valid_params is
    v_product_name  product.prd_name%type := 'Test product name';
    v_product_price product.prd_price%type := 100.23;
    v_product_id    product.prd_id%type;
    v_product_row   product%rowtype;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => v_product_name,
      pi_price => v_product_price
    );
    
    select *
      into v_product_row
      from product t
     where t.prd_id = v_product_id;
  
    ut.expect(v_product_row.prd_name, 'Неверное наименование продукта').to_equal(v_product_name);
    ut.expect(v_product_row.prd_price, 'Неверная стоимость продукта').to_equal(v_product_price);
  end;

  procedure create_product_null_name is
    v_product_id product.prd_id%type;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => null,
      pi_price => 100
    );
  end;

  procedure create_product_null_price is
    v_product_id product.prd_id%type;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => 'Test product name',
      pi_price => null
    );
  end;  

  procedure create_product_negative_price is
    v_product_id product.prd_id%type;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => 'Test product name',
      pi_price => -1
    );
  end;

  procedure update_product_valid_params is
    v_product_name  product.prd_name%type := 'Test product name';
    v_product_price product.prd_price%type := 100;
    v_updated_product_name  product.prd_name%type := 'Updated test product name';
    v_updated_product_price product.prd_price%type := 200;
    v_product_id    product.prd_id%type;
    v_product_row   product%rowtype;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => v_product_name,
      pi_price => v_product_price
    );
    
    product_api_pack.update_product(
      pi_id    => v_product_id,
      pi_name  => v_updated_product_name,
      pi_price => v_updated_product_price
    );

    select *
      into v_product_row
      from product t
     where t.prd_id = v_product_id;
  
    ut.expect(v_product_row.prd_name, 'Неверное наименование продукта').to_equal(v_updated_product_name);
    ut.expect(v_product_row.prd_price, 'Неверная стоимость продукта').to_equal(v_updated_product_price);
  end;

  procedure update_product_null_name is
    v_product_id product.prd_id%type;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => 'Test product name',
      pi_price => 100
    );

    product_api_pack.update_product(
      pi_id    => v_product_id,
      pi_name  => null,
      pi_price => 100
    );
  end;

  procedure update_product_null_price is
    v_product_id product.prd_id%type;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => 'Test product name',
      pi_price => 100
    );

    product_api_pack.update_product(
      pi_id    => v_product_id,
      pi_name  => 'Test product name',
      pi_price => null
    );
  end;

  procedure update_product_negative_price is
    v_product_id product.prd_id%type;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => 'Test product name',
      pi_price => 100
    );

    product_api_pack.update_product(
      pi_id    => v_product_id,
      pi_name  => 'Test product name',
      pi_price => -1
    );
  end;

  procedure update_product_with_null_id is
  begin
    product_api_pack.update_product(
      pi_id    => null,
      pi_name  => 'Test product name',
      pi_price => 100
    );
  end;

  procedure update_non_existing_product is
  begin
    product_api_pack.update_product(
      pi_id    => g_non_existing_product_id,
      pi_name  => 'Test product name',
      pi_price => 100
    );
  end;

  procedure delete_existing_product is
    v_product_id product.prd_id%type;
    v_cnt        number;
  begin
    v_product_id := product_api_pack.create_product(
      pi_name  => 'Test product name',
      pi_price => 100
    );

    product_api_pack.delete_product(v_product_id);

    select count(*) 
      into v_cnt
      from product 
     where prd_id = v_product_id;

    ut.expect(v_cnt).to_equal(0);
  end;

  procedure delete_non_existing_product is
  begin
    product_api_pack.delete_product(g_non_existing_product_id);
  end;

  procedure delete_product_with_null_id is
  begin
    product_api_pack.delete_product(null);
  end;

end;
/
