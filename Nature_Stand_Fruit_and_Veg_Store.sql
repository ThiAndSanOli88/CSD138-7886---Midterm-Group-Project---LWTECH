/********************************************************
* This script creates the database named NatureStand_FuitandVeg_Store;
*********************************************************/
DROP DATABASE IF EXISTS naturestand_fruitandveg_store;
CREATE DATABASE NatureStand_FruitandVeg_Store;
USE NatureStand_FruitandVeg_Store; 

/* create the tables for the database */
CREATE TABLE categories (
    category_id		VARCHAR(5)			NOT NULL,
    category_name	VARCHAR(10)			NOT NULL);
    
CREATE TABLE customers_address (
    address_id		VARCHAR(6)			NOT NULL,
    customer_id		VARCHAR(8)			NOT NULL,
    line1			VARCHAR(45)			NOT NULL,
    line2			VARCHAR(45),
    city			VARCHAR(45)			NOT NULL,
    state			VARCHAR(2)			NOT NULL,
    zip_code		INT					NOT NULL,
    phone			INT	    			NOT NULL);
    
CREATE TABLE customers ( 
    customer_id			VARCHAR(8)		NOT NULL,
    email_address		VARCHAR(240)	NOT NULL,
    full_name			VARCHAR(45)		NOT NULL,
    first_name			VARCHAR(45)		NOT NULL,
    last_name			VARCHAR(45)		NOT NULL,
    address_id			VARCHAR(6)		NOT NULL,
    billing_address_id	VARCHAR(6)		NOT NULL);
    
CREATE TABLE suppliers (
    supplier_id		VARCHAR(7)			NOT NULL,
    supplier_name	VARCHAR(15)			NOT NULL,
    supplier_state	VARCHAR(2)			NOT NULL,
    phone			INT					NOT NULL,
    contact_name	VARCHAR(20)			NOT NULL);
    
CREATE TABLE products (
    product_id		INT					NOT NULL,
    category_id		VARCHAR(5)			NOT NULL,
    product_code	VARCHAR(8)			NOT NULL,
    supplier_id		VARCHAR(7)			NOT NULL,
    product_name	VARCHAR(45)			NOT NULL,
    product_form	VARCHAR(8)			NOT NULL,
    list_price		DECIMAL(10,4)		NOT NULL,
    price_unit		VARCHAR(12)			NOT NULL,
    quantity 		INT					NOT NULL,
    date_added		VARCHAR(15)			NOT NULL);
	
CREATE TABLE orders (
  order_id				VARCHAR(6)		NOT NULL,
  customer_id			VARCHAR(8)		NOT NULL,
  order_date			VARCHAR(25)		NOT NULL,
  ship_amount			DECIMAL			NOT NULL,
  tax_amount			DECIMAL(10,2)	NOT NULL,
  ship_date				VARCHAR(25)		NOT NULL,
  address_id 			VARCHAR(60)		NOT NULL,
  card_type				VARCHAR(15)		NOT NULL,
  card_expires			VARCHAR(25)		NOT NULL,
  billing_address_id	VARCHAR(6)		NOT NULL);

CREATE TABLE order_items (
	item_id				VARCHAR(6)		NOT NULL,
    order_id			VARCHAR(6)		NOT NULL,
	product_id	 		INT				NOT NULL,
	item_price 			DECIMAL(10,4)	NOT NULL,
	quantity	 		INT				NOT NULL,
	total_amount		DECIMAL(10,2)	NOT NULL);
    
    
-- create the alter table for PRIMARY KEY
-- orders
ALTER TABLE orders ADD PRIMARY KEY (order_id); 
-- order_items
ALTER TABLE order_items ADD PRIMARY KEY (item_id);
-- customers
ALTER TABLE customers ADD PRIMARY KEY (customer_id);
-- customers_address
ALTER TABLE customers_address ADD PRIMARY KEY (address_id);
-- categories 
ALTER TABLE categories ADD PRIMARY KEY (category_id);
-- suppliers
ALTER TABLE suppliers ADD PRIMARY KEY (supplier_id);
-- products
ALTER TABLE products ADD PRIMARY KEY (product_id);


