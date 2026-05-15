
-- 1. TOP PERFORMING PROPERTIES (DESC ORDER)

-- Purpose: Identify the platform's "star" listings with highest demand. 
-- Business Insight: High occupancy rates over long periods (e.g., ~730 days) indicate strong asset performance and consistent revenue generation.

-- Calculating Occupancy Rate - DESC ORDER
SELECT
    listing_id,
    MIN(start_date) AS first_date,
    SUM(DATEDIFF(end_date, start_date)) AS occupied_days,
    DATEDIFF(MAX(end_date), MIN(start_date)) AS total_days,
    ROUND((SUM(DATEDIFF(end_date, start_date)) / DATEDIFF(MAX(end_date), MIN(start_date))) * 100) AS occupancy_rate
FROM
    bookings
GROUP BY
    listing_id
ORDER BY occupancy_rate DESC 
;

-- ==============================================================================================================================
-- 2. UNDERPERFORMING PROPERTIES (ASC ORDER)

-- Purpose: Identify properties with low demand to trigger marketing strategies. 
-- Business Insight: Listings with very low occupancy (e.g., 2%) require competitive analysis (regional benchmarks) or dynamic pricing promotions.

-- Calculating Occupancy Rate - ASC ORDER
SELECT
    listing_id,
    MIN(start_date) AS first_date,
    SUM(DATEDIFF(end_date, start_date)) AS occupied_days,
    DATEDIFF(MAX(end_date), MIN(start_date)) AS total_days,
    ROUND((SUM(DATEDIFF(end_date, start_date)) / DATEDIFF(MAX(end_date), MIN(start_date))) * 100) AS occupancy_rate
FROM
    bookings
GROUP BY
    listing_id
ORDER BY occupancy_rate ASC 
;
