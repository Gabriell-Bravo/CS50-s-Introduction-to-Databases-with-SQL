-- Ten coldest surface locations.
SELECT "latitude", "longitude", "0m" FROM "normals"
WHERE "0m" IS NOT NULL
ORDER BY "0m" ASC, "latitude" ASC
LIMIT 10;
