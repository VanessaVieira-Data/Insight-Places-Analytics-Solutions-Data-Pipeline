-- Adding a new column to store the count of properties per owner
ALTER TABLE owners
ADD COLUMN total_listings INT DEFAULT 0;

SELECT * FROM owners LIMIT 5; 

-- Step 1: Checking if the results on the screen are exactly the ones to be updated
SELECT * FROM listings WHERE listing_id IN ('1', '10', '100');

-- Step 2: Once validated, update listing status for specific IDs after owner contact 
UPDATE listings
SET is_active = 1
WHERE listing_id IN ('1', '10','100');

-- Step 3: Testing if the update was successful
SELECT listing_id, is_active 
FROM listings 
WHERE listing_id IN ('1', '10', '100');

-- Updating owner's contact email after request
-- Step 1: Checking current contact information for owner 1009
SELECT * FROM owners;

-- Step 2: Once validated, update the email addressUPDATE owners
UPDATE owners
SET contact = 'daniela_120@email.com'
WHERE owner_id = '1009'; 

-- Step 3: Verifying the update
SELECT * FROM owners
WHERE owner_id = '1009'; 

-- Deleting listings 10000 and 1001 and their related records 

-- Step 0: Investigating table relationships (Finding the "children") 
SELECT 
	TABLE_SCHEMA AS	'Database',
    TABLE_NAME AS 'Child_Table', 
    COLUMN_NAME AS 'Foreign_Key_Column', 
    REFERENCED_TABLE_NAME AS 'Parent_Table'
FROM
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
	REFERENCED_TABLE_NAME = 'listings';

-- Step 1: Checking records in all tables before deletion
SELECT * FROM reviews 
WHERE listing_id IN ('10000', '1001');

SELECT * FROM bookings
WHERE listing_id IN ('10000', '1001');

SELECT * FROM listings 
WHERE listing_id IN ('10000', '1001'); 

-- Step 2: Executing deletions in the correct order 

-- 1. Deleting from child tables (The "children') 
DELETE FROM reviews
WHERE listing_id IN ('10000', '1001');

DELETE FROM bookings
WHERE listing_id IN ('10000', '1001'); 

-- 2. Deleting from parent table (The "parent") 
DELETE FROM listings
WHERE listing_id IN ('10000', '1001'); 
 
-- Final Check: Searching for deleted records 
SELECT * FROM listings
WHERE listing_id IN ('10000', '1001'); 