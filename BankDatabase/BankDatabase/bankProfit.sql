

drop procedure bankProfit;
delimiter //
CREATE DEFINER=root@localhost PROCEDURE bankProfit(loan_id int)

BEGIN

declare value int;
declare profit double;
declare sum int;
declare loanRate double;
select count(*) into value from loan where id = loan_id;
select amount into sum from loan where id = loan_id;
select rate into loanRate from loan where id = loan_id;
if(value)=1 then
set profit = (sum*loanRate) - sum;
select profit;
end if;

END//
delimiter ;