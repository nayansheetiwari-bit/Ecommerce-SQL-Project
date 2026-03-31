-- Total Sales & Total Profit
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM orders;

-- Total Orders & Total Customers
SELECT 
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM orders;

-- Top 5 Customers (by Sales)
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- Best Selling Products
SELECT 
    p.product_name,
    SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

-- Sales by Category
SELECT 
    p.category,
    SUM(o.sales) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- Monthly Sales Trend
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Average Order value
SELECT 
    SUM(sales) / COUNT(order_id) AS avg_order_value
FROM orders;

-- Top Profitable Products
SELECT 
    p.product_name,
    SUM(o.profit) AS total_profit
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC;

-- Repeat Customers
SELECT 
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

-- Rank Customers (Window Function)
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.sales) DESC) AS customer_rank
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;

-- Running Total of Sales
SELECT 
    order_date,
    SUM(sales) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- Customer Segmentation (CASE WHEN)
SELECT 
    c.customer_name,
    SUM(o.sales) AS total_spent,
    CASE 
        WHEN SUM(o.sales) > 50000 THEN 'High Value'
        WHEN SUM(o.sales) BETWEEN 20000 AND 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name;