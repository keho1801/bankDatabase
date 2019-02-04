drop function changePaymentPlan;

delimiter //
CREATE FUNCTION changePaymentPlan (loan_id int, newMonths int)


RETURNS INTEGER
deterministic

BEGIN

declare value int;
declare oldmonths int;
declare oldMonthlyPayment double;
select count(*) into value from loan where id = loan_id;
select months into oldmonths from loan where id  = loan_id;
select monthlyPayment into oldMonthlyPayment from loan where id = loan_id;

 
if(value)=1 then
	update loan set months = newMonths where id = loan_id;
    update loan set monthlyPayment = ((oldMonthlyPayment* oldmonths)/newmonths) where id = loan_id;
end if;

RETURN value;
END//
delimiter ;