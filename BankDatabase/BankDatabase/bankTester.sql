-- stored procedure
-- (accountid, amount)

call addBalance(1,300);

select * from history;

-- (accountid, amount)

call subtractBalance (2,300);

-- stored functions som måste returnera returnvärden
set @a = createAccount(3);
set @x =removeCustomer(1);
set @b = disableAccount(4);

select @x;
select * from loan;

set @a = changePaymentPlan(8,24);

select @a;

select * from account;

-- query for java tidsintervall VG
select  * from history where accountid = 1 and  created between "2018-01-04" and current_timestamp();


select adddate(current_timestamp(), interval 2 month);

-- kolla senaste månadens historik
select date_sub(current_timestamp(), interval 1 month);