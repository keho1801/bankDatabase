drop function uppdateCustomerCity;
delimiter //
CREATE FUNCTION uppdateCustomerCity (customer_id int, uppdatedCity varchar(50))


RETURNS INTEGER
deterministic

BEGIN

declare value int;
select count(*) into value from customer where id = customer_id;

if(value)=1 then
	update customer set city = uppdatedCity where id = customer_id;
end if;

RETURN value;
END//
delimiter ;