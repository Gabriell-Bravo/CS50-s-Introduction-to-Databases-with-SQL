-- Surface, 100 m, and 200 m temperatures off Rio de Janeiro (23.5 S, 43.5 W).
SELECT "0m", "100m", "200m" FROM "normals"
WHERE "latitude" = -23.5 AND "longitude" = -43.5;
