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


/table

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

<img width="976" height="100" alt="image" src="https://github.com/user-attachments/assets/524cae1e-f798-4a67-a460-7541d4f0e344" />


<img width="1070" height="303" alt="image" src="https://github.com/user-attachments/assets/39c0439e-9bb5-4bd8-8249-28ca543bb60c" />


## 📈 Key Business Analyses

## 1. Average Quantity Ordered
Understanding average purchasing volume per order
```
SELECT ROUND(AVG(Quantity),0) Average_Quantity 
FROM orders;
```
<img width="371" height="81" alt="image" src="https://github.com/user-attachments/assets/9b672a21-eb8d-41ac-b95b-c60981c9ec97" />


### Business Insight
Provides a baseline understanding of customer purchasing behavior and inventory demand.

## Analysis of Yearly Revenue of DecodeLabs
```
SELECT Year(Date), COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY Year(Date)
ORDER BY SUM(TotalPrice) DESC;
```

<img width="404" height="119" alt="image" src="https://github.com/user-attachments/assets/6c6c7907-6c25-4f8d-9caa-1b1674e36de1" />

It is worth investigating what is responsible for the decline in sales from 2023 downward
### Business Insight
The analysis revealed a downward revenue trend beginning from 2023. This indicates the need for deeper investigation into:
- Customer retention
- Product demand
- Market competition
- Marketing effectiveness
- Customer satisfaction
- Order cancellations and returns


## Analysis of Purchases made by each Customer
```
SELECT CustomerID, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) TotalPurchases
FROM orders
GROUP BY CustomerID
ORDER BY SUM(TotalPrice) DESC;
```
<img width="542" height="320" alt="image" src="https://github.com/user-attachments/assets/f92f7458-71c8-4aca-8580-7cad4020ab88" />

### Key Finding
CustomerID 'C38840' had the highest patronage with total count of 2 orders & total amount of 5723
### Business Value
Provides opportunities for:
- Loyalty Programs
- VIP Customer Segmentation
- Personalized Marketing Campaigns

## Analysis of Revenue by Product (Product Performance Analysis)
```
SELECT Product, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY Product
ORDER BY SUM(TotalPrice) DESC;
```
<img width="397" height="179" alt="image" src="https://github.com/user-attachments/assets/5bc224c5-db3e-4e64-bed5-3d81e279c1cd" />


## Revenue Contribution by Product
```
SELECT Product,
       ROUND(SUM(TotalPrice),0) Revenue,
       ROUND(
       SUM(TotalPrice) * 100 /
       (SELECT SUM(TotalPrice) FROM orders),2
       ) AS RevenueContributionPct
FROM orders
GROUP BY Product
ORDER BY Revenue DESC;
```
<img width="361" height="170" alt="image" src="https://github.com/user-attachments/assets/f51cdfd9-7833-44dc-b754-09e8bf08bce3" />

### Business Insight
The analysis identifies:
- Best-Selling Products
- Underperforming Products
- Revenue Contribution by Product Category
It also supports inventory planning and product portfolio optimization.

## Analysis of Revenue by Payment Method
```
SELECT PaymentMethod, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY PaymentMethod
ORDER BY SUM(TotalPrice) DESC;
```
<img width="365" height="143" alt="image" src="https://github.com/user-attachments/assets/33f2a716-ecce-4872-8aeb-83d3ea1f9c85" />

### Business Insight
This helps determine:
- Most trusted payment channels
- Customer payment preferences
- Potential payment system optimization

## Analysis of Yearly Revenue by Payment Method
'''
SELECT YEAR(Date) AS OrderYear,
       PaymentMethod,
       ROUND(SUM(TotalPrice), 0) AS Revenue
FROM orders
GROUP BY YEAR(Date), PaymentMethod
ORDER BY OrderYear, Revenue DESC;
'''
<img width="365" height="143" alt="image" src="https://github.com/user-attachments/assets/8f92b4ab-2bf0-4ccb-8fe0-f8898a06ff2b" />

Only 231 out of 1200 ordered (i.e. 19% of total order was delivered) which is quite low and 
497(250+247) out of 1200 orders which is about 41% of total order were either cancelled or returned

### Business Value
The analysis enables management to:
- Track shifts in customer payment behavior
- Identify emerging payment trends
- Support fintech partnership decisions
- Evaluate operational performance and customer experience.

## Order Status Analysis
To evaluate operational performance and customer experience.
```
SELECT OrderStatus,
       COUNT(*) AS OrderCount
FROM orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;
```
### Business Concern
This performance level suggests potential issues relating to:
- Supply Chain Operations
- Inventory Availability
- Product Quality
- Delivery Service Performance
- Customer Satisfaction

