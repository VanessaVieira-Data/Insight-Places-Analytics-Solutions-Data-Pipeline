-- Part 1: Top 10 owners with the most active listings
SELECT o.owner_name, COUNT(l.listing_id) AS total_active_listings
FROM owners o 
JOIN listings l ON o.owner_id = l.owner_id
WHERE l.is_active = 1
GROUP BY o.owner_name
ORDER BY total_active_listings DESC
LIMIT 10; 

-- Part 2: Owners with inactive listings
SELECT o.owner_name, COUNT(l.listing_id) AS total_inactive_listings
FROM owners o 
JOIN listings l ON o.owner_id = l.owner_id
WHERE l.is_active = 0 
GROUP BY o.owner_name
ORDER BY total_inactive_listings DESC; 
