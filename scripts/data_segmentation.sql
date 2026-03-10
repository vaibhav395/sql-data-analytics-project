/*
===============================================================================
Data Segmentation Analysis
===============================================================================
Purpose:
    - To group data into meaningful categories for targeted insights.
    - For customer segmentation, product categorization, or regional analysis.

SQL Functions Used:
    - CASE: Defines custom segmentation logic.
    - GROUP BY: Groups data into segments.
===============================================================================
*/

/*Segment products into cost ranges and 
count how many products fall into each segment*/
WITH CTE AS(
SELECT
product_key,
product_name,
cost,
CASE
   WHEN cost<100 THEN 'Below 100'
   WHEN cost BETWEEN 100 AND 500 THEN '100-500'
   WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
   ELSE 'Above 1000'
END AS cost_range
FROM gold.dim_products)

SELECT
cost_range,
COUNT(product_key) AS total_products
FROM CTE
GROUP BY cost_range


/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/

WITH CTE AS(
SELECT
d.customer_key,
SUM(f.sales_amount) AS total_spend,
MIN(f.order_date) AS first_order_date,
MAX(f.order_date) AS last_order_date
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers d
ON f.customer_key = d.customer_key
GROUP BY d.customer_key),

CTE1 AS(
SELECT
customer_key,
first_order_date,
last_order_date,
total_spend,
CASE 
    WHEN DATEDIFF(MONTH, first_order_date, last_order_date) >= 12 AND total_spend>5000 THEN 'VIP'
	WHEN DATEDIFF(MONTH, first_order_date, last_order_date) >= 12 AND total_spend<=5000 THEN 'Regular'
	ELSE 'New'
END AS spending_behaviour
FROM CTE)

SELECT
spending_behaviour,
COUNT(customer_key) AS total_customers
FROM CTE1
GROUP BY spending_behaviour
ORDER BY COUNT(customer_key) DESC


