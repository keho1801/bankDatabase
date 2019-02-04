drop function grantLoan;

delimiter //
CREATE FUNCTION grantLoan (worker_id int, loan_id int, numberofMonths int)


RETURNS INTEGER
deterministic

BEGIN

declare value int;
declare sum int;
declare loanRate double;
select count(*) into value from loan where id = loan_id;
select amount into sum from loan where id = loan_id;
select rate into loanRate from loan where id = loan_id;
if(value)=1 then
    update loan set workerid = worker_id where id = loan_id;
    update loan set created = current_timestamp where id = loan_id;
    update loan set months = numberofMonths where id = loan_id;
    update loan set monthlyPayment = ((sum*loanRate)/ numberofMonths) where id = loan_id;
    update loan set granted = 1 where id = loan_id;
end if;

RETURN value;
END//
delimiter ;