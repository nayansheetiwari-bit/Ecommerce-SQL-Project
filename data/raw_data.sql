CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'Mumbai', 'Maharashtra', '2024-01-10'),
(2, 'Priya Verma', 'Delhi', 'Delhi', '2024-01-15'),
(3, 'Rahul Mehta', 'Bangalore', 'Karnataka', '2024-02-01'),
(4, 'Sneha Kapoor', 'Pune', 'Maharashtra', '2024-02-10'),
(5, 'Vikram Singh', 'Jaipur', 'Rajasthan', '2024-02-20'),
(6, 'Ananya Roy', 'Kolkata', 'West Bengal', '2024-03-05'),
(7, 'Karan Patel', 'Ahmedabad', 'Gujarat', '2024-03-15'),
(8, 'Neha Joshi', 'Chandigarh', 'Punjab', '2024-03-20'),
(9, 'Rohan Das', 'Hyderabad', 'Telangana', '2024-04-01'),
(10, 'Isha Nair', 'Chennai', 'Tamil Nadu', '2024-04-10');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Smartphone', 'Electronics', 25000),
(103, 'Headphones', 'Accessories', 2000),
(104, 'Office Chair', 'Furniture', 7000),
(105, 'Desk Lamp', 'Furniture', 1500),
(106, 'Backpack', 'Accessories', 1200),
(107, 'Smartwatch', 'Electronics', 5000),
(108, 'Notebook Set', 'Stationery', 500),
(109, 'Water Bottle', 'Lifestyle', 800),
(110, 'Tablet', 'Electronics', 18000);

INSERT INTO orders VALUES
(1001, 1, 101, '2024-04-15', 1, 55000, 8000),
(1002, 2, 102, '2024-04-16', 1, 25000, 5000),
(1003, 3, 103, '2024-04-17', 2, 4000, 1000),
(1004, 4, 104, '2024-04-18', 1, 7000, 1500),
(1005, 5, 105, '2024-04-19', 3, 4500, 1200),
(1006, 6, 106, '2024-04-20', 2, 2400, 600),
(1007, 7, 107, '2024-04-21', 1, 5000, 1200),
(1008, 8, 108, '2024-04-22', 5, 2500, 700),
(1009, 9, 109, '2024-04-23', 4, 3200, 900),
(1010, 10, 110, '2024-04-24', 1, 18000, 3500),
(1011, 1, 103, '2024-04-25', 1, 2000, 500),
(1012, 2, 107, '2024-04-26', 2, 10000, 2500),
(1013, 3, 110, '2024-04-27', 1, 18000, 3000),
(1014, 4, 101, '2024-04-28', 1, 55000, 9000),
(1015, 5, 102, '2024-04-29', 1, 25000, 4500);