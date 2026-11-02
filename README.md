# DecodeLabs-Internship-SQL-Project
The project aims to use structured queries to filter, group, and aggregate raw data from Orders table of Decodelabs into actionable business intelligence.

Decode Labs Project 3 - SQL Business Intelligence Analysis
📊 Project Overview

This project demonstrates how SQL can be used to transform raw transactional data into actionable business intelligence. Using structured SQL queries, we analyzed customer orders, revenue performance, product sales, payment methods, customer behavior, order fulfillment, referral channels, and profitability metrics.

# 🎯 Project Objectives
The objective of this project was to uncover business insights that can support strategic decision-making, improve customer retention, optimize sales performance, and identify operational challenges impacting revenue growth.

# Key Business Questions
The analysis aims to answer the following key business questions:

How has revenue performed over the years?
Which customers generate the highest revenue?
What products drive the most sales?
Which payment methods contribute the highest revenue?
What factors may be responsible for declining sales?
What is the order fulfillment performance?
Which referral channels generate the highest business value?
Who are the highest-value customers?
Which customers spend above average?

# Dataset Description
The data sets contains 1200 records stored in the orders table with 1,200 rows and 14 columns / fields namely nameOrderID, Date, CustomerID, Product, Quantity, UnitPrice, ShippingAddress, PaymentMethod, OrderStatus, TrackingNumber, ItemsInCart, CouponCode, ReferralSource, Total Price

| A | B | C |
| D | E | F |

# Data Dictionary
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
-- CustomerID 'C38840' had the highest patronage with total count of 2 orders & total amount of 5723
