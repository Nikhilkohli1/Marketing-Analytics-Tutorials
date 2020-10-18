-------------------------------------
-- Generating Database: TEST
-------------------------------------
CREATE TRANSIENT SCHEMA IF NOT EXISTS oltp_schema DATA_RETENTION_TIME_IN_DAYS=0;
USE SCHEMA oltp_schema;
CREATE or REPLACE TABLE order_master
AS
SELECT
   (seq8()+1)::bigint as id,
   dateadd(day, uniform(1, 365, random(10003)), date_trunc(day, current_date))::date as order_date
from table(generator(rowcount => 500000));
 
CREATE or REPLACE TABLE order_detail
AS
SELECT
   (seq8()+1)::bigint as id,
   uniform(1,500000 , random(10005))::bigint as order_master_id,
   rpad(uniform(1, 10000, random(10006))::varchar,15, 'abcdefghifklmnopqrstuvwxyz')::char(15) as product_id
from table(generator(rowcount => 1000000));
 
CREATE or REPLACE TABLE product
AS
SELECT
   rpad((seq8()+1)::varchar,15, 'abcdefghifklmnopqrstuvwxyz')::char(15) as id,
   randstr(uniform(10,50, random(10008)),uniform(1,10000,random(10008)))::varchar(50) as product_description,
   rpad(uniform(1, 1000, random(10009))::varchar,10, 'abcdefghifklmnopqrstuvwxyz')::char(10) as product_group
from table(generator(rowcount => 10000));
 
CREATE TRANSIENT SCHEMA IF NOT EXISTS log_schema DATA_RETENTION_TIME_IN_DAYS=0;
USE SCHEMA log_schema;
CREATE or REPLACE TABLE log
AS
SELECT
   (seq8()+1)::bigint as id,
   randstr(uniform(16,128, random(10011)),uniform(1,5000000,random(10011)))::varchar(128) as msg
from table(generator(rowcount => 5000000));
 
