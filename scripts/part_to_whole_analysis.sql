/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/

--Which categories contribute the most to overall sales
WITH CTE AS(
SELECT
d.category,
SUM(f.sales_amount) AS total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products d
ON f.product_key = d.product_key
GROUP BY d.category)

SELECT
category,
total_sales,
SUM(total_sales) OVER() as overall_sales,
CONCAT(ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER()) * 100, 2), '%') AS percentage_sales
FROM CTE
ORDER BY percentage_sales DESC
