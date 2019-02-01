
delimiter //
CREATE FUNCTION disableAccount (account_id int)


RETURNS INTEGER
deterministic

BEGIN

declare value int;
select count(*) into value from account where id = account_id;

if(value)=1 then
	update account set active = 0 where id = account_id;
end if;

RETURN value;
END//
delimiter ;