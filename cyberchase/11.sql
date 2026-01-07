-- list the titles of episodes from season 5, in reverse alphabetical order.
SELECT "title" FROM "episodes"  where "season" = 5 ORDER BY "title" DESC;
