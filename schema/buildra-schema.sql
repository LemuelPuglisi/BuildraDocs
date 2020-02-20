-- Buildra Database Schema 
-- Version 1.0

DROP SCHEMA IF EXISTS buildra; 
CREATE SCHEMA buildra;
USE buildra; 

-- 
-- Table structure for table 'customer' 
-- 

CREATE TABLE customer (
    fiscal_code VARCHAR(16) NOT NULL,
    first_name  VARCHAR(32) NOT NULL, 
    last_name   VARCHAR(32) NOT NULL, 
    residence   VARCHAR(32) DEFAULT NULL,
    birthdate   DATE        NOT NULL,

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
    code    SMALLINT UNSIGNED   NOT NULL AUTO_INCREMENT, 
    pricelist_code      VARCHAR(16) NOT NULL UNIQUE, 
    short_description   TEXT NOT NULL, 
    full_description    TEXT NOT NULL, 
    base_unit           VARCHAR(8) NOT NULL, 
    price               DECIMAL(10, 2) NOT NULL, 
    labor_incidence     FLOAT NOT NULL,      

    PRIMARY KEY (code), 
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
-- Table structure for table 'price_quotation'
-- 

CREATE TABLE price_quotation (
    code SMALLINT UNSIGNED   NOT NULL,
    work SMALLINT UNSIGNED   NOT NULL,
    storage_link    VARCHAR(256)    NOT NULL, 
    created_at      TIMESTAMP       DEFAULT CURRENT_TIMESTAMP NOT NULL,

    PRIMARY KEY (code),
    INDEX idx_price_quotation_ts (created_at) USING BTREE,
    INDEX idx_price_quotation_work (work),

    CONSTRAINT fk_price_quotation_work FOREIGN KEY (work) REFERENCES work (code)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

--
-- Table structure for table 'contract'
--

CREATE TABLE contract (
    code SMALLINT UNSIGNED   NOT NULL,
    work SMALLINT UNSIGNED   NOT NULL,
    storage_link    VARCHAR(256)    NOT NULL, 
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
    code SMALLINT UNSIGNED  NOT NULL,
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
    code SMALLINT UNSIGNED  NOT NULL, 
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
    working_date    DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, 
    working_hours   FLOAT    NOT NULL, 

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