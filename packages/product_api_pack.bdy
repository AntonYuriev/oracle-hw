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
    if pi_id is null then
      raise_application_error(c_error_code_wrong_input_param, c_error_msg_wrong_input_param);
    end if;

    update product
       set prd_name = pi_name,
           prd_price = pi_price
     where prd_id = pi_id;
    
    if sql%rowcount = 0 then
      raise_application_error(c_error_code_product_not_found, c_error_msg_product_not_found);
    end if;
  end;

  procedure delete_product(pi_id product.prd_id%type) is
  begin
    if pi_id is null then
      raise_application_error(c_error_code_wrong_input_param, c_error_msg_wrong_input_param);
    end if;

    delete from product p where p.prd_id = pi_id;
  end;

end;
/
