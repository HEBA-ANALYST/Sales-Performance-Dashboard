select * from sales_data;
use my_protfolio_data;

USE my_protfolio_data;

TRUNCATE TABLE sales_data;

LOAD DATA LOCAL INFILE 'C:/Users/ASUS 1/OneDrive/Desktop/Data Analytics Bootcamp/Excel/CLEAN_A_DATA.CSV'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'   
IGNORE 1 LINES
(order_ID, @raw_date, customer_name, customer_segment, country, region, product_category, 
 product_name, quantity, unit_price, discount_percentage, total_sales, shipping_cost, 
 profit, payment_method, total_revenue, profit_margin)
SET order_date = STR_TO_DATE(@raw_date, '%m/%d/%Y');

SELECT * FROM sales_data LIMIT 10;
show variables like 'secure_file_priv';
USE my_protfolio_data;

LOAD DATA LOCAL INFILE 'C:/Users/ASUS 1/OneDrive/Desktop/Data Analytics Bootcamp/Excel/CLEAN_A_DATA.CSV'  
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(order_ID, order_date, customer_name, customer_segment, country, region, product_category, 
 product_name, quantity, unit_price, discount_percentage, total_sales, shipping_cost, 
 profit, payment_method, total_revenue, profit_margin);
 
USE my_protfolio_data;
UPDATE my_protfolio_data.sales_data SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');
select * from sales_data;

-- Total Sales
SELECT SUM(Total_Sales) FROM sales_data;

-- Sales by Category
SELECT Product_Category, SUM(Total_Sales)
FROM sales_data
GROUP BY Product_Category;

-- Total Profit
SELECT SUM(Profit) FROM sales_data;

-- Top 5 Customers
SELECT Customer_Name, SUM(Total_Sales) AS Sales
FROM sales_data
GROUP BY Customer_Name
ORDER BY Sales DESC
LIMIT 5;

-- Sales by Region
SELECT Region, SUM(Total_Sales)
FROM sales_data
GROUP BY Region;










