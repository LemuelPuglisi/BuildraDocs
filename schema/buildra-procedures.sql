-- Buildra Database Schema 
-- Version 1.0

USE buildra; 

--
-- Procedure to store a generated document
--

DROP PROCEDURE IF EXISTS log_document; 

DELIMITER $$

CREATE PROCEDURE log_document (
    IN _work SMALLINT,
    IN _doc_type  SET ('CONTRACT', 'QUOTATION'),
    IN _storage_uid VARCHAR(255)
)
BEGIN 

    DECLARE work_flag SMALLINT; 

    SELECT  count(*)
    INTO    work_flag
    FROM    work
    WHERE   code = _work; 

    IF work_flag < 1 THEN 
        SIGNAL SQLSTATE '20000'
            SET MESSAGE_TEXT = 'work not found';
    END IF; 

    INSERT INTO buildra.document
    (work, type, storage_link, created_at)
    VALUES(_work, _doc_type, _storage_uid, CURRENT_TIMESTAMP);
    
END $$

DELIMITER ;

--
-- Procedure to calculate the profit of one work
--

DROP PROCEDURE IF EXISTS calculate_profit; 

DELIMITER $$

CREATE PROCEDURE calculate_profit (IN _work SMALLINT)
BEGIN

    DECLARE gross_income    DECIMAL(15, 2); 
    DECLARE purchases_cost  DECIMAL(15, 2);  
    DECLARE human_res_cost  DECIMAL(15, 2);
    DECLARE profit          DECIMAL(15, 2);  

    SELECT  total_price 
    INTO    gross_income
    FROM    work    
    WHERE   code = _work; 

    SELECT  sum(P.amount * I.price)
    INTO    purchases_cost
    FROM    purchase P, item I 
    WHERE   P.work = _work 
    AND     P.item = I.code; 
        
    SELECT  sum(P.working_hours * E.hourly_wage)
    INTO    human_res_cost
    FROM    presence P, employee E
    WHERE   P.work = _work 
    AND     P.employee = E.fiscal_code; 

    SET gross_income    = COALESCE(gross_income, 0);     
    SET purchases_cost  = COALESCE(purchases_cost, 0); 
    SET human_res_cost  = COALESCE(human_res_cost, 0); 
    
    SET profit = gross_income - (purchases_cost + human_res_cost); 

    SELECT  gross_income, 
            purchases_cost, 
            human_res_cost, 
            profit; 

END $$

DELIMITER ; 

--
-- Procedure to calculate montly profit 
--

DROP PROCEDURE IF EXISTS calculate_montly_profit; 

DELIMITER $$

CREATE PROCEDURE calculate_montly_profit (IN _date DATE)
BEGIN 

    DECLARE gross_income    DECIMAL(15, 2); 
    DECLARE purchases_cost  DECIMAL(15, 2);  
    DECLARE human_res_cost  DECIMAL(15, 2);
    DECLARE profit          DECIMAL(15, 2);  

    SELECT  sum(W.total_price) 
    INTO    gross_income
    FROM    work 
    WHERE   month(completation_date) = month(_date)
    AND     year(completation_date)  = year(_date); 

    SELECT  sum(P.amount * I.price)
    INTO    purchases_cost
    FROM    purchase P, item I 
    WHERE   P.item = I.code 
    AND     month(P.purchase_date) = month(_date) 
    AND     year(P.purchase_date)  = year(_date); 

    SELECT  sum(P.pay)
    INTO    human_res_cost
    FROM    paycheck P 
    WHERE   month(P.pay_day) = month(_date)
    AND     year(P.pay_day)  = year(_date); 

    SET gross_income    = COALESCE(gross_income, 0);     
    SET purchases_cost  = COALESCE(purchases_cost, 0); 
    SET human_res_cost  = COALESCE(human_res_cost, 0); 

    SET profit = gross_income - (purchases_cost + human_res_cost); 

        SELECT  gross_income    AS month_gross_income, 
                purchases_cost  AS month_purchases_cost, 
                human_res_cost  AS month_human_res_cost, 
                profit          AS month_profit; 

END $$

DELIMITER ; 
