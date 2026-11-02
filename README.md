# DecodeLabs-Internship-SQL-Project
The project aims to use structured queries to filter, group, and aggregate raw data from Orders table of Decodelabs into actionable business intelligence.

Decode Labs Project 3 - SQL Business Intelligence Analysis

# 📊 Project Overview

This project demonstrates how SQL can be used to transform raw transactional data into actionable business intelligence. Using structured SQL queries, we analyzed customer orders, revenue performance, product sales, payment methods, customer behavior, order fulfillment, referral channels, and profitability metrics.

# 🎯 Project Objectives
The objective of this project was to;
- uncover business insights that can support strategic decision-making
- improve customer retention
- optimize sales performance and
- identify operational challenges impacting revenue growth.

# Key Business Questions
The analysis aims to answer the following key business questions:
- How has revenue performed over the years?
- Which customers generate the highest revenue?
- What products drive the most sales?
- Which payment methods contribute the highest revenue?
- What factors may be responsible for declining sales?
- What is the order fulfillment performance?
- Which referral channels generate the highest business value?
- Who are the highest-value customers?
- Which customers spend above average?

# Dataset Description
The data sets contains 1200 records stored in the orders table with 1,200 rows and 14 columns / fields namely nameOrderID, Date, CustomerID, Product, Quantity, UnitPrice, ShippingAddress, PaymentMethod, OrderStatus, TrackingNumber, ItemsInCart, CouponCode, ReferralSource, Total Price



# Data Dictionary
/table
|Field Name     | Data Type  | Field Description                                                                     |
|...............|............|.......................................................................................|
|Field Name     | Data Type  |                                                                                       |
|OrderID        | TEXT       |                                                                                       |
|Date           | TEXT       |                                                                                       |
|CustomerID     | TEXT       |                                                                                       |
|Product        | TEXT       |                                                                                       |
|Quantity       | INT        |                                                                                       |
|UnitPrice      | DOUBLE     |                                                                                       |
|ShippingAddress| TEXT       |                                                                                       |
|PaymentMethod  | TEXT       |                                                                                       |
|OrderStatus    | TEXT       |                                                                                       |
|TrackingNumber | TEXT       |                                                                                       |
|ItemsInCart    | INT        |                                                                                       |
|CouponCode     | TEXT       |                                                                                       |
|ReferralSource | TEXT       |                                                                                       |
|TotalPrice     |TEXT        |                                                                                       |

# 🛠 Technologies Used
Excel Orders table converted to CSV
CSV Imported to MySQL(Data Extraction)
SQL (MySQL)
Data Aggregation Functions
Grouping and Filtering Techniques
Business Intelligence Analytics
Data-Driven Decision Making


## Database Creation & Set up
```
CREATE DATABASE DecodeLabs;

USE decodelabs;

SELECT *
FROM orders;
```

## 📈 Key Business Analyses

## Analysis of Yearly Revenue of DecodeLabs
```
SELECT Year(Date), COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY Year(Date)
ORDER BY SUM(TotalPrice) DESC;
```
It is worth investigating what is responsible for the decline in sales from 2023 downward


## Analysis of Purchases made by each Customer
```
SELECT CustomerID, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) TotalPurchases
FROM orders
GROUP BY CustomerID
ORDER BY SUM(TotalPrice) DESC;
```
CustomerID 'C38840' had the highest patronage with total count of 2 orders & total amount of 5723

## Analysis of Sales by Product
```
SELECT Product, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY Product
ORDER BY SUM(TotalPrice) DESC;
```

## Analysis of Revenue by Payment Method
```
SELECT PaymentMethod, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY PaymentMethod
ORDER BY SUM(TotalPrice) DESC;
```

## Analysis of Yearly Revenue by Payment Method
'''
SELECT YEAR(Date) AS OrderYear,
       PaymentMethod,
       ROUND(SUM(TotalPrice), 0) AS Revenue
FROM orders
GROUP BY YEAR(Date), PaymentMethod
ORDER BY OrderYear, Revenue DESC;
'''

Only 231 out of 1200 ordered (i.e. 19% of total order was delivered) which is quite low and 
497(250+247) out of 1200 orders which is about 41% of total order were either cancelled or returned

## Analysis of Coupon Code by Order
```
SELECT CouponCode, COUNT(*) OrderCount
FROM orders
GROUP BY CouponCode
ORDER BY OrderCount DESC;
```

## Analysis of Revenue Referral Source
```
SELECT ReferralSource, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY ReferralSource
ORDER BY SUM(TotalPrice) DESC;
```

## Analysis of Revenue
```
SELECT ROUND(AVG(TotalPrice),0) Avg_Revenue, ROUND(MIN(TotalPrice),0) Min_Revenue, 
ROUND(MAX(TotalPrice),0) Max_Revenue, ROUND(SUM(TotalPrice),0) Total_Revenue
FROM orders;
```

## Analysis of Customer with Minimum and Maximum Revenue
### Minimum Revenue
```
SELECT CustomerID, TotalPrice
FROM orders
ORDER BY TotalPrice ASC
LIMIT 1;
```

### Maximum Revenue
```
SELECT CustomerID, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 1;
```

## Analysis of Customers whose sales is above Average Revenue
```
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
```

# Strategic Recommendations

## Based on the findings:
- Investigate the decline in revenue beginning from 2023.
- Reduce cancellation and return rates through operational improvements.
- Build retention strategies for high-value customers.
- Allocate marketing budget toward the highest-performing referral channels.
- Optimize inventory around best-selling products.
- Introduce loyalty and rewards programs.
- Analyze product categories with poor performance.
- Improve delivery success rate and customer satisfaction metrics.


# Conclusion

This project demonstrates how SQL can be leveraged beyond simple querying to generate actionable business intelligence. By applying aggregation, filtering, grouping, 
ranking, and analytical techniques, raw transaction records were transformed into meaningful business insights that support strategic decision-making, operational optimization, 
customer retention, and revenue growth.

Key Skills Demonstrated:

- SQL Querying
- Data Aggregation
- Business Intelligence Analytics
- Revenue Analysis
- Customer Segmentation
- Trend Analysis
- KPI Reporting
- Data-Driven Decision Making
- Window Functions
- Advanced SQL Analytics

### ⭐ If you found this project useful, consider giving it a star and connecting with me to discuss SQL, Data Analytics, Business Intelligence, and Data-Driven Decision Making.
