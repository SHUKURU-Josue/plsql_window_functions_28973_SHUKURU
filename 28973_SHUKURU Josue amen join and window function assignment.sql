CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    region VARCHAR(50) NOT NULL,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT chk_region CHECK (region IN ('North America', 'Europe', 'Asia-Pacific'))
);
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price > 0),
    supplier VARCHAR(100),
    CONSTRAINT chk_category CHECK (category IN ('Electronics', 'Clothing', 'Home & Garden', 'Sports', 'Books', 'Toys'))
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    transaction_date DATE NOT NULL DEFAULT CURRENT_DATE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    total_amount DECIMAL(12, 2) NOT NULL CHECK (total_amount > 0),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);
CREATE INDEX idx_transactions_customer ON transactions(customer_id);
CREATE INDEX idx_transactions_product ON transactions(product_id);
CREATE INDEX idx_transactions_date ON transactions(transaction_date);
CREATE INDEX idx_customers_region ON customers(region);
CREATE INDEX idx_products_category ON products(category);

INSERT INTO customers (customer_name, email, region, registration_date) VALUES
-- North America Customers
('SHUKURU Josue Amen', 'shukurujosue3.amen@gmail.com', 'North America', '2024-01-15'),
('Sarah Johnson', 'sarah.johnson@email.com', 'North America', '2024-01-20'),
('Michael Brown', 'michael.brown@email.com', 'North America', '2024-02-05'),
('Emily Davis', 'emily.davis@email.com', 'North America', '2024-02-18'),
('David Wilson', 'david.wilson@email.com', 'North America', '2024-03-10'),
('Jessica Martinez', 'jessica.martinez@email.com', 'North America', '2024-03-22'),
('James Anderson', 'james.anderson@email.com', 'North America', '2024-04-08'),
('Jennifer Taylor', 'jennifer.taylor@email.com', 'North America', '2024-04-15'),
('Robert Thomas', 'robert.thomas@email.com', 'North America', '2024-05-01'),
('Linda Moore', 'linda.moore@email.com', 'North America', '2024-05-12'),
('William Jackson', 'william.jackson@email.com', 'North America', '2024-06-03'),
('Barbara White', 'barbara.white@email.com', 'North America', '2024-06-20'),
('Richard Harris', 'richard.harris@email.com', 'North America', '2024-07-05'),
('Susan Clark', 'susan.clark@email.com', 'North America', '2024-07-18'),
('Joseph Lewis', 'joseph.lewis@email.com', 'North America', '2024-08-02'),
('Karen Robinson', 'karen.robinson@email.com', 'North America', '2024-08-25'),
('Christopher Walker', 'christopher.walker@email.com', 'North America', '2024-09-10');
INSERT INTO customers (customer_name, email, region, registration_date) VALUES
-- Europe Customers
('Emma Schmidt', 'emma.schmidt@email.de', 'Europe', '2024-01-25'),
('Oliver Müller', 'oliver.muller@email.de', 'Europe', '2024-02-08'),
('Sophie Dubois', 'sophie.dubois@email.fr', 'Europe', '2024-02-22'),
('Lucas Martin', 'lucas.martin@email.fr', 'Europe', '2024-03-15'),
('Mia Rossi', 'mia.rossi@email.it', 'Europe', '2024-03-28'),
('Alessandro Ferrari', 'alessandro.ferrari@email.it', 'Europe', '2024-04-12'),
('Charlotte García', 'charlotte.garcia@email.es', 'Europe', '2024-04-25'),
('Hugo López', 'hugo.lopez@email.es', 'Europe', '2024-05-08'),
('Amelia Kowalski', 'amelia.kowalski@email.pl', 'Europe', '2024-05-20'),
('Liam Silva', 'liam.silva@email.pt', 'Europe', '2024-06-05'),
('Isabella Nielsen', 'isabella.nielsen@email.dk', 'Europe', '2024-06-18'),
('Noah Andersson', 'noah.andersson@email.se', 'Europe', '2024-07-01'),
('Sophia van der Berg', 'sophia.vandenberg@email.nl', 'Europe', '2024-07-22'),
('Elijah Janssen', 'elijah.janssen@email.be', 'Europe', '2024-08-08'),
('Ava Novak', 'ava.novak@email.cz', 'Europe', '2024-08-28');

