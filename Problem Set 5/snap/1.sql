-- Usernames of people who logged in since 2024-01-01.
SELECT "username" FROM "users"
WHERE "last_login_date" >= '2024-01-01';
