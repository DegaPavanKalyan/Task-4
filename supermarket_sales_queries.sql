
-- Step 1: Create Table
CREATE TABLE sales (
    invoice_id VARCHAR(20) PRIMARY KEY,
    branch CHAR(1),
    city VARCHAR(50),
    customer_type VARCHAR(20),
    gender VARCHAR(10),
    product_line VARCHAR(50),
    unit_price DECIMAL(10,2),
    quantity INT,
    tax_5percent DECIMAL(10,2),
    total DECIMAL(10,2),
    date DATE,
    time TIME,
    payment VARCHAR(20),
    cogs DECIMAL(10,2),
    gross_margin_percentage DECIMAL(5,2),
    gross_income DECIMAL(10,2),
    rating DECIMAL(3,1)
);

-- Step 2: SELECT, WHERE, ORDER BY, GROUP BY
-- Top 5 highest sales
SELECT invoice_id, total
FROM sales
ORDER BY total DESC
LIMIT 5;

-- Total revenue per city
SELECT city, SUM(total) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC;

-- Average rating by gender
SELECT gender, AVG(rating) AS avg_rating
FROM sales
GROUP BY gender;

-- Step 3: JOINS
-- Create a supporting table
CREATE TABLE product_info (
    product_line VARCHAR(50) PRIMARY KEY,
    category VARCHAR(50),
    warranty_available BOOLEAN
);

-- INNER JOIN with sales
SELECT s.invoice_id, s.product_line, p.category
FROM sales s
INNER JOIN product_info p ON s.product_line = p.product_line;

-- Step 4: Subquery
-- Transactions above average total
SELECT invoice_id, total
FROM sales
WHERE total > (
    SELECT AVG(total)
    FROM sales
);

-- Step 5: Aggregate Functions
-- Total and average income by branch
SELECT branch, SUM(gross_income) AS total_income, AVG(gross_income) AS avg_income
FROM sales
GROUP BY branch;

-- Step 6: Views and Indexes
-- Create view for daily revenue
CREATE VIEW daily_revenue AS
SELECT date, SUM(total) AS total_sales, COUNT(*) AS num_transactions
FROM sales
GROUP BY date;

-- Indexes for optimization
CREATE INDEX idx_city ON sales(city);
CREATE INDEX idx_product_line ON sales(product_line);
CREATE INDEX idx_date ON sales(date);
