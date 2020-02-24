-- Buildra Database Schema 
-- Version 1.0

USE buildra; 

--
-- Trigger that prevent update on service records
--
-- The standard pricelist is provided by the region
-- and cannot be modified.  
--

DROP TRIGGER IF EXISTS tgr_prevent_service_update; 

DELIMITER $$

CREATE TRIGGER tgr_prevent_service_update
    BEFORE UPDATE 
    ON service 
    FOR EACH ROW  
BEGIN
    SIGNAL SQLSTATE '38003'
      SET MESSAGE_TEXT = 'services cannot be updated';
END$$ 

DELIMITER ;

--
-- Trigger for updating total price of a work
-- after inserting an offered service 
--

DROP TRIGGER IF EXISTS tgr_calculate_total_on_insert;

DELIMITER $$

CREATE TRIGGER tgr_calculate_total_on_insert  
    AFTER INSERT 
    ON offered_service
    FOR EACH ROW  
BEGIN 

    DECLARE service_price FLOAT; 

    SELECT  price 
    INTO    service_price
    FROM    service S
    WHERE   S.code = NEW.service; 

    UPDATE  work W
    SET     W.total_price = W.total_price + ((service_price * NEW.quantity) * NEW.PCP)
    WHERE   W.code = NEW.work; 

END $$

DELIMITER ;

--
-- Trigger for updating total price of a work
-- after updating an offered service 
--

DROP TRIGGER IF EXISTS tgr_calculate_total_on_update; 

DELIMITER $$

CREATE TRIGGER tgr_calculate_total_on_update
    AFTER UPDATE 
    ON offered_service
    FOR EACH ROW 
BEGIN 

    DECLARE service_price FLOAT; 
    DECLARE old_instance_price FLOAT; 
    DECLARE new_instance_price FLOAT; 

    SELECT  price 
    INTO    service_price
    FROM    service S
    WHERE   S.code = NEW.service; 

    SET old_instance_price = (service_price * OLD.quantity) * OLD.PCP; 
    SET new_instance_price = (service_price * NEW.quantity) * NEW.PCP; 

    UPDATE  work W
    SET     W.total_price = (W.total_price - old_instance_price) + new_instance_price
    WHERE   W.code = NEW.work; 

END $$

DELIMITER ; 

--
-- Trigger for updating total price of a work 
-- after deleting an offered service 
--

DROP TRIGGER IF EXISTS tgr_calculate_total_on_delete; 

DELIMITER $$

CREATE TRIGGER tgr_calculate_total_on_delete
    AFTER DELETE 
    ON offered_service
    FOR EACH ROW 
BEGIN 

    DECLARE service_price FLOAT; 

    SELECT  price 
    INTO    service_price
    FROM    service S
    WHERE   S.code = OLD.service; 

    UPDATE  work W
    SET     W.total_price = W.total_price - ((service_price * OLD.quantity) * OLD.PCP)
    WHERE   W.code = OLD.work; 

END $$

DELIMITER ; 

--
-- Trigger that limits working hours to 8 
--

DROP TRIGGER IF EXISTS tgr_limit_working_hours; 

DELIMITER $$

CREATE TRIGGER tgr_limit_working_hours
    BEFORE INSERT 
    ON presence FOR EACH ROW
BEGIN 

    DECLARE total_working_hours FLOAT; 

    -- check constrain works only on mysql -v > 8.15
    -- so we need a workaround inside the trigger  

    IF (NEW.working_hours <= 0 OR NEW.working_hours > 8) THEN 
        SIGNAL SQLSTATE '22003'
        SET MESSAGE_TEXT = 'working hours must fit ]0, 8] range';
    END IF; 

    SELECT  SUM(working_hours) 
    INTO    total_working_hours
    FROM    presence P
    WHERE   P.employee = NEW.employee
    AND     P.working_date = NEW.working_date; 

    IF total_working_hours + NEW.working_hours > 8 THEN 
        SET NEW.working_hours = 8 - total_working_hours; 
    END IF;

END $$ 

DELIMITER ; 

--
-- MAKE A TRIGGER THAT CONTROL WORK DATE AND PRESENCE DATE 
--

--
-- Trigger for controlling that presence date is 
-- placed after the commission date of a work 
--
/* DROP TRIGGER IF EXISTS tgr_prevent_time_traveling;

DELIMITER $$

CREATE TRIGGER tgr_prevent_time_traveling 
    AFTER INSERT 
    ON presence 
    FOR EACH ROW 
BEGIN 

    DECLARE commission_date DATE; 

    SELECT  commission_date
    INTO    commission_date
    FROM    work 
    WHERE   code = NEW.work;

    IF NEW.working_date < commission_date THEN 
        SIGNAL SQLSTATE '38003'
            SET MESSAGE_TEXT = 'working date must be after the commission date';
    END IF 

END $$

DELIMITER ;  */


