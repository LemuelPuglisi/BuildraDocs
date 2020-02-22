USE buildra; 

--
-- Table structure for table `Service`
--

CREATE TABLE PService (
    product_id      INT(32) UNSIGNED    NOT NULL, 
    pricelist_id    VARCHAR(256)        NOT NULL, 
    base_unit       VARCHAR(256)        NOT NULL, 
    labor_incidence FLOAT               NOT NULL, 
    short_descr     TEXT                NOT NULL, 
    full_descr      TEXT                NOT NULL, 
    price           FLOAT               NOT NULL, 

    PRIMARY KEY (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 