-- create the alter table for FOREIGN KEY
-- customers_address
ALTER TABLE customers_address ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
-- orders
ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE orders ADD FOREIGN KEY (address_id) REFERENCES customers_address(address_id);
-- products 
ALTER TABLE products ADD FOREIGN KEY (category_id) REFERENCES categories(category_id);
ALTER TABLE products ADD FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id);
-- order items
ALTER TABLE order_items ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);
ALTER TABLE order_items ADD FOREIGN KEY (product_id) REFERENCES products(product_id);
    
/* Insert data into the tables */

-- Inserting into categories table
INSERT INTO categories (category_id, category_name) 
VALUES 
('veg01', 'Vegetable'),
('fru01', 'Fruit');
       
-- Inserting into customers table
INSERT INTO customers (customer_id, email_address, full_name, first_name, last_name, address_id, billing_address_id)
VALUES
('C8961662', 'charles.martinezfwb@fakeemail.com', 'Charles Martinez', 'Charles', 'Martinez', 'ADD446', 'BIL723'),
('C7167829', 'jennifer.lewisfeh@fakeemail.com', 'Jennifer Lewis', 'Jennifer', 'Lewis', 'ADD298', 'BIL773'),
('C6819476', 'nancy.moore81i@fakeemail.com', 'Nancy Moore', 'Nancy', 'Moore', 'ADD395', 'BIL656'),
('C1559970', 'karen.martinezju7@fakeemail.com', 'Karen Martinez', 'Karen', 'Martinez', 'ADD561', 'BIL431'),
('C6284229', 'barbara.ramirez7dv@fakeemail.com', 'Barbara Ramirez', 'Barbara', 'Ramirez', 'ADD696', 'BIL761'),
('C5765693', 'kenneth.whiteret@fakeemail.com', 'Kenneth White', 'Kenneth', 'White', 'ADD931', 'BIL958'),
('C9494538', 'jennifer.mooreu25@fakeemail.com', 'Jennifer Moore', 'Jennifer', 'Moore', 'ADD586', 'BIL864'),
('C1680009', 'mark.floresmme@fakeemail.com', 'Mark Flores', 'Mark', 'Flores', 'ADD281', 'BIL458'),
('C5622204', 'lisa.harrisgya@fakeemail.com', 'Lisa Harris', 'Lisa', 'Harris', 'ADD833', 'BIL876'),
('C4533785', 'john.nguyentxw@fakeemail.com', 'John Nguyen', 'John', 'Nguyen', 'ADD576', 'BIL716'),
('C3357417', 'patricia.wilsonn55@fakeemail.com', 'Patricia Wilson', 'Patricia', 'Wilson', 'ADD237', 'BIL628');

-- Inserting into addresses table
INSERT INTO customers_address (address_id, customer_id, line1, line2, city, state, zip_code, phone)
VALUES
('ADD446', 'C8961662', '0950 NE Andrew Pines ST', 'Apt. 866', 'KIKLAND', 'WA', '98034', '733717755'),
('ADD298', 'C7167829', '97176 S Haysstad PL', 'House', 'MOBILE', 'AL', '36609', '526617113'),
('ADD395', 'C6819476', '0310 Moss Lodge', 'Suite 496', 'ANCHORAGE', 'Ak', '99504', '461241379'),
('ADD561', 'C1559970', '43607 NW Andersonborough Ave', NULL, 'PHOENIX', 'AZ', '85032', '468018829'),
('ADD696', 'C6284229', '100 Eric Dale', NULL, 'LOS ANGELES', 'CA', '90011', '587221842'),
('ADD931', 'C5765693', '4180 Wast Christian St', 'Apt C403', 'DENVER', 'CL', '80219', '705612039'),
('ADD586', 'C9494538', '871 Ward Shore', NULL, 'STAMFORD', 'CT', '6902', '672214221'),
('ADD281', 'C1680009', '33243 SE Maldonadomouth', 'Unit A', 'MIAMI', 'FL', '33186', '147071485'),
('ADD833', 'C5622204', 'Unit 2126 Box 2065', NULL, 'HONOLULU', 'HA', '968015', '756639198'),
('ADD576', 'C4533785', '2348 University St', 'Suite I', 'CHICAGO', 'IL', '60629', '202322590'),
('ADD237', 'C3357417', '047 Kathryn Street', NULL, 'BOSTON', 'MA', '2124', '936625918');

