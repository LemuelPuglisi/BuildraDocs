-- Buildra Database Schema 
-- Version 1.0

DROP SCHEMA IF EXISTS buildra; 
CREATE SCHEMA buildra;
USE buildra; 

--
-- TABLES DEFINITION
--

-- 
-- Table structure for table 'customer' 
-- 

CREATE TABLE customer (
    fiscal_code VARCHAR(16) NOT NULL,
    first_name  VARCHAR(32) NOT NULL, 
    last_name   VARCHAR(32) NOT NULL, 
    residence   VARCHAR(32) DEFAULT NULL,
    birth_place VARCHAR(64) NOT NULL, 
    birthdate   DATE        NOT NULL,
    email       VARCHAR(64), 

    PRIMARY KEY (fiscal_code), 
    INDEX   idx_customer_fc (fiscal_code), 
    INDEX   idx_customer_fn (first_name),
    INDEX   idx_customer_ln (last_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

-- 
-- Table structure for table 'work'
--

CREATE TABLE work (
    code        SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    address     VARCHAR(256) NOT NULL, 
    building    VARCHAR(64)  DEFAULT NULL,
    floor       VARCHAR(32)  DEFAULT NULL, 
    commission_date     DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    completation_date   DATETIME DEFAULT NULL, 
    total_price         DECIMAL(10, 2) DEFAULT 0.0, 
    discount            FLOAT DEFAULT NULL,
    customer            VARCHAR(16) NOT NULL, 

    PRIMARY KEY (code), 
    INDEX   idx_work_id (code), 

    CONSTRAINT fk_work_customer FOREIGN KEY (customer) REFERENCES customer (fiscal_code) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

--
-- Table structure for table 'service' 
--

CREATE TABLE service (
    code                SMALLINT UNSIGNED NOT NULL, 
    pricelist_code      VARCHAR(16) NOT NULL UNIQUE, 
    short_description   TEXT NOT NULL, 
    full_description    TEXT NOT NULL, 
    base_unit           VARCHAR(16), 
    price               DECIMAL(10, 2) NOT NULL, 
    labor_incidence     FLOAT NOT NULL,      
    pricelist_year      INT(4) NOT NULL, 

    PRIMARY KEY (code, pricelist_year), 
    FULLTEXT KEY idx_service_sd (short_description), 
    FULLTEXT KEY idx_service_fd (full_description)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

--
-- Table structure for table 'offered_service'
--

CREATE TABLE offered_service (
    work    SMALLINT UNSIGNED   NOT NULL, 
    service SMALLINT UNSIGNED   NOT NULL, 
    instance_description   TEXT NOT NULL, 
    quantity    INT     NOT NULL,
    PCP         FLOAT   NOT NULL,
    association_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 

    PRIMARY KEY (work, service), 
    FULLTEXT KEY idx_offered_service_desc (instance_description),
    INDEX idx_offered_service_work (work),  

    CONSTRAINT fk_offered_service_work FOREIGN KEY (work) REFERENCES work (code)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 

    CONSTRAINT fk_offered_service_service FOREIGN KEY (service) REFERENCES service (code)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

--
-- Table structure for table 'document'
--

CREATE TABLE document (
    code SMALLINT UNSIGNED   NOT NULL AUTO_INCREMENT,
    work SMALLINT UNSIGNED   NOT NULL,
    type SET ('CONTRACT', 'QUOTATION')  NOT NULL, 
    storage_link    VARCHAR(256)        NOT NULL, 
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,

    PRIMARY KEY (code),
    INDEX idx_contract_ts (created_at) USING BTREE,
    INDEX idx_contract_work (work),

    CONSTRAINT fk_contract_work FOREIGN KEY (work) REFERENCES work (code)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

--
-- Table structure for table 'item' 
--

CREATE TABLE item (
    code SMALLINT UNSIGNED  NOT NULL AUTO_INCREMENT,
    name VARCHAR(256)       NOT NULL, 
    description TEXT        NOT NULL,
    price DECIMAL(8, 2)     NOT NULL, 
    base_unit VARCHAR(8)    NOT NULL, 
    seller  VARCHAR(256)    NOT NULL, 

    PRIMARY KEY (code), 
    FULLTEXT KEY idx_item_desc (description), 
    INDEX idx_item_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table 'purchase' 
-- 

CREATE TABLE purchase (
    code SMALLINT UNSIGNED  NOT NULL AUTO_INCREMENT, 
    item SMALLINT UNSIGNED  NOT NULL, 
    work SMALLINT UNSIGNED  NOT NULL, 
    amount INT    UNSIGNED  NOT NULL, 
    creditor SET ('CUSTOMER', 'COMPANY') NOT NULL, 
    discount FLOAT DEFAULT NULL,
    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 

    PRIMARY KEY (code), 

    CONSTRAINT fk_purchase_item FOREIGN KEY (item) REFERENCES item (code)
        ON DELETE RESTRICT
        ON UPDATE CASCADE, 
    
    CONSTRAINT fk_purchase_work FOREIGN KEY (work) REFERENCES work (code) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

--
-- Table structure for table 'employee' 
--

CREATE TABLE employee (
    fiscal_code VARCHAR(16)     NOT NULL,
    first_name  VARCHAR(32)     NOT NULL, 
    last_name   VARCHAR(32)     NOT NULL, 
    hourly_wage DECIMAL(4, 2)   NOT NULL, 

    PRIMARY KEY (fiscal_code), 
    INDEX   idx_employee_fn (first_name), 
    INDEX   idx_employee_ln (last_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

-- 
-- Table structure for table 'presence'
--

CREATE TABLE presence (
    work     SMALLINT UNSIGNED  NOT NULL, 
    employee VARCHAR(16)        NOT NULL,
    working_date    DATE        NOT NULL, 
    working_hours   FLOAT       NOT NULL CHECK (working_hours <= 8), 

    PRIMARY KEY (work, employee, working_date), 
    INDEX idx_presence_date (working_date) USING BTREE, 
    INDEX idx_presence_work (work), 

    CONSTRAINT fk_presence_work FOREIGN KEY (work) REFERENCES work (code)
        ON DELETE CASCADE
        ON UPDATE CASCADE, 

    CONSTRAINT fk_presence_employee FOREIGN KEY (employee) REFERENCES employee (fiscal_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
--  Table structure for table 'paycheck'
--

CREATE TABLE paycheck (
    code SMALLINT UNSIGNED   NOT NULL, 
    employee VARCHAR(16)     NOT NULL, 
    pay         DECIMAL(8, 2)   NOT NULL, 
    deductions  DECIMAL(8, 2)   NOT NULL, 
    bonus       DECIMAL(8, 2)   NOT NULL, 
    pay_date    DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 

    PRIMARY KEY (code), 
    INDEX idx_paycheck_date (pay_date) USING BTREE, 
    INDEX idx_paycheck_employee (employee), 

    CONSTRAINT fk_paycheck_employee FOREIGN KEY (employee) REFERENCES employee (fiscal_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- TRIGGERS DEFINITION
--

--
-- Trigger that prevent update on service records
--
-- The standard pricelist is provided by the region
-- and cannot be modified.  
--

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

DELIMITER $$

CREATE TRIGGER tgr_limit_working_hours
    BEFORE INSERT 
    ON presence FOR EACH ROW
BEGIN 

    DECLARE total_working_hours FLOAT; 

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
-- Trigger for updating paycheck of the current month 
-- when a presence has been inserted 
--

DELIMITER $$

-- CREATE TRIGGER tgr_calculate_paycheck_on_insert

DELIMITER ; 

--
-- Trigger for updating paycheck of the current month 
-- when a presence has been updated 
--

DELIMITER $$

-- CREATE TRIGGER tgr_calculate_paycheck_on_update

DELIMITER ; 

--
-- Trigger for updating paycheck of the current month 
-- when a presence has been deleted 
--


DELIMITER $$

-- CREATE TRIGGER tgr_calculate_paycheck_on_delete

DELIMITER ; 