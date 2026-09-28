-- Top 5 teams by hits in 2001.
SELECT "name", SUM("H") AS "total hits"
FROM "teams"
JOIN "performances" ON "teams"."id" = "performances"."team_id"
WHERE "performances"."year" = 2001
GROUP BY "teams"."id"
ORDER BY "total hits" DESC
LIMIT 5;
