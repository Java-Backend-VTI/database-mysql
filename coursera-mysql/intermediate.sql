-- String pattern
WHERE < column_name > LIKE < % string pattern % >;

-- Using a Range
WHERE < column_name > [Comparison Operators] < number > AND < column_name > [Comparison Operators] < number > ;

-- Using a set of values
WHERE < column_name > = < value > OR < column_name > = < value >;

WHERE < column_name > IN (< value >, < value >);

-- Sorting, Using Order by
SELECT * FROM < table_name > ORDER BY < column_name > DESC;

SELECT < column_name_1 > < column_name_2 >
FROM < table_name >
ORDER BY 2;

-- To eliminate duplicates
SELECT DISTINCT (< column_name >) FROM < table_name >;

-- GROUP BY clause
SELECT < column_name_1 >, COUNT(< column_name_1 >)
FROM < table_name >
GROUP BY
    < column_name_1 >;

SELECT < column_name_1 >, COUNT(< column_name_1 >) AS `Count`
FROM < table_name >
GROUP BY
    < column_name_1 >;

-- HAVING clause:
SELECT < column_name_1 >, COUNT(< column_name_1 >) AS `Count`
FROM < table_name >
GROUP BY
    < column_name_1 > HAVING COUNT(<column_name_1>) [Logic Operators] <number>;