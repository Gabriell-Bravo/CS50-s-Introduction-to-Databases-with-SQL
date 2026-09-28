-- Tools currently out on loan.
SELECT "tools"."name", "members"."name" AS "borrower", "loans"."due"
FROM "loans"
JOIN "tools" ON "tools"."id" = "loans"."tool_id"
JOIN "members" ON "members"."id" = "loans"."borrower_id"
WHERE "loans"."returned" IS NULL
ORDER BY "loans"."due";

-- How many times each tool has been borrowed.
SELECT "tools"."name", COUNT("loans"."id") AS "times_borrowed"
FROM "tools"
LEFT JOIN "loans" ON "loans"."tool_id" = "tools"."id"
GROUP BY "tools"."id"
ORDER BY "times_borrowed" DESC;

-- Available drills: owned by the shed and not currently checked out.
SELECT "name" FROM "tools"
WHERE "category" = 'drill'
  AND "id" NOT IN (
      SELECT "tool_id" FROM "loans" WHERE "returned" IS NULL
  );

-- Check out the cordless drill (tool 3) to member 2, due in seven days.
INSERT INTO "loans" ("tool_id", "borrower_id", "checked_out", "due")
VALUES (3, 2, DATE('now'), DATE('now', '+7 days'));

-- Mark loan 1 as returned today.
UPDATE "loans"
SET "returned" = DATE('now')
WHERE "id" = 1;

-- Retire a broken tool that has no open loan.
DELETE FROM "tools"
WHERE "id" = 9
  AND "id" NOT IN (SELECT "tool_id" FROM "loans" WHERE "returned" IS NULL);
