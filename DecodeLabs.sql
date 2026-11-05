-- Decode Labs Project 3

-- structured queries to filter, group, and aggregate raw data into actionable business intelligence
CREATE DATABASE DecodeLabs; 

USE decodelabs;

SELECT * 
FROM orders;

SELECT AVG(Quantity) 
FROM orders;

-- Analysis of Yearly Revenue of DecodeLabs
SELECT Year(Date), COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY Year(Date)
ORDER BY SUM(TotalPrice) DESC;

-- It is worth investigating what is responsible for the decline in sales from 2023 downward

-- Analysis of Purchases made by each Customer
SELECT CustomerID, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) TotalPurchases
FROM orders
GROUP BY CustomerID
ORDER BY SUM(TotalPrice) DESC;
-- CustomerID 'C38840' had the highest patronage with total count of 2 orders & total amount of 5723

-- Analysis of Sales by Product
SELECT Product, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY Product
ORDER BY SUM(TotalPrice) DESC;


SELECT Product, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0)
FROM orders
GROUP BY Product
ORDER BY SUM(TotalPrice) DESC;

-- Analysis of Revenue by Payment Method
SELECT PaymentMethod, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY PaymentMethod
ORDER BY SUM(TotalPrice) DESC;

-- Analysis of Yearly Revenue by Payment Method
SELECT YEAR(Date) AS OrderYear,
       PaymentMethod,
       ROUND(SUM(TotalPrice), 0) AS Revenue
FROM orders
GROUP BY YEAR(Date), PaymentMethod
ORDER BY OrderYear, Revenue DESC;


SELECT OrderStatus, COUNT(*) OrderCount
FROM orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;

-- Omly 231 out of 1200 ordered (i.e. 19% of total order was delivered) which is quite low and 
-- 497(250+247) out of 1200 which is 41% of total order weere either cancelled or returned

-- Analysis of Coupon Code by Order
SELECT CouponCode, COUNT(*) OrderCount
FROM orders
GROUP BY CouponCode
ORDER BY OrderCount DESC;



-- Analysis of Revenue Referral Source
SELECT ReferralSource, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY ReferralSource
ORDER BY SUM(TotalPrice) DESC;

-- Analysis of Revenue
SELECT ROUND(AVG(TotalPrice),0) Avg_Revenue, ROUND(MIN(TotalPrice),0) Min_Revenue, 
ROUND(MAX(TotalPrice),0) Max_Revenue, ROUND(SUM(TotalPrice),0) Total_Revenue
FROM orders;

-- To know customer that gave us Min & Max Revenue
-- Min Price
SELECT CustomerID, TotalPrice
FROM orders
ORDER BY TotalPrice ASC
LIMIT 1;

-- Max Price
SELECT CustomerID, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 1;

-- To know Customers whose sales is above average revenue
SELECT CustomerID, ROUND(SUM(TotalPrice), 0) AS TotalPrice
FROM orders
GROUP BY CustomerID
HAVING SUM(TotalPrice) > (
    SELECT AVG(CustomerTotal)
    FROM (
        SELECT SUM(TotalPrice) AS CustomerTotal
        FROM orders
        GROUP BY CustomerID
    ) t
)
ORDER BY TotalPrice DESC;