--
-- Trigger for updating paycheck of the current month 
-- when a presence has been inserted 
--

DROP TRIGGER IF EXISTS tgr_calculate_paycheck_on_insert; 

DELIMITER $$

CREATE TRIGGER tgr_calculate_paycheck_on_insert
    AFTER INSERT 
    ON presence 
    FOR EACH ROW
BEGIN 

    DECLARE hourly_wage FLOAT; 
    DECLARE salary_flag FLOAT; 

    SELECT  E.hourly_wage 
    INTO    hourly_wage
    FROM    employee E
    WHERE   E.fiscal_code = NEW.employee; 

    SELECT  count(*)
    INTO    salary_flag
    FROM    paycheck P
    WHERE   P.employee = NEW.employee
    AND     year(P.pay_date)  = year(NEW.working_date) 
    AND     month(P.pay_date) = month(NEW.working_date); 

    IF (salary_flag = 0) THEN 
        INSERT INTO paycheck
        (employee, pay, deductions, bonus, pay_date)
        VALUES(NEW.employee, 0, 0, 0, NEW.working_date);
    END IF; 
    
    UPDATE  paycheck P
    SET     P.pay = P.pay + (hourly_wage * NEW.working_hours)
    WHERE   P.employee = NEW.employee
    AND     year(P.pay_date)  = year(NEW.working_date) 
    AND     month(P.pay_date) = month(NEW.working_date); 
   
END $$

DELIMITER ; 

--
-- Trigger for updating paycheck of the current month 
-- when a presence has been updated 
--

DROP TRIGGER IF EXISTS tgr_calculate_paycheck_on_update; 

DELIMITER $$

CREATE TRIGGER tgr_calculate_paycheck_on_update
    AFTER UPDATE 
    ON presence 
    FOR EACH ROW 
BEGIN 

    DECLARE hourly_wage FLOAT; 
    DECLARE salary_flag FLOAT; 

    SELECT  E.hourly_wage 
    INTO    hourly_wage
    FROM    employee E
    WHERE   E.fiscal_code = NEW.employee; 

    SELECT  count(*)
    INTO    salary_flag
    FROM    paycheck P
    WHERE   P.employee = NEW.employee
    AND     year(P.pay_date)  = year(NEW.working_date) 
    AND     month(P.pay_date) = month(NEW.working_date); 

    IF (salary_flag = 0) THEN 
        INSERT INTO paycheck
        (employee, pay, deductions, bonus, pay_date)
        VALUES(NEW.employee, 0, 0, 0, NEW.working_date);
    END IF; 

    UPDATE  paycheck P
    SET     P.pay = P.pay - hourly_wage * (OLD.working_hours - NEW.working_hours)
    WHERE   P.employee = NEW.employee
    AND     year(P.pay_date)  = year(NEW.working_date) 
    AND     month(P.pay_date) = month(NEW.working_date); 

END $$

DELIMITER ; 

--
-- Trigger for updating paycheck of the current month 
-- when a presence has been deleted 
--

DROP TRIGGER IF EXISTS tgr_calculate_paycheck_on_delete; 

DELIMITER $$

CREATE TRIGGER tgr_calculate_paycheck_on_delete
    AFTER DELETE 
    ON presence 
    FOR EACH ROW 
BEGIN 

    DECLARE hourly_wage FLOAT; 
    DECLARE salary_flag FLOAT; 

    SELECT  E.hourly_wage 
    INTO    hourly_wage
    FROM    employee E
    WHERE   E.fiscal_code = OLD.employee; 

    SELECT  count(*)
    INTO    salary_flag
    FROM    paycheck P
    WHERE   P.employee = OLD.employee
    AND     year(P.pay_date)  = year(OLD.working_date) 
    AND     month(P.pay_date) = month(OLD.working_date); 

    IF (salary_flag <> 0) THEN 

        UPDATE  paycheck P
        SET     P.pay = P.pay - (hourly_wage * OLD.working_hours)
        WHERE   P.employee = OLD.employee
        AND     year(P.pay_date)  = year(OLD.working_date) 
        AND     month(P.pay_date) = month(OLD.working_date); 

    END IF; 

END $$

DELIMITER ; 