INSERT INTO customers (customer_name, email, region, registration_date) VALUES
-- Asia-Pacific Customers
('Yuki Tanaka', 'yuki.tanaka@email.jp', 'Asia-Pacific', '2024-02-01'),
('Hiroshi Suzuki', 'hiroshi.suzuki@email.jp', 'Asia-Pacific', '2024-02-15'),
('Li Wei', 'li.wei@email.cn', 'Asia-Pacific', '2024-03-05'),
('Zhang Ming', 'zhang.ming@email.cn', 'Asia-Pacific', '2024-03-20'),
('Priya Sharma', 'priya.sharma@email.in', 'Asia-Pacific', '2024-04-02'),
('Raj Patel', 'raj.patel@email.in', 'Asia-Pacific', '2024-04-18'),
('Min-Jun Kim', 'minjun.kim@email.kr', 'Asia-Pacific', '2024-05-05'),
('Seo-Yeon Park', 'seoyeon.park@email.kr', 'Asia-Pacific', '2024-05-22'),
('Mohammed Ali', 'mohammed.ali@email.ae', 'Asia-Pacific', '2024-06-10'),
('Fatima Hassan', 'fatima.hassan@email.ae', 'Asia-Pacific', '2024-06-25'),
('Nguyen Van', 'nguyen.van@email.vn', 'Asia-Pacific', '2024-07-12'),
('Tran Thi', 'tran.thi@email.vn', 'Asia-Pacific', '2024-07-28'),
('Ahmad Rahman', 'ahmad.rahman@email.my', 'Asia-Pacific', '2024-08-15'),
('Siti Abdullah', 'siti.abdullah@email.my', 'Asia-Pacific', '2024-09-01'),
('James Chen', 'james.chen@email.au', 'Asia-Pacific', '2024-09-20');
INSERT INTO customers (customer_name, email, region, registration_date) VALUES
-- Additional customers for inactive customer analysis
('Mark Thompson', 'mark.thompson@email.com', 'North America', '2025-01-05'),
('Anna Kowalczyk', 'anna.kowalczyk@email.pl', 'Europe', '2025-01-10'),
('Kevin Wu', 'kevin.wu@email.cn', 'Asia-Pacific', '2025-01-15');

-- Insert Products (40 products across 6 categories)
INSERT INTO products (product_name, category, unit_price, supplier) VALUES
-- Electronics (10 products)
('Wireless Bluetooth Headphones', 'Electronics', 79.99, 'TechSupply Inc'),
('4K Smart TV 55-inch', 'Electronics', 599.99, 'ElectroWorld'),
('Laptop Computer 15-inch', 'Electronics', 899.99, 'CompuTech'),
('Smartphone 128GB', 'Electronics', 699.99, 'MobileTech'),
('Tablet 10-inch', 'Electronics', 349.99, 'TechSupply Inc'),
('Digital Camera DSLR', 'Electronics', 549.99, 'PhotoPro'),
('Gaming Console', 'Electronics', 499.99, 'GameWorld'),
('Smartwatch Fitness Tracker', 'Electronics', 199.99, 'WearableTech'),
('Portable Bluetooth Speaker', 'Electronics', 59.99, 'AudioMax'),
('Wireless Router Mesh System', 'Electronics', 179.99, 'NetworkPro');
INSERT INTO products (product_name, category, unit_price, supplier) VALUES
-- Clothing (8 products)
('Denim Jeans Classic Fit', 'Clothing', 49.99, 'Denim World'),
('Winter Jacket Waterproof', 'Clothing', 129.99, 'OutdoorGear'),
('Running Shoes Athletic', 'Clothing', 89.99, 'SportStyle'),
('Summer Dress Floral', 'Clothing', 59.99, 'Fashion Hub'),
('Leather Belt Genuine', 'Clothing', 34.99, 'Accessories Plus'),
('Cotton Hoodie Unisex', 'Clothing', 44.99, 'ComfortWear');

INSERT INTO products (product_name, category, unit_price, supplier) VALUES
-- Home & Garden (10 products)
('Coffee Maker Programmable', 'Home & Garden', 79.99, 'HomeAppliances'),
('Vacuum Cleaner Robotic', 'Home & Garden', 299.99, 'CleanTech'),
('Air Purifier HEPA Filter', 'Home & Garden', 159.99, 'HealthyHome'),
('LED Desk Lamp Adjustable', 'Home & Garden', 39.99, 'LightingSolutions'),
('Electric Kettle Stainless', 'Home & Garden', 44.99, 'KitchenPro'),
('Indoor Plant Monstera', 'Home & Garden', 29.99, 'GreenThumb'),
('Throw Pillow Set 4-Pack', 'Home & Garden', 49.99, 'HomeDecor'),
('Garden Tool Set 10-Piece', 'Home & Garden', 69.99, 'GardenMaster'),
('Cookware Set Non-Stick', 'Home & Garden', 129.99, 'ChefSupply'),
('Bedding Set Queen Size', 'Home & Garden', 89.99, 'SleepComfort');

INSERT INTO products (product_name, category, unit_price, supplier) VALUES
-- Sports (5 products)
('Yoga Mat Extra Thick', 'Sports', 34.99, 'FitnessPro'),
('Dumbbell Set Adjustable', 'Sports', 149.99, 'GymEquip'),
('Tennis Racket Professional', 'Sports', 119.99, 'SportGear'),
('Soccer Ball Official Size', 'Sports', 29.99, 'TeamSports'),
('Bicycle Mountain 26-inch', 'Sports', 449.99, 'CycleWorld');

