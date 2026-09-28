-- Neighborhood tool library: neighbors borrow tools from a shared shed.

CREATE TABLE "members" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE,
    "neighborhood" TEXT NOT NULL,
    "joined" NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "tools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "condition" TEXT NOT NULL CHECK ("condition" IN ('excellent', 'good', 'fair')),
    "owner_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("owner_id") REFERENCES "members" ("id")
);

CREATE TABLE "loans" (
    "id" INTEGER,
    "tool_id" INTEGER NOT NULL,
    "borrower_id" INTEGER NOT NULL,
    "checked_out" NUMERIC NOT NULL,
    "due" NUMERIC NOT NULL,
    "returned" NUMERIC,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("tool_id") REFERENCES "tools" ("id"),
    FOREIGN KEY ("borrower_id") REFERENCES "members" ("id")
);

CREATE INDEX "loans_by_tool" ON "loans" ("tool_id");
CREATE INDEX "loans_by_borrower" ON "loans" ("borrower_id");
CREATE INDEX "tools_by_category" ON "tools" ("category");

CREATE VIEW "overdue" AS
SELECT
    "tools"."name" AS "tool",
    "members"."name" AS "borrower",
    "loans"."due"
FROM "loans"
JOIN "tools" ON "tools"."id" = "loans"."tool_id"
JOIN "members" ON "members"."id" = "loans"."borrower_id"
WHERE "loans"."returned" IS NULL
  AND "loans"."due" < DATE('now');
