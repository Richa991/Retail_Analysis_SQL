USE retail_industry;

SELECT * FROM customer_profiles;
SELECT * FROM sales_transaction;
SELECT * FROM product_inventory;

SELECT CUSTOMERID, SUM(QuantityPurchased * Price) AS Total_Sales
FROM sales_transaction
where customerID = 1
GROUP BY customerID;

/* Q1 Write a query to identify the number of duplicates in "sales_transaction" table. Also, create a separate table containing the unique values 
and remove the the original table from the databases and replace the name of the new table with the original name. */
SELECT TransactionID,
COUNT(*)
FROM sales_transaction
group by TransactionID
HAVING COUNT(*) > 1;
CREATE TABLE Unique_Sales_transaction AS
SELECT * FROM sales_transaction;
ALTER table unique_sales_transaction
RENAME  TO sales_transaction;
SELECT count(*)
FROM sales_transaction;

/* Q2 Write a query to identify the discrepancies in the price of the same product in "sales_transaction" and "product_inventory" tables.
Also, update those discrepancies to match the price in both the tables. */

SELECT S.TransactionID, 
S.Price AS TransactionPrice,
P.Price AS InventoryPrice 
FROM sales_transaction S
JOIN product_inventory P ON P.ProductID = S.ProductID
WHERE S.Price != P.Price;
UPDATE sales_transaction
SET Price = 93.12
WHERE Price = 9312;
SET SQL_SAFE_UPDATES = 0;

/*Q3 Write a SQL query to identify the null values in the dataset and replace those by “Unknown”. */

select count(*)
from customer_profiles
WHERE CustomerID IS NULL 
OR Age IS NULL
OR gender IS NULL
OR Location IS NULL
OR JOINDATE IS NULL;

UPDATE customer_profiles
SET customerid = COALESCE(customerid, 'Unknown'),
	Age = IFNULL(Age, 'Unknown'),
    Gender = IFNULL(Gender, 'Unknown'),
    Location = IFNULL(Location, 'Unknown'),
    JoinDate = IFNULL(Joindate, 'Unknown');
    
/* Q4.   Write a SQL query to clean the DATE column in the dataset. */ 

Create TABLE sales_transaction_new AS
SELECT *,
CAST(TransactionDate AS DATE) AS TransactionDate_updated
FROM sales_transaction;

DROP TABLE sales_transaction;
ALTER TABLE sales_transaction_new
RENAME TO sales_transaction;
SELECT * FROM sales_transaction;

/* Q5. Write a SQL query to summarize the total sales and quantities sold per product by the company.
(Here, the data has been already cleaned in the previous steps and from here we will be understanding the different types of data analysis from the given dataset.) */

Select ProductID,
SUM(QuantityPurchased) AS TotalUnitsSold,
SUM(QuantityPurchased * Price) AS TotalSales
FROM sales_transaction
GROUP BY ProductID
ORDER BY SUM(QuantityPurchased * Price) DESC;

/* Q6. Write a SQL query to count the number of transactions per customer to understand purchase frequency. */

SELECT CustomerID,
COUNT(*) AS NumberOfTransactions
FROM sales_transaction
GROUP BY CustomerID
ORDER BY COUNT(*) DESC;

/*Q7. Write a SQL query to evaluate the performance of the product categories based on the total sales
 which help us understand the product categories which needs to be promoted in the marketing campaigns. */
 
 SELECT P.Category,
SUM(S.QuantityPurchased) AS TotalUnitsSold,
SUM(S.QuantityPurchased * S.Price) AS TotalSales
FROM Sales_transaction S
JOIN product_inventory P ON P.ProductID = S.ProductID
GROUP BY P.Category
ORDER BY SUM(S.QuantityPurchased * S.Price) DESC;

/* Q8. Write a SQL query to find the top 10 products with the highest total sales revenue from the sales transactions.
 This will help the company to identify the High sales products which needs to be focused to increase the revenue of the company. */

SELECT ProductID,
SUM(QuantityPurchased * Price) AS TotalRevenue
FROM Sales_transaction
GROUP BY ProductID
ORDER BY SUM(QuantityPurchased * Price) DESC
LIMIT 10;

/* Q9. Write a SQL query to find the ten products with the least amount of units sold from the sales transactions,
 provided that at least one unit was sold for those products. */

