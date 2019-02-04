
delimiter //
CREATE FUNCTION createAccount (customer_id int)


RETURNS INTEGER
deterministic

BEGIN

declare value int;
select count(*) into value from customer where id = customer_id;

if(value)=1 then
	insert into account(customerid) values (customer_id);

end if;

RETURN value;
END//
delimiter ;