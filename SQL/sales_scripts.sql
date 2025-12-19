CREATE TABLE sales(
	Order_ID	VARCHAR(10),
    `Year`	INT,
    `Month`	INT,
    `Day`	INT,
    Product	VARCHAR(20),
    Category	VARCHAR(20),
    Price	INT,
    Quantity	INT,
    Total_Sales	INT,
    Customer_Name	VARCHAR(20),
    Customer_Location	VARCHAR(20),
    Payment_Method	VARCHAR(20),
    `Status` VARCHAR(20)

);

SELECT * FROM sales;

-- 1)What is the total sales amount generated from all orders?

SELECT SUM(Total_Sales)
FROM sales;

-- 2)What is the total number of orders placed?

Select COUNT(Order_ID) AS total_orders_placed
FROM sales;

-- 3)What is the average order value?
SELECT AVG(Price)
FROM sales;

-- 4)Which category generates the highest total sales?
SELECT Category,SUM(Total_Sales)
FROM sales
GROUP BY Category
ORDER BY SUM(Total_Sales) DESC;

-- 5)Which product is the top seller by total revenue?
SELECT Product,SUM(Total_Sales)
FROM sales
GROUP BY Product
ORDER BY SUM(Total_Sales) DESC
LIMIT 1;

-- 6)What is the total quantity sold per category?
SELECT Category,COUNT(Quantity)
FROM sales
GROUP BY Category
ORDER BY COUNT(Quantity) DESC ;

-- 7)Which customers have placed the highest number of orders?
SELECT Customer_Name, COUNT(Order_ID)
FROM sales
GROUP BY Customer_Name
ORDER BY COUNT(Order_ID) DESC;

-- 8)Who are the top 5 customers by total purchase value?
SELECT Customer_Name,SUM(Total_Sales) AS purchase_value
FROM sales
GROUP BY Customer_Name
ORDER BY SUM(Total_Sales) DESC
LIMIT 5;

-- 9)How many orders fall under each order status?
SELECT `Status`,COUNT(Order_ID) AS orders
FROM sales
GROUP BY `Status`
ORDER BY orders DESC;

-- 10)Which payment method is used most frequently?
SELECT Payment_Method,COUNT(Payment_Method)
FROM sales
GROUP BY Payment_Method
ORDER BY COUNT(Payment_Method) DESC
LIMIT 1 ;