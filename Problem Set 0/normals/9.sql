-- Ten warmest surface locations.
SELECT "latitude", "longitude", "0m" FROM "normals"
WHERE "0m" IS NOT NULL
ORDER BY "0m" DESC, "latitude" ASC
LIMIT 10;
