# 📊 SQL Data Analytics Project

## 📌 Overview

This project demonstrates a comprehensive **data analytics workflow using SQL** to analyze business data and generate actionable insights. The goal of this project is to explore sales data, identify trends, analyze customer behavior, evaluate product performance, and generate meaningful reports that support **data-driven decision making**.

The project applies several analytical techniques commonly used in real-world **data analytics and business intelligence environments**, such as **time-series analysis, customer segmentation, performance benchmarking, and product-level reporting**.

---

## 🎯 Project Objectives

* 📈 Track **business performance over time**
* 👥 Analyze **customer purchasing behavior**
* 🛍️ Evaluate **product performance**
* ⭐ Identify **high-value customers and products**
* 🧩 Perform **data segmentation for targeted insights**
* 📊 Generate **aggregated business KPIs**

---

## 🔍 Analysis Performed

### ⏳ 1. Change Over Time Analysis

📄 File: `change_over_time_analysis.sql`

This analysis tracks how key business metrics change over time to identify **growth patterns, trends, and seasonality**.

**Metrics analyzed:**

* Total sales
* Order counts
* Average sales values across time periods

**SQL techniques used:**

* `DATEPART()`
* `DATETRUNC()`
* Aggregate functions (`SUM`, `COUNT`, `AVG`)

This helps identify **monthly or yearly trends in business performance**.

---

### 📈 2. Cumulative Analysis

📄 File: `cumulative_analysis.sql`

This analysis calculates **running totals** to evaluate long-term business growth.

**Metrics analyzed:**

* Running total of sales
* Running total of orders
* Cumulative revenue growth

**SQL techniques used:**

* Window functions
* `SUM() OVER()`

This helps visualize **how the business grows over time**.

---

### 👥 3. Customer Report

📄 File: `customer_report.sql`

This report consolidates key **customer-level metrics** to better understand customer behavior and value.

**Customer attributes analyzed:**

* Customer name
* Age
* Transaction details

**Metrics calculated:**

* Total orders
* Total sales
* Total quantity purchased
* Total products purchased
* Customer lifespan (months)
* Recency (months since last purchase)
* Average order value
* Average monthly spend

Customers are segmented into:

* ⭐ **VIP Customers**
* 👤 **Regular Customers**
* 🆕 **New Customers**

This analysis helps understand **customer engagement and lifetime value**.

---

### 🧩 4. Data Segmentation Analysis

📄 File: `data_segmentation.sql`

This analysis groups data into meaningful categories for deeper insights.

**Techniques used:**

* `CASE` statements for defining segments
* `GROUP BY` for grouping records

Segmentation helps businesses:

* Identify **high-value customer groups**
* Analyze **product performance categories**
* Generate **targeted insights for decision making**

---

### 🥧 5. Part-to-Whole Analysis

📄 File: `part_to_whole_analysis.sql`

This analysis evaluates how individual components contribute to the overall business performance.

**Metrics analyzed:**

* Category-level sales
* Percentage contribution to total revenue

**SQL techniques used:**

* `SUM()`
* `AVG()`
* Window functions (`SUM() OVER()`)

This helps identify **which categories or segments drive the majority of revenue**.

---

### 📊 6. Performance Analysis

📄 File: `performance_analysis.sql`

This analysis measures business performance across time periods.

Key comparisons include:

* 📅 **Year-over-Year performance**
* 📆 **Month-over-Month growth**
* 🏆 **Product performance vs historical average**

**SQL techniques used:**

* `LAG()` for previous period comparison
* `AVG() OVER()` for benchmark calculations
* `CASE` statements for performance classification

This helps identify **growth trends and high-performing entities**.

---

### 🛍️ 7. Product Report

📄 File: `product_report.sql`

This report generates detailed **product-level insights**.

**Metrics calculated:**

* Total orders
* Total sales
* Total quantity sold
* Total unique customers
* Product lifespan (months)
* Recency (months since last sale)
* Average order revenue (AOR)
* Average monthly revenue

Products are categorized into:

* 🚀 **High Performers**
* ⚖️ **Mid-Range Products**
* 📉 **Low Performers**

This analysis helps understand **which products drive business success**.

---

## 🛠️ SQL Techniques Used

This project demonstrates several SQL concepts used in **data analytics and data engineering**:

* Aggregate Functions (`SUM`, `COUNT`, `AVG`)
* Window Functions (`LAG`, `SUM() OVER`, `AVG() OVER`)
* Date Functions (`DATEPART`, `DATETRUNC`, `FORMAT`)
* `CASE` statements for segmentation
* `GROUP BY` for aggregations
* `CTE (Common Table Expressions)`
* KPI calculations and analytical queries

---

## 📁 Project Structure

```
sql-data-analytics-project
│
├── change_over_time_analysis.sql
├── cumulative_analysis.sql
├── customer_report.sql
├── data_segmentation.sql
├── part_to_whole_analysis.sql
├── performance_analysis.sql
└── product_report.sql
```

---

## 👨‍💻 Author

**Vaibhav Thareja**
Data Engineer at LTIMindtree

---

## 🚀 Project Purpose

This project was created as a **portfolio project** to demonstrate practical SQL skills used in real-world analytics scenarios. It showcases how SQL can be used to perform **advanced data analysis, generate business reports, and derive insights that support strategic decision making**.
