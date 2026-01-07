-- Data Cleaning 

-- Before Cleanning 38175
SELECT COUNT(*) FROM transactions;

-- for qty negativ
DELETE FROM transactions
WHERE quantity REGEXP '^-';

-- harga 0 delete 
DELETE FROM transactions
WHERE unit_price = '0';

-- delete transaction tanpa customers
DELETE FROM transactions
WHERE customer_id IS NULL
   OR customer_id = '';
   
SELECT COUNT(*) FROM transactions;
-- After Cleaning 24465


-- Data Transformation

-- Convert to numeric
ALTER TABLE transactions
MODIFY quantity INT,
MODIFY unit_price DECIMAL(10,2);

-- Add Revenue Column
ALTER TABLE transactions
ADD COLUMN revenue DECIMAL(12,2);

-- Check Column and data type
DESCRIBE transactions;

-- Update isi column 
UPDATE transactions
SET revenue = quantity * unit_price
WHERE quantity IS NOT NULL
  AND unit_price IS NOT NULL;
  
  -- Check revenue
SELECT quantity, unit_price, revenue
FROM transactions
LIMIT 10;

-- Order /customer
SELECT customer_id, COUNT(DISTINCT invoice_no) AS total_orders
FROM transactions
GROUP BY customer_id
ORDER BY total_orders DESC
LIMIT 10;

-- Revenue product 
SELECT description, SUM(revenue) AS total_revenue
FROM transactions
GROUP BY description
ORDER BY total_revenue DESC
LIMIT 10;

-- Penjualan per negara 
SELECT country, SUM(revenue) AS total_revenue
FROM transactions
GROUP BY country
ORDER BY total_revenue DESC;

-- Tren penjualan per bulan
SELECT 
    DATE_FORMAT(STR_TO_DATE(invoice_date, '%m/%d/%Y %H:%i'), '%Y-%m') AS month,
    SUM(revenue) AS total_revenue
FROM transactions
GROUP BY month
ORDER BY month;

-- See table 
SELECT * FROM transactions;

-- duplikasi data 
SELECT invoice_no, stock_code, COUNT(*) AS total
FROM transactions
GROUP BY invoice_no, stock_code
HAVING total > 1;

WITH duplicate_cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY invoice_no, stock_code, quantity, unit_price
               ORDER BY invoice_no
           ) AS row_num
    FROM transactions
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

-- cek duplicate
SELECT invoice_no, stock_code, COUNT(*) AS total
FROM transactions
GROUP BY invoice_no, stock_code, quantity, unit_price
HAVING total > 1;

-- create transaction_clean
CREATE VIEW transactions_clean AS
SELECT
    invoice_no,
    stock_code,
    description,
    customer_id,
    country,
    DATE(invoice_date) AS order_date,
    SUM(quantity) AS quantity,
    unit_price,
    SUM(revenue) AS revenue
FROM transactions
GROUP BY
    invoice_no, stock_code, description,
    customer_id, country, DATE(invoice_date), unit_price;


-- after create view 23638
SELECT COUNT(*) FROM transactions_clean;

SELECT * 
FROM transactions_clean
LIMIT 10;


-- Total Revenue
SELECT SUM(revenue) AS total_revenue
FROM transactions_clean;

-- Total Orders
SELECT COUNT(DISTINCT invoice_no) AS total_orders
FROM transactions_clean;

-- AVG order Value
SELECT 
    SUM(revenue) / COUNT(DISTINCT invoice_no) AS AOV
FROM transactions_clean;


-- Customer Analysis
SELECT 
    customer_id,
    SUM(revenue) AS total_spent
FROM transactions_clean
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- Product analysis Top Product by revenue
SELECT 
    description,
    SUM(revenue) AS total_revenue
FROM transactions_clean
GROUP BY description
ORDER BY total_revenue DESC
LIMIT 10;

-- Produk best seller of qty
SELECT 
    description,
    SUM(quantity) AS total_qty
FROM transactions_clean
GROUP BY description
ORDER BY total_qty DESC
LIMIT 10;

SELECT * 
FROM transactions_clean;




























