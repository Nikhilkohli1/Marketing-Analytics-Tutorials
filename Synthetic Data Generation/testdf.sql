-------------------------------------
-- Generating Database: TEST
-------------------------------------
CREATE TRANSIENT SCHEMA IF NOT EXISTS schema1 DATA_RETENTION_TIME_IN_DAYS=0;
USE SCHEMA schema1;
CREATE or REPLACE TABLE testdf
AS
SELECT
   randstr(uniform(1,30, random(10002)),uniform(1,10000,random(10002)))::varchar(30) as name,
   randstr(uniform(1,30, random(10003)),uniform(1,100,random(10003)))::varchar(30) as city,
   randstr(uniform(10,10, random(10004)),uniform(1,10000,random(10004)))::varchar(10) as license_plate,
   randstr(uniform(1,30, random(10005)),uniform(1,10000,random(10005)))::varchar(30) as email
from table(generator(rowcount => 100000));
 