INSERT INTO products (product_name, category, unit_price, supplier) VALUES
-- Books (4 products)
('Business Strategy Handbook', 'Books', 29.99, 'BookPublishers'),
('Cooking Masterclass Guide', 'Books', 34.99, 'Culinary Press'),
('Self-Help Motivation Book', 'Books', 19.99, 'Inspire Publishing'),
('Science Fiction Novel Series', 'Books', 24.99, 'Fiction House');

INSERT INTO products (product_name, category, unit_price, supplier) VALUES
-- Toys (3 products)
('Building Blocks Set 500pc', 'Toys', 44.99, 'KidsToy Co'),
('Remote Control Car Racing', 'Toys', 59.99, 'PlayTech'),
('Educational Puzzle Game', 'Toys', 24.99, 'LearnPlay');

select * from products;

- January 2024
INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
(1, 3, '2024-01-16', 1, 899.99),
(2, 11, '2024-01-21', 2, 49.98),
(3, 21, '2024-01-22', 1, 79.99),
(18, 4, '2024-01-26', 1, 699.99),
(19, 15, '2024-01-28', 1, 89.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- February 2024
(4, 1, '2024-02-02', 1, 79.99),
(20, 23, '2024-02-09', 1, 159.99),
(21, 12, '2024-02-10', 3, 119.97),
(5, 31, '2024-02-12', 1, 34.99),
(35, 4, '2024-02-16', 1, 699.99),
(36, 26, '2024-02-20', 1, 29.99),
(6, 22, '2024-02-23', 1, 299.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- March 2024
(7, 2, '2024-03-05', 1, 599.99),
(22, 29, '2024-03-11', 1, 129.99),
(8, 25, '2024-03-12', 1, 44.99),
(37, 8, '2024-03-16', 2, 399.98),
(23, 13, '2024-03-21', 1, 49.99),
(9, 33, '2024-03-23', 1, 119.99),
(38, 35, '2024-03-26', 1, 29.99),
(10, 7, '2024-03-28', 1, 499.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- April 2024
(24, 14, '2024-04-03', 1, 129.99),
(11, 5, '2024-04-09', 1, 349.99),
(39, 36, '2024-04-13', 1, 34.99),
(25, 27, '2024-04-16', 2, 99.98),
(12, 9, '2024-04-19', 1, 59.99),
(40, 37, '2024-04-23', 1, 19.99),
(26, 30, '2024-04-26', 1, 89.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- May 2024
(13, 6, '2024-05-02', 1, 549.99),
(27, 32, '2024-05-06', 1, 149.99),
(14, 10, '2024-05-13', 1, 179.99),
(41, 1, '2024-05-16', 1, 79.99),
(28, 28, '2024-05-19', 1, 69.99),
(15, 4, '2024-05-21', 1, 699.99),
(42, 15, '2024-05-25', 2, 179.98);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- June 2024
(29, 16, '2024-06-04', 1, 59.99),
(16, 8, '2024-06-11', 1, 199.99),
(43, 24, '2024-06-14', 1, 39.99),
(30, 11, '2024-06-21', 2, 49.98),
(17, 3, '2024-06-23', 1, 899.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- July 2024
(31, 21, '2024-07-02', 1, 79.99),
(1, 2, '2024-07-06', 1, 599.99),
(45, 12, '2024-07-13', 1, 39.99),
(32, 22, '2024-07-19', 1, 299.99),
(2, 31, '2024-07-23', 2, 69.98),
(3, 7, '2024-07-29', 1, 499.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- August 2024
(33, 23, '2024-08-03', 1, 159.99),
(4, 1, '2024-08-09', 1, 79.99),
(46, 34, '2024-08-16', 1, 29.99),
(34, 13, '2024-08-20', 2, 99.98),
(5, 8, '2024-08-26', 1, 199.99),
(6, 5, '2024-08-29', 1, 349.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- September 2024
(7, 4, '2024-09-02', 1, 699.99),
(35, 14, '2024-09-11', 1, 129.99),
(8, 6, '2024-09-15', 1, 549.99),
(36, 25, '2024-09-21', 1, 44.99),
(9, 10, '2024-09-24', 1, 179.99);
INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- October 2024
(10, 3, '2024-10-01', 1, 899.99),
(37, 27, '2024-10-08', 1, 49.99),
(11, 9, '2024-10-12', 2, 119.98),
(38, 33, '2024-10-19', 1, 119.99),
(12, 2, '2024-10-22', 1, 599.99),
(13, 7, '2024-10-28', 1, 499.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- November 2024
(39, 15, '2024-11-03', 1, 89.99),
(14, 4, '2024-11-07', 1, 699.99),
(40, 26, '2024-11-14', 2, 59.98),
(15, 1, '2024-11-18', 1, 79.99),
(41, 8, '2024-11-21', 1, 199.99),
(16, 5, '2024-11-25', 1, 349.99);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- December 2024
(42, 3, '2024-12-02', 1, 899.99),
(17, 2, '2024-12-05', 1, 599.99),
(43, 11, '2024-12-09', 3, 74.97),
(18, 7, '2024-12-12', 1, 499.99),
(44, 12, '2024-12-16', 2, 79.98),
(19, 6, '2024-12-19', 1, 549.99),
(45, 4, '2024-12-23', 1, 699.99),
(20, 1, '2024-12-28', 2, 159.98);

INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
-- January 2025 (Recent transactions)
(21, 8, '2025-01-03', 1, 199.99),
(1, 10, '2025-01-08', 1, 179.99),
(22, 5, '2025-01-12', 1, 349.99),
(2, 3, '2025-01-15', 1, 899.99),
(23, 9, '2025-01-19', 1, 59.99),
(3, 2, '2025-01-22', 1, 599.99),
(24, 7, '2025-01-26', 1, 499.99),
(4, 4, '2025-01-29', 1, 699.99);

-- Additional repeated transactions for better analysis
-- Customer 1 - High value customer with multiple purchases
INSERT INTO transactions (customer_id, product_id, transaction_date, quantity, total_amount) VALUES
(1, 21, '2024-03-10', 1, 79.99),
(1, 8, '2024-05-15', 1, 199.99),
(1, 31, '2024-08-20', 1, 34.99),
(1, 4, '2024-11-12', 1, 699.99),

-- Customer 2 - Regular customer
(2, 11, '2024-04-05', 2, 49.98),
(2, 15, '2024-06-18', 1, 89.99),
(2, 23, '2024-09-22', 1, 159.99),
(2, 12, '2024-12-05', 1, 39.99),

-- Customer 3 - Loyal customer
(3, 5, '2024-05-08', 1, 349.99),
(3, 8, '2024-07-19', 1, 199.99),
(3, 1, '2024-10-03', 2, 159.98),
(3, 4, '2024-12-20', 1, 699.99),

-- More diverse transactions for window function analysis
(5, 11, '2024-03-15', 1, 24.99),
(5, 12, '2024-06-22', 2, 79.98),
(5, 13, '2024-09-10', 1, 49.99),
(6, 14, '2024-04-12', 1, 129.99),
(6, 15, '2024-07-25', 1, 89.99),
(7, 16, '2024-05-05', 1, 59.99),
(7, 17, '2024-08-14', 1, 34.99),
(8, 18, '2024-06-07', 1, 44.99),
(9, 19, '2024-07-11', 1, 29.99),
(10, 20, '2024-08-18', 1, 49.99);

select * from transactions;

-- ============================================================================
-- VERIFICATION QUERIES
-- ============================================================================

-- Verify data insertion
SELECT 'Customers' as table_name, COUNT(*) as record_count FROM customers
UNION ALL
SELECT 'Products', COUNT(*) FROM products
UNION ALL
SELECT 'Transactions', COUNT(*) FROM transactions;

-- Display sample data
SELECT 'Sample Customers:' as info;
SELECT customer_id, customer_name, region, registration_date 
FROM customers 
ORDER BY customer_id 
LIMIT 10;

SELECT 'Sample Products:' as info;
SELECT product_id, product_name, category, unit_price 
FROM products 
ORDER BY product_id 
LIMIT 10;

SELECT 'Sample Transactions:' as info;
SELECT transaction_id, customer_id, product_id, transaction_date, total_amount 
FROM transactions 
ORDER BY transaction_date DESC 
LIMIT 10;

-- ============================================================================
-- PART A: SQL JOINs Implementation
-- Course: INSY 8311 - Database Development with PL/SQL
-- Assignment: Individual Assignment I
-- ============================================================================

-- ============================================================================
-- 1. INNER JOIN
-- Purpose: Retrieve transactions with valid customers and products
-- Business Use: Analyze actual sales with complete information
-- ============================================================================

SELECT 
    t.transaction_id,
    c.customer_name,
    c.region,
    p.product_name,
    p.category,
    t.transaction_date,
    t.quantity,
    t.total_amount
FROM transactions t
INNER JOIN customers c ON t.customer_id = c.customer_id
INNER JOIN products p ON t.product_id = p.product_id
ORDER BY t.transaction_date DESC
LIMIT 20;

-- Business Interpretation:
-- This query returns only transactions that have both valid customer and 
-- product records, ensuring data integrity. It's useful for analyzing actual 
-- sales performance with complete information about who bought what and when.

-- ============================================================================
-- 2. LEFT JOIN (LEFT OUTER JOIN)
-- Purpose: Identify customers who have never made a transaction
-- Business Use: Find inactive customers for re-engagement campaigns
-- ============================================================================

SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    c.region,
    c.registration_date,
    COUNT(t.transaction_id) as transaction_count
FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
GROUP BY c.customer_id, c.customer_name, c.email, c.region, c.registration_date
HAVING COUNT(t.transaction_id) = 0
ORDER BY c.registration_date DESC;



-- Business Interpretation:
-- This identifies inactive customers who registered but never purchased. 
-- These customers are prime targets for re-engagement campaigns, welcome offers, 
-- or onboarding improvements to increase conversion rates. The second query 
-- provides a complete view with activity levels for segmentation.

-- ============================================================================
-- 3. RIGHT JOIN (RIGHT OUTER JOIN)
-- Purpose: Detect products with no sales activity
-- Business Use: Identify underperforming inventory
-- ============================================================================

SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price,
    COUNT(t.transaction_id) as times_sold,
    COALESCE(SUM(t.quantity), 0) as total_quantity_sold,
    COALESCE(SUM(t.total_amount), 0) as total_revenue
FROM transactions t
RIGHT JOIN products p ON t.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category, p.unit_price
HAVING COUNT(t.transaction_id) = 0
ORDER BY p.category, p.product_name;



-- Business Interpretation:
-- Products with zero sales may indicate poor market fit, pricing issues, or 
-- inadequate marketing. This insight helps in making decisions about inventory 
-- reduction, product discontinuation, or promotional strategies. The extended 
-- query helps categorize all products by performance level.

-- ============================================================================
-- 4. FULL OUTER JOIN
-- Purpose: Complete view of customers and products including unmatched records
-- Business Use: Comprehensive gap analysis
-- ============================================================================

-- Full comparison showing all combinations
SELECT 
    c.customer_id,
    c.customer_name,
    c.region,
    p.product_id,
    p.product_name,
    p.category,
    t.transaction_id,
    t.total_amount,
    CASE 
        WHEN t.transaction_id IS NULL AND c.customer_id IS NOT NULL THEN 'Customer with no purchases'
        WHEN t.transaction_id IS NULL AND p.product_id IS NOT NULL THEN 'Product never sold'
        WHEN c.customer_id IS NULL THEN 'Orphaned transaction'
        ELSE 'Valid transaction'
    END as record_status
FROM customers c
FULL OUTER JOIN transactions t ON c.customer_id = t.customer_id
FULL OUTER JOIN products p ON t.product_id = p.product_id
WHERE t.transaction_id IS NULL
ORDER BY c.customer_id, p.product_id;

-- Summary of gaps
SELECT 
    record_type,
    COUNT(*) as count
FROM (
    SELECT 
        CASE 
            WHEN t.transaction_id IS NULL AND c.customer_id IS NOT NULL THEN 'Inactive Customers'
            WHEN t.transaction_id IS NULL AND p.product_id IS NOT NULL THEN 'Unsold Products'
            ELSE 'Active Records'
        END as record_type
    FROM customers c
    FULL OUTER JOIN transactions t ON c.customer_id = t.customer_id
    FULL OUTER JOIN products p ON t.product_id = p.product_id
) gap_analysis
GROUP BY record_type;

-- Business Interpretation:
-- This comprehensive view reveals both inactive customers and unsold products, 
-- providing a complete picture of underutilized resources. It helps identify 
-- gaps in customer engagement and product portfolio optimization opportunities.
-- The summary provides quick metrics on business gaps.

-- ============================================================================
-- 5. SELF JOIN
-- Purpose: Compare customers within the same region
-- Business Use: Peer analysis and regional cohort identification
-- ============================================================================

-- Find customer pairs in the same region
SELECT 
    c1.customer_id as customer_1_id,
    c1.customer_name as customer_1_name,
    c2.customer_id as customer_2_id,
    c2.customer_name as customer_2_name,
    c1.region,
    c1.registration_date as cust1_reg_date,
    c2.registration_date as cust2_reg_date,
    ABS(EXTRACT(DAY FROM c1.registration_date - c2.registration_date)) as days_apart
FROM customers c1
INNER JOIN customers c2 ON c1.region = c2.region 
    AND c1.customer_id < c2.customer_id
ORDER BY c1.region, days_apart
LIMIT 50;

-- Self-join to compare customer spending in same region
SELECT 
    c1.customer_id,
    c1.customer_name,
    c1.region,
    COALESCE(SUM(t1.total_amount), 0) as customer_total_spent,
    ROUND(AVG(region_avg.avg_spending), 2) as region_average_spending,
    ROUND(COALESCE(SUM(t1.total_amount), 0) - AVG(region_avg.avg_spending), 2) as difference_from_avg
FROM customers c1
LEFT JOIN transactions t1 ON c1.customer_id = t1.customer_id
INNER JOIN (
    SELECT 
        c2.region,
        AVG(COALESCE(t2.total_amount, 0)) as avg_spending
    FROM customers c2
    LEFT JOIN transactions t2 ON c2.customer_id = t2.customer_id
    GROUP BY c2.region
) region_avg ON c1.region = region_avg.region
GROUP BY c1.customer_id, c1.customer_name, c1.region
ORDER BY c1.region, customer_total_spent DESC;

-- Self-join to find transactions on same day
SELECT 
    t1.transaction_id as transaction_1,
    t1.customer_id as customer_1,
    t2.transaction_id as transaction_2,
    t2.customer_id as customer_2,
    t1.transaction_date,
    t1.total_amount as amount_1,
    t2.total_amount as amount_2
FROM transactions t1
INNER JOIN transactions t2 ON t1.transaction_date = t2.transaction_date
    AND t1.transaction_id < t2.transaction_id
ORDER BY t1.transaction_date DESC
LIMIT 30;

-- Business Interpretation:
-- Self-joins enable regional cohort analysis, helping identify customer pairs 
-- in the same geographic area for referral programs, local promotions, or 
-- understanding regional customer acquisition patterns. The spending comparison 
-- shows how customers perform relative to their regional peers, useful for 
-- personalized targeting. Same-day transaction analysis helps understand 
-- purchasing patterns and potential seasonal trends.

-- ============================================================================
-- COMPREHENSIVE JOIN EXAMPLE
-- Purpose: Complex multi-table join with aggregations
-- Business Use: Executive dashboard metrics
-- ============================================================================

SELECT 
    c.region,
    p.category,
    COUNT(DISTINCT c.customer_id) as unique_customers,
    COUNT(t.transaction_id) as total_transactions,
    SUM(t.quantity) as total_units_sold,
    ROUND(SUM(t.total_amount)::numeric, 2) as total_revenue,
    ROUND(AVG(t.total_amount)::numeric, 2) as avg_transaction_value,
    MIN(t.transaction_date) as first_sale_date,
    MAX(t.transaction_date) as last_sale_date
FROM customers c
INNER JOIN transactions t ON c.customer_id = t.customer_id
INNER JOIN products p ON t.product_id = p.product_id
GROUP BY c.region, p.category
ORDER BY c.region, total_revenue DESC;

-- Business Interpretation:
-- This comprehensive analysis shows sales performance across regions and 
-- product categories, providing executive-level insights into which combinations 
-- drive the most revenue and customer engagement.

-- ============================================================================
-- END OF JOINS IMPLEMENTATION
-- ============================================================================



-- ============================================================================
-- PART B: Window Functions Implementation
-- Course: INSY 8311 - Database Development with PL/SQL
-- Assignment: Individual Assignment I
-- ============================================================================

-- ============================================================================
-- CATEGORY 1: RANKING FUNCTIONS
-- Functions: ROW_NUMBER(), RANK(), DENSE_RANK(), PERCENT_RANK()
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1.1 ROW_NUMBER()
-- Purpose: Assign unique sequential numbers to transactions per customer
-- Business Use: Track purchase sequence and identify first-time buyers
-- ----------------------------------------------------------------------------

SELECT 
    customer_id,
    transaction_id,
    transaction_date,
    total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id 
        ORDER BY transaction_date
    ) as purchase_sequence
FROM transactions
ORDER BY customer_id, purchase_sequence;

-- Extended analysis: First vs. Repeat purchases
SELECT 
    c.customer_name,
    t.transaction_id,
    t.transaction_date,
    t.total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY t.customer_id 
        ORDER BY t.transaction_date
    ) as purchase_number,
    CASE 
        WHEN ROW_NUMBER() OVER (PARTITION BY t.customer_id ORDER BY t.transaction_date) = 1 
        THEN 'First Purchase' 
        ELSE 'Repeat Purchase' 
    END as purchase_type
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY t.customer_id, t.transaction_date;

-- Business Interpretation:
-- This shows each customer's purchasing sequence, helping identify first-time 
-- purchases versus repeat purchases, and understand customer buying frequency 
-- patterns. This is crucial for customer lifecycle analysis and retention strategies.

-- ----------------------------------------------------------------------------
-- 1.2 RANK() and DENSE_RANK()
-- Purpose: Rank top products by revenue per region (Success Criteria #1)
-- Business Use: Identify best-selling products for inventory optimization
-- ----------------------------------------------------------------------------

-- Top 5 products per region by total revenue
SELECT 
    region,
    product_name,
    category,
    total_revenue,
    product_rank,
    dense_rank
FROM (
    SELECT 
        c.region,
        p.product_name,
        p.category,
        SUM(t.total_amount) as total_revenue,
        RANK() OVER (
            PARTITION BY c.region 
            ORDER BY SUM(t.total_amount) DESC
        ) as product_rank,
        DENSE_RANK() OVER (
            PARTITION BY c.region 
            ORDER BY SUM(t.total_amount) DESC
        ) as dense_rank
    FROM transactions t
    JOIN customers c ON t.customer_id = c.customer_id
    JOIN products p ON t.product_id = p.product_id
    GROUP BY c.region, p.product_name, p.category
) ranked_products
WHERE product_rank <= 5
ORDER BY region, product_rank;

-- Top customers by spending in each region
SELECT 
    region,
    customer_name,
    total_spent,
    customer_rank,
    customers_in_region
FROM (
    SELECT 
        c.region,
        c.customer_name,
        SUM(t.total_amount) as total_spent,
        RANK() OVER (
            PARTITION BY c.region 
            ORDER BY SUM(t.total_amount) DESC
        ) as customer_rank,
        COUNT(*) OVER (PARTITION BY c.region) as customers_in_region
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.region, c.customer_name
) ranked_customers
WHERE customer_rank <= 3
ORDER BY region, customer_rank;

-- Business Interpretation:
-- This identifies the top 5 revenue-generating products in each region, enabling 
-- region-specific inventory management and marketing strategies. RANK() creates 
-- gaps in ranking when ties occur, while DENSE_RANK() maintains consecutive ranks.
-- Understanding top customers per region helps with VIP program design and 
-- regional marketing budget allocation.

-- ----------------------------------------------------------------------------
-- 1.3 PERCENT_RANK()
-- Purpose: Calculate relative standing of customers by total spending
-- Business Use: Customer value percentile analysis
-- ----------------------------------------------------------------------------

SELECT 
    customer_id,
    customer_name,
    region,
    total_spent,
    ROUND(PERCENT_RANK() OVER (ORDER BY total_spent DESC)::numeric, 4) as spending_percentile,
    ROUND((PERCENT_RANK() OVER (ORDER BY total_spent DESC) * 100)::numeric, 2) as percentile_percent,
    CASE 
        WHEN PERCENT_RANK() OVER (ORDER BY total_spent DESC) <= 0.10 THEN 'Top 10% (Elite)'
        WHEN PERCENT_RANK() OVER (ORDER BY total_spent DESC) <= 0.25 THEN 'Top 25% (Premium)'
        WHEN PERCENT_RANK() OVER (ORDER BY total_spent DESC) <= 0.50 THEN 'Top 50% (Valued)'
        WHEN PERCENT_RANK() OVER (ORDER BY total_spent DESC) <= 0.75 THEN 'Top 75% (Standard)'
        ELSE 'Bottom 25% (Emerging)'
    END as customer_tier
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        c.region,
        COALESCE(SUM(t.total_amount), 0) as total_spent
    FROM customers c
    LEFT JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.customer_id, c.customer_name, c.region
) customer_spending
WHERE total_spent > 0
ORDER BY total_spent DESC;

-- Business Interpretation:
-- This provides a percentile-based view of customer value, showing where each 
-- customer ranks relative to all others. The top 25% represents high-value 
-- customers deserving premium service and retention efforts. PERCENT_RANK gives 
-- a value between 0 and 1, making it perfect for percentage-based segmentation.

-- ============================================================================
-- CATEGORY 2: AGGREGATE WINDOW FUNCTIONS
-- Functions: SUM(), AVG(), MIN(), MAX() with ROWS and RANGE frames
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 2.1 SUM() - Running Totals (Success Criteria #2)
-- Purpose: Calculate cumulative monthly sales
-- Business Use: Track progress toward annual revenue targets
-- ----------------------------------------------------------------------------

-- Running total of monthly sales
SELECT 
    DATE_TRUNC('month', transaction_date)::date as month,
    COUNT(transaction_id) as monthly_transactions,
    ROUND(SUM(total_amount)::numeric, 2) as monthly_sales,
    ROUND(SUM(SUM(total_amount)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )::numeric, 2) as running_total_sales,
    SUM(COUNT(transaction_id)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) as running_total_transactions
FROM transactions
GROUP BY DATE_TRUNC('month', transaction_date)
ORDER BY month;

-- Running total by region
SELECT 
    c.region,
    DATE_TRUNC('month', t.transaction_date)::date as month,
    ROUND(SUM(t.total_amount)::numeric, 2) as monthly_sales,
    ROUND(SUM(SUM(t.total_amount)) OVER (
        PARTITION BY c.region
        ORDER BY DATE_TRUNC('month', t.transaction_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    )::numeric, 2) as regional_running_total
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
GROUP BY c.region, DATE_TRUNC('month', t.transaction_date)
ORDER BY c.region, month;

-- Business Interpretation:
-- Running totals show cumulative revenue over time, essential for tracking 
-- progress toward annual targets and understanding growth trajectories. Each 
-- month's contribution to year-to-date performance is clearly visible. The 
-- regional breakdown helps compare growth rates across different markets.

-- ----------------------------------------------------------------------------
-- 2.2 AVG() - Moving Average (Success Criteria #5)
-- Purpose: Three-month moving average for sales trend smoothing
-- Business Use: Identify underlying trends filtering out noise
-- ----------------------------------------------------------------------------

-- 3-month moving average of sales
SELECT 
    DATE_TRUNC('month', transaction_date)::date as month,
    ROUND(SUM(total_amount)::numeric, 2) as monthly_sales,
    ROUND(AVG(SUM(total_amount)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    )::numeric, 2) as three_month_moving_avg,
    ROUND(AVG(SUM(total_amount)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
        ROWS BETWEEN 5 PRECEDING AND CURRENT ROW
    )::numeric, 2) as six_month_moving_avg,
    COUNT(*) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) as periods_in_calculation
FROM transactions
GROUP BY DATE_TRUNC('month', transaction_date)
ORDER BY month;

-- Moving average by product category
SELECT 
    p.category,
    DATE_TRUNC('month', t.transaction_date)::date as month,
    ROUND(SUM(t.total_amount)::numeric, 2) as monthly_category_sales,
    ROUND(AVG(SUM(t.total_amount)) OVER (
        PARTITION BY p.category
        ORDER BY DATE_TRUNC('month', t.transaction_date)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    )::numeric, 2) as category_3mo_moving_avg
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.category, DATE_TRUNC('month', t.transaction_date)
ORDER BY p.category, month;

-- Business Interpretation:
-- Moving averages smooth out short-term fluctuations to reveal underlying trends. 
-- A three-month window helps identify whether sales are genuinely growing, 
-- declining, or stabilizing, filtering out seasonal noise. The six-month average 
-- provides even more smoothing for long-term trend identification.

-- ----------------------------------------------------------------------------
-- 2.3 MIN() and MAX() Window Functions
-- Purpose: Compare each transaction to customer's spending range
-- Business Use: Identify unusual purchases and spending patterns
-- ----------------------------------------------------------------------------

-- Each transaction compared to customer's spending range
SELECT 
    c.customer_name,
    c.region,
    t.transaction_id,
    t.transaction_date,
    ROUND(t.total_amount::numeric, 2) as transaction_amount,
    ROUND(MIN(t.total_amount) OVER (PARTITION BY t.customer_id)::numeric, 2) as customer_min_purchase,
    ROUND(MAX(t.total_amount) OVER (PARTITION BY t.customer_id)::numeric, 2) as customer_max_purchase,
    ROUND(AVG(t.total_amount) OVER (PARTITION BY t.customer_id)::numeric, 2) as customer_avg_purchase,
    ROUND((t.total_amount - AVG(t.total_amount) OVER (PARTITION BY t.customer_id))::numeric, 2) as deviation_from_avg
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
ORDER BY c.customer_name, t.transaction_date;

-- Product price comparison with category range
SELECT 
    p.product_name,
    p.category,
    ROUND(p.unit_price::numeric, 2) as product_price,
    ROUND(MIN(p.unit_price) OVER (PARTITION BY p.category)::numeric, 2) as category_min_price,
    ROUND(MAX(p.unit_price) OVER (PARTITION BY p.category)::numeric, 2) as category_max_price,
    ROUND(AVG(p.unit_price) OVER (PARTITION BY p.category)::numeric, 2) as category_avg_price,
    CASE 
        WHEN p.unit_price < AVG(p.unit_price) OVER (PARTITION BY p.category) THEN 'Below Average'
        WHEN p.unit_price > AVG(p.unit_price) OVER (PARTITION BY p.category) THEN 'Above Average'
        ELSE 'Average'
    END as price_positioning
FROM products p
ORDER BY p.category, p.unit_price;

-- Business Interpretation:
-- This reveals each customer's purchasing behavior range. Large differences 
-- between min and max suggest variable buying patterns, while small ranges 
-- indicate consistent purchase amounts, informing personalized pricing strategies. 
-- Transactions significantly above average may indicate special occasions or 
-- upselling success. Product price positioning helps understand competitive 
-- placement within each category.

-- ----------------------------------------------------------------------------
-- 2.4 Aggregate Functions with RANGE Frame
-- Purpose: Demonstrate difference between ROWS and RANGE
-- Business Use: Advanced window frame understanding
-- ----------------------------------------------------------------------------

-- Compare ROWS vs RANGE frame behavior
SELECT 
    DATE_TRUNC('month', transaction_date)::date as month,
    ROUND(SUM(total_amount)::numeric, 2) as monthly_sales,
    -- ROWS: Physical row-based window
    ROUND(SUM(SUM(total_amount)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    )::numeric, 2) as sum_rows_frame,
    -- RANGE: Logical value-based window (includes ties)
    ROUND(SUM(SUM(total_amount)) OVER (
        ORDER BY DATE_TRUNC('month', transaction_date)
        RANGE BETWEEN INTERVAL '1 month' PRECEDING AND INTERVAL '1 month' FOLLOWING
    )::numeric, 2) as sum_range_frame
FROM transactions
GROUP BY DATE_TRUNC('month', transaction_date)
ORDER BY month;

-- Business Interpretation:
-- ROWS frame counts physical rows regardless of duplicate values, while RANGE 
-- frame includes all rows with values within the specified range. This is crucial 
-- when dealing with tied values in your ordering column. Understanding this 
-- distinction helps choose the appropriate frame type for accurate analysis.

-- ============================================================================
-- END OF CATEGORIES 1 & 2
-- Continue in next script file for Categories 3 & 4
-- ============================================================================


