CREATE TABLE IF NOT EXISTS sales_data (
    sales_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    sales_date DATE,
    quantity INT,
    price_per_unit DECIMAL(10, 2)
);

INSERT INTO sales_data (sales_id, product_name, category, sales_date, quantity, price_per_unit) VALUES
(1, 'Laptop', 'Electronics', '2025-01-01', 5, 1200.00),
(2, 'Smartphone', 'Electronics', '2025-01-02', 10, 800.00),
(3, 'Table', 'Furniture', '2025-01-03', 2, 150.00),
(4, 'Chair', 'Furniture', '2025-01-03', 4, 75.00),
(5, 'Refrigerator', 'Appliances', '2025-01-04', 1, 900.00),
(6, 'Microwave', 'Appliances', '2025-01-04', 3, 200.00),
(7, 'Laptop', 'Electronics', '2025-01-05', 2, 1200.00),
(8, 'Table', 'Furniture', '2025-01-06', 1, 150.00);

SELECT 
    category,
    SUM(quantity * price_per_unit) AS total_sales
FROM sales_data
GROUP BY category;

SELECT 
    category,
    SUM(quantity * price_per_unit) AS total_sales
FROM sales_data
GROUP BY category
HAVING SUM(quantity * price_per_unit) > 1000;

SELECT 
    category,
    SUM(quantity * price_per_unit) AS total_sales
FROM sales_data
GROUP BY category
HAVING SUM(quantity * price_per_unit) > 1000
ORDER BY total_sales DESC;

SELECT 
    product_name,
    category,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price_per_unit) AS total_sales
FROM sales_data
GROUP BY product_name, category;

SELECT 
    sales_date,
    SUM(quantity * price_per_unit) AS daily_sales
FROM sales_data
GROUP BY sales_date
ORDER BY sales_date ASC;
