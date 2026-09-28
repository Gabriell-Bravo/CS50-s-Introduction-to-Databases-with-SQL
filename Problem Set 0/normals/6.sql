-- Ocean temperatures at 50 m in the Arabian Sea.
SELECT "latitude", "longitude", "50m" FROM "normals"
WHERE "latitude" BETWEEN 0 AND 20
  AND "longitude" BETWEEN 55 AND 75;
