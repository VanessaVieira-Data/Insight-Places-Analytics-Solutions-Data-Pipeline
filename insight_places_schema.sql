USE insight_places;
CREATE TABLE owners (
owner_id VARCHAR (255) PRIMARY KEY,
owner_name VARCHAR (255) NOT NULL,
tax_id VARCHAR (20) UNIQUE NOT NULL,
contact VARCHAR (255)
); 

CREATE TABLE customer (
customer_id VARCHAR (255) PRIMARY KEY,
customer_name VARCHAR (255) NOT NULL,
customer_tax_id VARCHAR (20) UNIQUE NOT NULL,
contact VARCHAR (255)
);


CREATE TABLE addresses (
address_id VARCHAR (255) PRIMARY KEY,
street VARCHAR (255) NOT NULL,
house_number INT,
neighborhood VARCHAR (255),
city VARCHAR (255) NOT NULL,
state VARCHAR (50) NOT NULL,
zip_code VARCHAR (10)
); 

ALTER TABLE addresses RENAME COLUMN addresses_id TO address_id;


CREATE TABLE listings (
listing_id VARCHAR (255) PRIMARY KEY,
property_type VARCHAR (255) NOT NULL,
address_id VARCHAR (255),
owner_id VARCHAR (255),
is_active BOOL, 
FOREIGN KEY (address_id) REFERENCES addresses (address_id),
FOREIGN KEY (owner_id) REFERENCES owners (owner_id)
);

RENAME TABLE customer TO customers;


CREATE TABLE bookings (
booking_id VARCHAR (255) PRIMARY KEY,
customer_id VARCHAR (255),
listing_id VARCHAR (255),
start_date DATE,
end_date DATE,
total_price DECIMAL (10,2),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
FOREIGN KEY (listing_id) REFERENCES listings (listing_id)
); 

CREATE TABLE reviews (
review_id VARCHAR (255) PRIMARY KEY,
listing_id VARCHAR (255),
customer_id VARCHAR (255),
rating INT,
review_text TEXT,
FOREIGN KEY (listing_id) REFERENCES listings (listing_id),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id) 
); 