-- Inserting into suppliers table
INSERT INTO suppliers (supplier_id, supplier_name, supplier_state, phone, contact_name)
VALUES
('SUP6398', 'SuperGreen', 'CA', '283206931', 'DAVE GREEN'),
('SUP3540', 'VegToday', 'WA', '753414735', 'KARINA VEGAN'),
('SUP4024', 'Fruituit', 'FL', '225461385', 'JHON FRUIT'),
('SUP9129', 'Healthchoice', 'SC', '931508654', 'ADAN HEALTH'),
('SUP5170', 'Everyday', 'OR', '493817233', 'CLOE EVERY');

-- Inserting into products table
INSERT INTO products (product_id, category_id, product_code, supplier_id, product_name, product_form, list_price, price_unit, quantity, date_added)
VALUES
('200743', 'veg01', 'V5410569', 'SUP6398', 'Artichoke', 'Canned', '3.4119', 'per pound', '260', '2024-04-24'),
('375953', 'veg01', 'V6421318', 'SUP6398', 'Celery, trimmed bunches', 'Fresh', '0.9842', 'per pound', '65', '2024-02-05'),
('313346', 'veg01', 'V6145133', 'SUP9129', 'Lettuce, romaine, heads', 'Fresh', '1.8299', 'per pound', '150', '2024-02-04'),
('668708', 'veg01', 'V5852244', 'SUP3540', 'Red peppers', 'Fresh', '2.1614', 'per pound', '221', '2024-03-25'),
('102668', 'veg01', 'V2707657', 'SUP9129', 'Turnip greens', 'Fresh', '2.4176', 'per pound', '128', '2024-03-01'),
('770439', 'fru01', 'V4364107', 'SUP3540', 'Apples, applesauce', 'Canned', '1.066', 'per pound', '259', '2024-03-07'),
('750363', 'fru01', 'V7013014', 'SUP9129', 'Cantaloupe', 'Fresh', '0.5767', 'per pound', '10', '2024-02-17'),
('583040', 'fru01', 'V4739167', 'SUP5170', 'Grapefruit', 'Fresh', '1.1695', 'per pound', '227', '2024-04-25'),
('302429', 'fru01', 'V4711908', 'SUP5170', 'Mangoes', 'Fresh', '1.1513', 'per pound', '91', '2024-04-28'),
('415768', 'fru01', 'V6885878', 'SUP6398', 'Pears, packed in juice', 'Canned', '1.9546', 'per pound', '299', '2024-02-27');

