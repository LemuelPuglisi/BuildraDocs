-- Buildra Database Schema 
-- Version 1.0

-- All the stored procedures are stored in schema/buildra-procedures.sql

-----------------------------
-- Op.1: Insert a new work --
-----------------------------

INSERT INTO work (
    address, 
    building, 
    floor, 
    commission_date, 
    completation_date, 
    total_price, 
    discount, 
    customer
)
VALUES (
    "Via Vattelapesca 22", 
    "10", 
    "1", 
    NOW(),
    NULL,  
    0,
    0,  
    "BGGSHQ63U08R002M"
); 

-----------------------------------------
-- Op.2: Associate a service to a work --
-----------------------------------------          
-- We will use the same short description
-- as instance description             --
-----------------------------------------

SET @selected_service = 3308; 

INSERT INTO offered_service (
    work, 
    service, 
    instance_description, 
    quantity, 
    PCP, 
    association_date 
)
VALUES (
    1, 
    @selected_service, 
    (SELECT S.short_description 
     FROM service S 
     WHERE S.code = @selected_service), 
    1, 
    0.78, 
    NOW()
); 

----------------------------------------------------------------------
-- Op.3: Fetch all the data required to generate a price quotation; -- 
----------------------------------------------------------------------
-- In order to generate a price quotation we need                   --
-- informations about the selected work, the customer               --
-- and all the offered services.                                    --
----------------------------------------------------------------------

SET @work_code = 1; 

-- customer and work infos

SELECT  *
FROM    work W, customer C 
WHERE   W.customer = C.fiscal_code
AND     W.code = @work_code; 

-- offered services info

SELECT  OS.instance_description AS description,
        S.price                 AS price 
        OS.quantity             AS quantity 
        (S.price * OS.quantity) AS total_price, 
        S.base_unit             AS base_unit 
FROM    service S, offered_service OS
WHERE   OS.work = @work_code
AND     OS.service = S.code; 

-- call procedure to log the file 

SET @document_type  = "QUOTATION"; 
SET @storage_uid    = "111kk23nn999dsl"; 

CALL log_document (@work_code, @document_type, @storage_uid); 

---------------------------------------------------------------
-- Op.4: Fetch all the data required to generate a contract; --
---------------------------------------------------------------
-- In order to generate a contract we need                   --
-- informations about the selected work, the customer,       --
-- all the purchases and the offered services.               --
-- ------------------------------------------------------------

SET @work_code = 1; 

-- customer and work infos

SELECT  *
FROM    work W, customer C 
WHERE   W.customer = C.fiscal_code
AND     W.code = @work_code; 

-- offered services info

SELECT  OS.instance_description AS description,
        S.price                 AS price 
        OS.quantity             AS quantity 
        (S.price * OS.quantity) AS total_price, 
        S.base_unit             AS base_unit 
FROM    service S, offered_service OS
WHERE   OS.work = @work_code
AND     OS.service = S.code; 

-- purchases infos

SELECT  I.code, 
        I.name, 
        I.description, 
        I.price, 
        I.base_unit, 
        P.amount 
        P.creditor 
        (P.amount * I.price) AS total_price, 
        (P.amount * I.price - P.discount) AS discounted price
FROM    purchase P, item I 
WHERE   P.work = @work_code
AND     P.item = I.code; 

-- call procedure to log the file 

SET @document_type  = "CONTRACT"; 
SET @storage_uid    = "156kk23fn552dpl"; 

CALL log_document (@work_code, @document_type, @storage_uid); 

----------------------------------------------
-- Op.5: Print the paycheck of an employee; -- 
----------------------------------------------

SET @_employee  = "";  
SET @_date      = ""; 

SELECT  (P.pay - P.deductions + P.bonus) as paycheck
FROM    paycheck P
WHERE   P.employee = @_employee
AND     month(P.pay_date) = month(@_date)
AND     year(P.pay_date)  = year(@_date); 

--------------------------------------------------------------------
-- Op.6: Acquisition of the date in order to study the profit of  --
-- one or more works.                                             --
--------------------------------------------------------------------
-- just call the stored procedure calculate_profit (work) for     --
-- each work and then sum all the results                         --
--------------------------------------------------------------------

SET @_work = 1; 

CALL calculate_profit (@_work); 

---------------------------------------------
-- Op.7: Calculate montly profit           --
---------------------------------------------
-- call the calculate_montly_profit (date) --
-- stored procedure                        --
---------------------------------------------

SET @_date = "2020-01-01";

CALL calculate_montly_profit(@_date); 