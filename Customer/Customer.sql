SELECT * FROM detail_1.customer;
CREATE USER 'User_1'@'localhost' IDENTIFIED BY 'PWD_1';
CREATE USER 'User_2'@'localhost' IDENTIFIED BY 'PWD_2';
GRANT SELECT, INSERT ON Detail_1.customer to 'User_1'@'localhost';
GRANT SELECT ON Detail_1.customer to 'User_2'@'localhost';
REVOKE SELECT ON Detail_1.customer FROM 'User_1'@'localhost';
SHOW GRANTS for 'User_1'@'localhost';
-- GROUP BY AND HAVING CLAUSE
SELECT COUNT(C_ID), city FROM Customer GROUP BY city HAVING COUNT(C_ID) > 2 ORDER BY COUNT(C_ID) DESC;

-- Function 
DELIMITER //
CREATE FUNCTION birth_year(age int) RETURNS int DETERMINISTIC
begin
	declare y_d date;
    select curdate() into y_d;
    return year(y_d) - age;
end //
DELIMITER ;

-- Procedure without parameter
DELIMITER //
CREATE PROCEDURE p1()
begin
	select * FROM Customer where age>=30;
end //
DELIMITER ; 

-- Procedure with in parameter
DELIMITER //
CREATE PROCEDURE p2(in ID int)
begin
	select Name, Mobile_No from Customer where C_ID=ID;
end //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE p3(in ct varchar(10))
begin
	select Name, Mobile_No from Customer where City=ct; 
end //
DELIMITER ;

-- Procedure with in and out parameter
DELIMITER //
CREATE PROCEDURE p4(in ID int, out C_Name varchar(20))
begin
	select Name from Customer where C_ID=ID;
end //
DELIMITER ;

-- drop procedure p4;


-- Procedure with inout parameter
DELIMITER //
CREATE PROCEDURE p5(inout var int)
begin
	select Pay_amount into var from Payment where Pay_ID=var;
end //
DELIMITER ;

set @var='101';
call p5(@var);
select @var as pay_amt; 


savepoint a;
insert into Customer values(11, "Dimple", 902375999, "Vapi", 22);

savepoint b;
update Customer set city="Pune" where C_ID=5;
commit;

rollback to b;

-- TRIGGER when city insert surat into table then it should display local. alter
DELIMITER //
CREATE TRIGGER add_city BEFORE INSERT ON Customer FOR EACH ROW
begin
	if new.city="Surat" then 
    set new.city="Local";
    end if;
end //
DELIMITER ;

insert into Customer values(12, "Kevin", 6482987349, "Surat", 23), (13, "Priya", 9834612690, "Vapi", 34);
select * from Customer;

CREATE TABLE BACKUP(C_ID int, Name varchar(30), Mobile_NO bigint);
-- TRIGGER for after insert on table it should we in backup table also.
DELIMITER //
CREATE TRIGGER add_new AFTER INSERT ON Customer FOR EACH ROW
begin
	INSERT INTO backup (C_ID, Name, Mobile_No)
    values(new.C_ID, new.Name, new.Mobile_No);
end //
DELIMITER ;
insert into Customer values(14, "Khana", 6482923349, "Surat", 20);
select * from backup;

-- CURSOR
DELIMITER //
CREATE procedure PRO_CUR()
begin
	
end //
DELIMITER ;
add_city