/*
===============================================================================
Customer Report
===============================================================================
Purpose:
    - This report consolidates key customer metrics and behaviors

Highlights:
    1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
    3. Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
    4. Calculates valuable KPIs:
	    - recency (months since last order)
		- average order value
		- average monthly spend
===============================================================================
*/

-- =============================================================================
-- Create Report: gold.report_customers
-- =============================================================================

IF OBJECT_ID('gold.report_customers', 'V') IS NOT NULL
    DROP VIEW gold.report_customers;
GO

CREATE VIEW gold.report_customers AS
/* 1) Base Query : Retrieve core columns from tables  */
WITH base_query AS(
SELECT
f.order_number,
f.product_key,
f.order_date,
f.sales_amount,
f.quantity,
d.customer_key, 
d.customer_number,
CONCAT(d.first_name, ' ', d.last_name) AS customer_name,
DATEDIFF(YEAR, d.birthdate, GETDATE()) AS customer_age
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers d
ON f.customer_key = d.customer_key
WHERE order_date IS NOT NULL)


--Tip : Make a different CTE for aggregations
,customer_aggregation AS (SELECT
	customer_key,
	customer_number,
	customer_name,
	customer_age,
	COUNT(DISTINCT order_number) AS total_orders,
	SUM(sales_amount) AS total_sales,
	SUM(quantity) AS total_quantity,
	COUNT(DISTINCT product_key) AS total_products,
	MAX(order_date) AS last_order_date,
	DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan
FROM base_query
GROUP BY customer_key, customer_number, customer_name, customer_age)

SELECT
customer_key,
customer_number,
customer_name,
customer_age,
CASE 
    WHEN customer_age < 20 THEN 'Under 20'
	WHEN customer_age BETWEEN 20 AND 29 THEN '20-29'
	WHEN customer_age BETWEEN 30 AND 39 THEN '30-39'
	WHEN customer_age BETWEEN 40 AND 49 THEN '40-49'
	ELSE '50 and Above'
END AS age_group,
CASE
   WHEN lifespan >= 12 AND total_sales>5000 THEN 'VIP'
   WHEN lifespan >= 12 AND total_sales<=5000 THEN 'VIP'
   ELSE 'New'
END AS customer_segment,
total_orders,
total_sales,
total_quantity,
total_products,
last_order_date,
DATEDIFF(MONTH, last_order_date, GETDATE()) AS recency,
lifespan,
--Compute average order value
CASE
   WHEN total_sales=0 THEN 0
   ELSE total_sales/total_orders
END AS average_order_value,

--Average total spend
CASE
   WHEN lifespan = 0 THEN total_sales
   ELSE total_sales / lifespan
END AS average_monthly_spend
FROM customer_aggregation
