-- *******************************************(SERVER CONFIGS)************************************************
-- CREATE DATABASE WITH REQUIRED CHARACTERS SET
CREATE DATABASE IF NOT EXISTS avcdb;
use avcdb;

-- *************************************************************************************************************
-- IMPORT THE DATA FROM FILE


-- *************************************************************************************************************
-- VALIDATE THE DATA
-- 1. CHECK ROW COUNTS
-- 2. Using Constraints:
--        1. CHECK
--        2. UNIQUE CONSTRAINT
--        3. NOT NULL CONSTRAINT
-- 3. FETCH THE NEWEST AND OLDEST 5 RECORDS BASED ON PRIMARY KEY
-- 4. FIND IF THERE ARE ANY DUPLICATE RECORDS IN PRIMARY KEY

SELECT * FROM customers ORDER BY CustomerKey DESC LIMIT 5;

-- *************************************************************************************************************
-- APPLY CONSTRAINTS AND BUILD ERs

-- PRIMARY KEY CONSTRAINT:

-- 1. CUSTOMER TABLE
ALTER TABLE customers ADD CONSTRAINT custpk PRIMARY KEY customers(CustomerKey);
desc customers;

-- 2. PRODUCT CATEGORY ID
ALTER TABLE productcategories ADD CONSTRAINT prodcidpk PRIMARY KEY productcategories(productcategoryid);

-- 3. PRODUCTS
ALTER TABLE products ADD CONSTRAINT prodpk PRIMARY KEY products(ProductKey);

-- 4. PRODUCT SUB CATEGORY
ALTER TABLE productsubcategories ADD CONSTRAINT prodscidpk PRIMARY KEY productsubcategories(ProductSubcategoryKey);

-- 5. RETURNS


-- 6. SALES


-- 7. TERRITORIES
ALTER TABLE territories ADD CONSTRAINT terripk PRIMARY KEY territories(SalesTerritoryKey);


-- FOREIGN KEY:
ALTER TABLE productsubcategories
    ADD CONSTRAINT pscfk
        FOREIGN KEY productsubcategories(ProductCategoryKey)
            REFERENCES productcategories(productcategoryid);



ALTER TABLE products
    ADD CONSTRAINT prdfk
        FOREIGN KEY products(ProductSubcategoryKey)
            REFERENCES productsubcategories(ProductSubcategoryKey);


ALTER TABLE returns
    ADD CONSTRAINT rtrfk
        FOREIGN KEY `returns`(TerritoryKey)
            REFERENCES territories(SalesTerritoryKey);


ALTER TABLE returns
    ADD CONSTRAINT rtrfk2
        FOREIGN KEY `returns`(ProductKey)
            REFERENCES products(ProductKey);



