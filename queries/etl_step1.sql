/* STEPS:

1 - Create Raw, Staging, and DW databases.
2 - Extract data from the original source to the Raw database.
3 - Load data into the Staging database and apply transformations.
4 - Load data into the DW, build a star schema model, and create views to answer business questions.
5 - Monitor each step of the ETL to track query performance. This will serve as the baseline for improvements.
6 - Run the ETL using DBT, aiming to improve query performance by following best practices recommended by the DBT community.
*/

ALTER SESSION SET QUERY_TAG = 'EXTRACT_SALES_ETL';
-- 1 creating ETL databases
CREATE DATABASE IF NOT EXISTS SALES_RAW;
CREATE DATABASE IF NOT EXISTS SALES_STAGING;
CREATE DATABASE IF NOT EXISTS SALES_DW;

-- create sales_raw table
USE DATABASE SALES_RAW;
CREATE TABLE IF NOT EXISTS product_sales_performance
(
    SKU         VARCHAR(16777216),
    URL         VARCHAR(16777216),
    COUNTRY     VARCHAR(16777216),
    STOREID     VARCHAR(16777216),
    ZIP         VARCHAR(16777216),
    CITY        VARCHAR(16777216),
    STATE       VARCHAR(16777216),
    ADRESS      VARCHAR(16777216),
    TITLE       VARCHAR(16777216),
    BRAND       VARCHAR(16777216),
    SALES       NUMBER(38,0),
    REVENUEUSD  FLOAT,
    DATE        DATE  


);

TRUNCATE TABLE product_sales_performance;

INSERT INTO product_sales_performance
SELECT * FROM PRODUCT_SALES_PERFORMANCE__ONLINE_AND_OFFLINE.PUBLIC.PETSMART_OFFLINE_PRODUCT_LEVEL_DATA;


SELECT * FROM SNOWFLAKE.ACCOUNT_USAGE.QUERY_HISTORY
WHERE QUERY_TAG = 'EXTRACT_SALES_ETL';