Immediate root cause analysis is recommended.


## Analysis of Coupon Code by Order
Assess promotional campaign effectiveness.
```
SELECT CouponCode, COUNT(*) OrderCount
FROM orders
GROUP BY CouponCode
ORDER BY OrderCount DESC;
```
### Business Insight
Measures:
- Promo Code Adoption
- Campaign Engagement
- Discount Strategy Performance
- 
## Analysis of Revenue Referral Source
Evaluate marketing channel effectiveness.
```
SELECT ReferralSource, COUNT(Quantity) Count, ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY ReferralSource
ORDER BY SUM(TotalPrice) DESC;
```
#### Business Value
Identifies:
- Highest-performing acquisition channels
- Best Return on Marketing Investment
- Customer Acquisition Effectiveness

## Analysis of Revenue
Understand overall business performance.
```
SELECT ROUND(AVG(TotalPrice),0) AS Avg_Revenue,
       ROUND(MIN(TotalPrice),0) AS Min_Revenue,
       ROUND(MAX(TotalPrice),0) AS Max_Revenue,
       ROUND(SUM(TotalPrice),0) AS Total_Revenue
FROM orders;
```
#### Business Insight
Provides a high-level performance snapshot including:
- Average Order Value
- Minimum Revenue Transaction
- Maximum Revenue Transaction
- Total Revenue Generated

## Analysis of Customer with Minimum and Maximum Revenue
### Minimum Revenue
```
SELECT CustomerID, TotalPrice
FROM orders
ORDER BY TotalPrice ASC
LIMIT 1;
```
Purpose
- Identifies the lowest-value transaction and customer.
### Maximum Revenue
```
SELECT CustomerID, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 1;
```
Purpose
Identifies the highest-value transaction and customer..

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
#### Business Value
This analysis Supports:
- Customer Segmentation
- Premium Customer Identification
- Loyalty Reward Programs
- Revenue Growth Strategies

## Monthly Revenue Trend
```
SELECT DATE_FORMAT(Date,'%Y-%m') AS Month,
       ROUND(SUM(TotalPrice),0) AS Revenue
FROM orders
GROUP BY DATE_FORMAT(Date,'%Y-%m')
ORDER BY Month;
```
The above analysis Identifies seasonality and monthly growth trends.

## Top 10 Customers by Revenue
```
SELECT CustomerID,
       ROUND(SUM(TotalPrice),0) Revenue
FROM orders
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;
```

## Average Order Value (AOV)
SELECT ROUND(SUM(TotalPrice)/COUNT(OrderID),2) AS AvgOrderValue
FROM orders;

## Cancellation Rate
```
SELECT
ROUND(
COUNT(CASE WHEN OrderStatus = 'Cancelled' THEN 1 END)
*100.0/COUNT(*),2
) AS CancellationRate
FROM orders;
```

## Return Rate
```
SELECT
ROUND(
COUNT(CASE WHEN OrderStatus = 'Returned' THEN 1 END)
*100.0/COUNT(*),2
) AS ReturnRate
FROM orders;
```

## Customer Segmentation
```
SELECT CustomerID,
       SUM(TotalPrice) Revenue,
       CASE
            WHEN SUM(TotalPrice) >= 5000 THEN 'VIP'
            WHEN SUM(TotalPrice) >= 2000 THEN 'Gold'
            WHEN SUM(TotalPrice) >= 1000 THEN 'Silver'
            ELSE 'Standard'
       END AS CustomerSegment
FROM orders
GROUP BY CustomerID;
```

## Revenue by Customer Class
```
SELECT CustomerSegment,
       COUNT(CustomerID) AS CustomerCount,
       ROUND(SUM(TotalRevenue), 0) AS TotalRevenue
FROM (
       SELECT CustomerID,
              SUM(TotalPrice) AS TotalRevenue,
              CASE
                   WHEN SUM(TotalPrice) >= 5000 THEN 'VIP'
                   WHEN SUM(TotalPrice) >= 2000 THEN 'Gold'
                   WHEN SUM(TotalPrice) >= 1000 THEN 'Silver'
                   ELSE 'Standard'
              END AS CustomerSegment
       FROM orders
       GROUP BY CustomerID
     ) CustomerSegments
GROUP BY CustomerSegment
ORDER BY TotalRevenue DESC;
```

## Product Ranking Using Window Functions
```
SELECT Product,
       Revenue,
       RANK() OVER(ORDER BY Revenue DESC) ProductRank
FROM
(
    SELECT Product,
           ROUND(SUM(TotalPrice),2) Revenue
    FROM orders
    GROUP BY Product
) a;
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
