create or replace package body product_api_pack is

  function create_product(
    pi_name product.prd_name%type,
    pi_price product.prd_price%type
  ) return product.prd_id%type is
    v_res product.prd_id%type;
  begin
    insert into product(
      prd_id,
      prd_name,
      prd_price
    )
    values(
      product_pk.nextval,
      pi_name,
      pi_price
    )
    returning prd_id into v_res;

    return v_res;
  end;

  procedure update_product(
    pi_id product.prd_id%type,
    pi_name product.prd_name%type,
    pi_price product.prd_price%type
  ) is
  begin
    update product
       set prd_name = pi_name,
           prd_price = pi_price
     where prd_id = pi_id;
  end;

  procedure delete_product(pi_id product.prd_id%type) is
  begin
    delete from product p where p.prd_id = pi_id;
  end;

end;
/