Select ProductID,
SUM(QuantityPurchased) AS TotalUnitsSold
FROM sales_transaction
GROUP BY ProductID
having TotalUnitsSold >=1
order by SUM(QuantityPurchased)
limit 10;

/* 10. Write a SQL query to identify the sales trend to understand the revenue pattern of the company. */

SELECT TransactionDate_updated AS DATETRANS,
count(*) as Transaction_count,
SUM(QuantityPurchased) AS TotalUnitsSold,
SUM(QuantityPurchased * Price) AS TotalSales
FROM sales_transaction
GROUP BY TransactionDate_updated 
ORDER BY TransactionDate_updated DESC;

/* 11. Write a SQL query to understand the month on month growth rate of sales of the company which will help understand the growth trend of the company. */

WITH  temp AS (
SELECT Month(TransactionDate) AS month,
ROUND(SUM(QuantityPurchased * Price), 2) AS total_sales
FROM sales_transaction
GROUP BY Month(TransactionDate)
)
	SELECT month,
	total_sales,
	ROUND(LAG(total_sales) OVER(ORDER BY month), 2) AS previous_month_sales,
	ROUND((total_sales - LAG(total_sales) OVER(ORDER BY month))/LAG(total_sales) OVER(ORDER BY month) * 100, 2) AS mom_growth_percentage 
	FROM temp
	GROUP BY month;

/* 12. Write a SQL query that describes the number of transaction along with the total amount spent by each customer which are on the higher side
 and will help us understand the customers who are the high frequency purchase customers in the company. */
 
 
SELECT CustomerID,
COUNT(*) AS NumberOfTransactions,
SUM(COALESCE(QuantityPurchased, 0) * COALESCE(Price, 0)) AS TotalSpent
FROM sales_transaction
GROUP BY CustomerID
HAVING NumberOfTransactions > 10 AND
TotalSpent > 1000
ORDER BY TotalSpent DESC;

/* 13. Write a SQL query that describes the number of transaction along with the total amount spent by each customer,
 which will help us understand the customers who are occasional customers or have low purchase frequency in the company. */
 
 SELECT CustomerID,
COUNT(*) AS NumberOfTransactions,
SUM(COALESCE(QuantityPurchased, 0) * COALESCE(Price, 0))AS TotalSpent
FROM sales_transaction
GROUP BY CustomerID
HAVING NumberOfTransactions <= 2 
ORDER BY NumberOfTransactions, TotalSpent DESC ;


/* 14. Write a SQL query that describes the total number of purchases made by each customer against each productID to understand the repeat customers in the company. */ 

SELECT CustomerID, ProductID,
COUNT(QuantityPurchased) AS TimesPurchased
FROM sales_transaction
GROUP BY CustomerID, ProductID
HAVING COUNT(QuantityPurchased) > 1
ORDER BY COUNT(QuantityPurchased) DESC;

/* 15. Write a SQL query that describes the duration between the first and the last purchase of the customer in that particular company
 to understand the loyalty of the customer. */ 
 
 SELECT CustomerID, 
MIN(TransactionDate_updated) AS FirstPurchase,
MAX(TransactionDate_updated) AS LastPurchase,
DATEDIFF(MAX(TransactionDate_updated), MIN(TransactionDate_updated)) AS DaysBetweenPurchases
FROM sales_transaction
GROUP BY CustomerID
HAVING DaysBetweenPurchases > 0
ORDER BY DATEDIFF(MAX(TransactionDate_updated), MIN(TransactionDate_updated)) DESC;

/* 16. Write an SQL query that segments customers based on the total quantity of products they have purchased.
 Also, count the number of customers in each segment which will help us target a particular segment for marketing. */ 
 
 CREATE TABLE customer_segment AS SELECT C.CustomerID, 
    CASE
    WHEN SUM(S.QuantityPurchased) BETWEEN 1 AND 10 THEN 'Low'
    WHEN SUM(S.QuantityPurchased) BETWEEN 11 AND 30 THEN 'Med'
    ELSE 'High'
    END AS CustomerSegment
    FROM sales_transaction S
    JOIN customer_profiles C ON C.CustomerID = S.CustomerID
    GROUP BY C.CustomerID;

    SELECT CustomerSegment, 
    COUNT(*)
FROM customer_segment
GROUP BY CustomerSegment;
 








    

