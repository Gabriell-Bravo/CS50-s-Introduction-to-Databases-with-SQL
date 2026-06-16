
-- *** The Lost Letter ***
SELECT "id","contents", "to_address_id"  FROM "packages" WHERE "from_address_id" = (
   SELECT "id" FROM "addresses" WHERE "address"= '900 Somerville Avenue'); -- I checked the packages sent to the address '900 Somerville Avenue' and found Varsha's address ID through the package:
--'Congratulatory letter'. Then I checked Varsha's address using the ID and confirmed that the correct address is '2 Finnigan Street',
--thus being able to check the package ID and its drop and pick information.

SELECT "address", "type" FROM "addresses" WHERE "id" = '854';

SELECT * FROM "scans" WHERE "package_id" = (
    SELECT "id" FROM "packages" WHERE "id"= '384');
-- *** The Devious Delivery ***
SELECT * FROM "Packages" where "from_address_id"  IS NULL; -- First, I checked the packages that had the `from_address_id` to find the package that matched the advertised description.
SELECT * FROM "scans" WHERE "package_id" = '5098'; -- Then, using the package ID, I discovered the from_address_id for sending and receiving.
SELECT * FROM "addresses" WHERE "id" = '348';-- After discovering the from_address_id, I was able to find out where the package was delivered, which was to the address '7 Humboldt Place, Police Station'.
-- *** The Forgotten Gift ***
SELECT * FROM "packages" WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street' ); --First, I look for packages sent from the address '109 Tileston Street'.
SELECT * FROM "addresses" WHERE "id" = '4983'; -- Then I confirm the destination address and see that it is correct.
SELECT * FROM "scans" WHERE  "package_id"  = '9523'; -- Then I check what happened to the package and see that it was delivered to the wrong address and had to be picked up again.
SELECT * FROM "drivers" WHERE  "id"  = '17'; -- Then I see that he is with the driver Mikel.
