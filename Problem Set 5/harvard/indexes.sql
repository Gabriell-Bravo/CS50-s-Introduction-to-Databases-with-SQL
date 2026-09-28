-- Indexes for the typical my.harvard queries.

CREATE INDEX "enrollments_by_student" ON "enrollments" ("student_id");
CREATE INDEX "enrollments_by_course" ON "enrollments" ("course_id");
CREATE INDEX "courses_by_department" ON "courses" ("department", "number", "semester");
CREATE INDEX "courses_by_semester" ON "courses" ("semester");
CREATE INDEX "courses_by_title" ON "courses" ("title", "semester");
CREATE INDEX "satisfies_by_course" ON "satisfies" ("course_id");
CREATE INDEX "satisfies_by_requirement" ON "satisfies" ("requirement_id");
