SELECT * FROM < table_name >;

SELECT <column_1>, <column_2>,... FROM <table_name>;

SELECT <column_1>, <column_2>,... FROM <table_name> WHERE <condition>;

-- COUNT: The first one is COUNT. COUNT is a built-in database function that retrieves the number of rows that match the query criteria.
SELECT COUNT(*) FROM < table_name >;

SELECT COUNT(< column_name >)
FROM < table_name >
WHERE
    < condition >;

--DISTINCT is used to remove duplicate values from a result set.
SELECT DISTINCT
    < column_name >
FROM < table_name >
WHERE
    < condition >;
--The third expression is LIMIT. LIMIT is used for restricting the number of rows retrieved from the database.
SELECT * FROM < table_name > LIMIT < number >;

SELECT * FROM < table_name > WHERE < condition > LIMIT < number >;

-- INSERT Statement: adding row to a table
INSERT INTO <table_name> (<column_name_1>, <column_name_2>,...) VALUES (<value_column_1>, <value_column_2>,...);

-- UPDATE statement: Update row from a table
UPDATE < table_name >
SET
    < column_name_1 >= < value_column_1 > < column_name_2 >= < value_column_2 >
WHERE
    < condition >;

-- DELETE statement: delete row from a table
DELETE FROM < table_name > WHERE < condition >;