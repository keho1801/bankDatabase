drop  procedure subtractBalance;
delimiter //
CREATE DEFINER=root@localhost PROCEDURE subtractBalance(in account_id int, in value int)
BEGIN
    -- om order id inte finns eller null
    declare text varchar(100);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
SELECT 'An error has occurred, operation rollbacked an
d the stored procedure was terminated';
END;
    
    start transaction;
    
    if(select count(*) from account where id = account_id) =1 then
        set text = 'Utbetalning';
        
		insert into history (accountid,amount,comment) values (account_id,value,text);
        
        update account set balance =(balance-value)  where id = account_id;
        
	end if;
        
 
    commit;

END//
Delimiter ;


