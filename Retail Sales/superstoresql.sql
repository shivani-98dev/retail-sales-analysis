CREATE TABLE superstore (
    row_id INTEGER,
    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(30),
    customer_id VARCHAR(20),
    customer_name VARCHAR(50),
    segment VARCHAR(20),
    country VARCHAR(30),
    city VARCHAR(50),
    state VARCHAR(30),
    postal_code VARCHAR(10),
    region VARCHAR(20),
    product_id VARCHAR(20),
    category VARCHAR(30),
    sub_category VARCHAR(30),
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INTEGER,
    discount NUMERIC(4,2),
    profit NUMERIC(10,4)
);

DROP TABLE IF EXISTS superstore;


COPY superstore
FROM 'F:/Retail Sales/Sample - Superstore.csv'
DELIMITER ','
CSV HEADER
QUOTE '"'
ESCAPE '"'
ENCODING 'LATIN1';




SELECT COUNT(*) FROM superstore;

-- Total Sales by Category
SELECT category, 
       ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

-- Top 10 Customers by Revenue
SELECT customer_name, 
       ROUND(SUM(sales)::numeric, 2) AS total_revenue
FROM superstore
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly Revenue
SELECT order_date AS month,
       ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM superstore
GROUP BY order_date
ORDER BY month;


-- Sub-Category with Highest Discount

SELECT sub_category,
       ROUND(AVG(discount)::numeric, 2) AS avg_discount
FROM superstore
GROUP BY sub_category
ORDER BY avg_discount DESC;

-- Most Profitable Region
SELECT region,
       ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;]

-- Bonus! Sales and Profit by Category

SELECT category,
       ROUND(SUM(sales)::numeric, 2) AS total_sales,
       ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;
