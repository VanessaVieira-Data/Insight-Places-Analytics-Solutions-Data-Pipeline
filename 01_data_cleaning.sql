-- =============================================================================
-- PHASE 1: DATABASE RESET & DATA LOAD VERIFICATION
-- =============================================================================

-- Disable foreign key checks to allow database maintenance
SET FOREIGN_KEY_CHECKS = 0;

-- Emptying all tables to prepare for clean data migration from Python
TRUNCATE TABLE reviews;
TRUNCATE TABLE bookings;
TRUNCATE TABLE listings;
TRUNCATE TABLE owners;
TRUNCATE TABLE customers;
TRUNCATE TABLE addresses; 

-- Re-enable foreign key constraints to maintain database integrity
SET FOREIGN_KEY_CHECKS = 1;

-- Verify that tables are populated (Display five rows from each table)
SELECT * FROM addresses LIMIT 5;
SELECT * FROM bookings LIMIT 5;
SELECT * FROM customers LIMIT 5;
SELECT * FROM listings LIMIT 5;
SELECT * FROM owners LIMIT 5;
SELECT * FROM reviews LIMIT 5;


-- ========================================================================
-- Phase 2: POST-MIGRATION CLEANUP (Orphaned Addresses)
-- ========================================================================

-- Row count per table to ensure full dataset migration  
SELECT
    (SELECT COUNT(*) FROM addresses) AS total_addresses,
    (SELECT COUNT(*) FROM bookings) AS total_bookings,
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM listings) AS total_listings,
    (SELECT COUNT(*) FROM owners) AS total_owners,
    (SELECT COUNT(*) FROM reviews) AS total_reviews;

-- Count orphaned addresses (records without any linked properties)
SELECT COUNT(*) 
FROM addresses a
LEFT JOIN listings l ON a.address_id = l.address_id
WHERE l.listing_id IS NULL;

-- Auditing listings that point to a non-existent owners (Integrity Check)
SELECT listing_id, owner_id 
FROM listings 
WHERE owner_id NOT IN (SELECT owner_id FROM owners);

-- =============================================================================
-- PHASE 3: ORPHANED DATA CLEANUP & RE-VALIDATION
-- =============================================================================

-- Part 1: DIAGNOSIS: Identifying inconsistencies before applying changes

-- Count orphaned addresses (records without any linked properties in listings) 
-- This explains WHY we need to run the DELETE command below (Target: 16 records) 
SELECT COUNT(*) FROM addresses a 
LEFT JOIN listings l ON a.address_id = l.address_id 
WHERE l.listing_id IS NULL; 

-- Audit check: Look for properties pointing to non-existent owners 
-- This ensures that no active listing is left without a valid host 
SELECT listing_id, owner_id 
FROM listings 
WHERE owner_id NOT IN (SELECT owner_id FROM owners);

-- ===============================================================================
-- Part 2. ACTION: Cleaning up the database

-- 1. Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

-- 2. Deleting orphaned addresses to ensure data consistency
DELETE FROM addresses 
WHERE address_id NOT IN (SELECT DISTINCT address_id FROM listings);

-- 3. Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

-- ===============================================================================
-- Part 3. RE-VALIDATION: Confirming success

-- Counting again addresses that don't have a listing associated
SELECT COUNT(*) 
FROM addresses a
LEFT JOIN listings l ON a.address_id = l.address_id
WHERE l.listing_id IS NULL;
