-- Types of SQL statements (DDL vs. DML)
-- https://medium.com/@emad-mohamed/dml-vs-ddl-cdf5208cbb32

-- DDL
CREATE TABLE (
    <field_name_1> <datatype> ...,
    <field_name_2> <datatype> ...,
    <field_name_3> <datatype> ...,
    <field_name_4> <datatype> ...
);

-- ALTER statement:
-- add or remove keys,
-- add or remove constraints
-- modify the data type of columns,
-- add or remove columns from a table,
ALTER TABLE <table_name>
ADD COLUMN <column_name_1> <datatype>,
...
ADD COLUMN <column_name_n> <datatype>;

ALTER TABLE < table_name > DROP COLUMN < column_name >;

ALTER TABLE < table_name >
ALTER COLUMN < column_name >
SET
    DATA TYPE < datatype >;

-- DROP statement:
DROP TABLE < table_name >;

-- TRUNCATE statement:
TRUNCATE TABLE < table_name > IMMEDIATE;