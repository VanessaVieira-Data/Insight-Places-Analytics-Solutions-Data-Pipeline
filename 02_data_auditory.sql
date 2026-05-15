
-- Text integrity & Character audit 
-- Check for hidden line breaks (newlines) in review texts -- This helps validate text formatting and integrity after the Python data load 
SELECT * FROM reviews 
WHERE review_text LIKE '%\n%' LIMIT 5;

-- Count how many listings have ZERO bookings
SELECT COUNT(*) AS listings_without_bookings
FROM listings
WHERE listing_id NOT IN (SELECT DISTINCT listing_id FROM bookings);

-- Finding owners who have ZERO listings
SELECT owner_id, owner_name 
FROM owners 
WHERE owner_id NOT IN (SELECT DISTINCT owner_id FROM listings);

-- ===============================================================================================================

-- Checking if any owner has multiple properties
SELECT owner_id, COUNT(*) as property_count
FROM listings
GROUP BY owner_id
HAVING property_count > 1;
