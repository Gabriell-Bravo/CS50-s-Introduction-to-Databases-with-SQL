--In 10.sql, write SQL query to answer a question of your choice. This query should:
--Make use of AS to rename a column
--Involve at least condition, using WHERE
--Sort by at least one column using ORDER BY
SELECT "first_name" AS "debut Fist name", "last_name" AS "debut Last name","debut" AS "debut DATE" FROM "players"
WHERE "debut" BETWEEN "2020-01-01" AND "2020-12-31" ORDER BY "debut";
