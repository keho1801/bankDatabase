
delimiter //
CREATE FUNCTION changeRateLoan (loan_id int, newRate double)


RETURNS INTEGER
deterministic

BEGIN

declare value int;
declare numberofMonths int;
declare sum int;
select count(*) into value from loan where id = loan_id;
select Months into numberofMonths from loan where id = loan_id;
select amount into sum from loan where id = loan_id;

if(value)=1 then
	update loan set rate = newRate where id = loan_id;
    update loan set monthlyPayment = ((sum*newRate)/numberofMonths) where id = loan_id;
    
end if;

RETURN value;
END//
delimiter ;