-- Inserting into orders table
INSERT INTO orders (order_id, customer_id, order_date, ship_amount, tax_amount, ship_date, address_id, card_type, card_expires, billing_address_id)
VALUES
('ORD820', 'C7167829', '2024-02-15 09:59:00', '8', '0', '2024-02-15 16:39:00', 'ADD298', 'VISA', '2025-06-01', 'BIL773'),
('ORD955', 'C5622204', '2024-04-01 09:49:00', '10', '0', '2024-04-01 15:49:00', 'ADD833', 'MASTERCARD', '2028-01-01', 'BIL876'),
('ORD498', 'C3357417', '2024-03-09 15:57:00', '12', '0', '2024-03-10 08:57:00', 'ADD237', 'AMEX', '2026-03-01', 'BIL628'),
('ORD645', 'C1559970', '2024-04-13 00:12:00', '5', '0', '2024-04-13 13:12:00', 'ADD561', 'VISA', '2024-10-01', 'BIL431'),
('ORD496', 'C7167829', '2024-02-07 07:49:00', '10', '4.5', '2024-02-07 16:29:00', 'ADD298', 'VISA', '2026-03-01', 'BIL773'),
('ORD823', 'C8961662', '2024-02-13 08:32:00', '15', '12.8', '2024-02-15 08:25:00', 'ADD446', 'DISCOVER', '2027-05-01', 'BIL723'),
('ORD137', 'C7167829', '2024-04-17 23:12:00', '20', '0.99', '2024-04-18 11:40:00', 'ADD298', 'MASTERCARD', '2025-09-01', 'BIL773'),
('ORD639', 'C3357417', '2024-03-24 02:57:00', '14', '0', '2024-03-26 08:57:00', 'ADD237', 'VISA', '2025-01-01', 'BIL628'),
('ORD297', 'C1680009', '2024-04-12 13:37:00', '0', '2', '2024-04-13 09:57:00', 'ADD281', 'VISA', '2027-07-01', 'BIL458'),
('ORD842', 'C4533785', '2024-05-01 16:18:00', '0', '7', '2024-05-02 13:58:00', 'ADD576', 'VISA', '2029-11-01', 'BIL716'),
('ORD947', 'C5765693', '2024-05-04 05:17:00', '7', '0', '2024-05-04 15:27:00', 'ADD931', 'DISCOVER', '2028-12-01', 'BIL958');

-- Inserting into orders_items table
INSERT INTO order_items (item_id, order_id, product_id, item_price, quantity, total_amount)
VALUES
('ITE441', 'ORD820', '200743', '3.41', '5', '17.06'),
('ITE738', 'ORD820', '770439', '1.07', '16', '17.06'),
('ITE932', 'ORD820', '750363', '0.58', '23', '13.26'),
('ITE655', 'ORD820', '302429', '1.15', '6', '6.91'),
('ITE181', 'ORD955', '770439', '1.07', '19', '20.25'),
('ITE118', 'ORD498', '415768', '1.95', '27', '52.77'),
('ITE894', 'ORD645', '313346', '1.83', '11', '20.13'),
('ITE575', 'ORD496', '375953', '0.98', '2', '1.97'),
('ITE840', 'ORD496', '302429', '1.15', '13', '14.97'),
('ITE146', 'ORD823', '668708', '2.16', '18', '38.91'),
('ITE935', 'ORD137', '668708', '2.16', '1', '2.16'),
('ITE524', 'ORD639', '102668', '2.42', '26', '62.86'),
('ITE905', 'ORD639', '770439', '1.07', '3', '3.20'),
('ITE741', 'ORD639', '200743', '3.41', '10', '34.12'),
('ITE796', 'ORD297', '375953', '0.98', '9', '8.86'),
('ITE939', 'ORD297', '313346', '1.83', '17', '31.11'),
('ITE171', 'ORD842', '583040', '1.17', '12', '14.03'),
('ITE197', 'ORD842', '302429', '1.15', '14', '16.12'),
('ITE422', 'ORD842', '415768', '1.95', '28', '54.73'),
('ITE535', 'ORD947', '375953', '0.98', '4', '3.94'),
('ITE596', 'ORD947', '102668', '2.42', '25', '60.44'),
('ITE357', 'ORD947', '770439', '1.07', '24', '25.58');

SELECT *
FROM categories;

SELECT *
FROM customers;

SELECT *
FROM customers_address;

SELECT *
FROM order_items;

SELECT *
FROM orders; 

SELECT *
FROM products;

SELECT *
FROM suppliers;

