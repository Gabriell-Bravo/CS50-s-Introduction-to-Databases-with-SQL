-- Hartsfield-Jackson passenger and flight database.

CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    PRIMARY KEY ("id")
);

CREATE TABLE "concourse_assignments" (
    "airline_id" INTEGER,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY ("airline_id", "concourse"),
    FOREIGN KEY ("airline_id") REFERENCES "airlines" ("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" TEXT NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "departing_from" TEXT NOT NULL,
    "heading_to" TEXT NOT NULL,
    "departure" NUMERIC NOT NULL,
    "arrival" NUMERIC NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "airlines" ("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "datetime" NUMERIC NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "passengers" ("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights" ("id")
);
