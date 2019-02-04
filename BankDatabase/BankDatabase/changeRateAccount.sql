
delimiter //
CREATE FUNCTION changeRateAccount (account_id int, newrate double)


RETURNS INTEGER
deterministic

BEGIN

declare value int;
select count(*) into value from account where id = account_id;

if(value)=1 then
	update account set rate =  newrate where id = account_id;
end if;

RETURN value;
END//
delimiter ;