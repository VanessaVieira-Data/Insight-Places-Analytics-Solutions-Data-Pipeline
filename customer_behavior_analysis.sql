-- Query 1: Rating Reviews 
SELECT * FROM reviews
WHERE rating >= 4;

-- Query 2: Active Listings 
SELECT * FROM listings
WHERE property_type = 'hotel' AND is_active = 1; 

-- Query 3: Average Total Price per Customer
SELECT customer_id, ROUND(AVG (total_price), 2) AS average_ticket
FROM bookings
GROUP BY customer_id;

-- Query 4: Average Lenght of Stay 
SELECT customer_id, ROUND(AVG(DATEDIFF(end_date, start_date)), 0) AS average_lenght_of_stay
FROM bookings
GROUP BY customer_id
ORDER BY average_lenght_of_stay DESC; 