drop procedure monthlyHistory;
delimiter //
CREATE DEFINER=root@localhost PROCEDURE monthlyHistory(account_id int)

BEGIN

declare value int;
declare monthAgo timestamp;

select count(*) into value from history where accountid = account_id;

if(value) > 0 then
select date_sub(current_timestamp(), interval 1 month) into monthAgo;
select * from history where accountid = account_id and  created  between monthAgo and current_timestamp() ;

end if;

END//
delimiter ;