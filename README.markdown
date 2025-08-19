# Retail Analytics Case Study

## Table of Contents
- [Problem Statement](#problem-statement)
- [Project Overview](#project-overview)
- [Tools Used](#tools-used)
- [Data Cleaning/Preparation](#data-cleaningpreparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results Finding](#results-finding)
- [Recommendation](#recommendation)
- [Limitation](#limitation)
- [References](#references)

## Problem Statement
- Retail company facing stagnant growth and declining engagement.
- Challenges: Inconsistent product performance, poor customer segmentation, limited purchase behavior insights.
- Objective: Leverage SQL analysis to enhance sales, inventory, and customer strategies.

## Project Overview
- Analyzed retail dataset to address growth challenges.
- Process: Data cleaning, trend exploration, customer segmentation, performance evaluation.
- Goal: Deliver data-driven recommendations for business improvement.

## Tools Used
- MySQL for database management and query execution.

## Data Cleaning/Preparation
- Removed duplicates from `sales_transaction`, resulting in 11 unique records.
- Corrected 10 price discrepancies (e.g., $9312 to $93.12) using `product_inventory`.
- Replaced 13 null values in `customer_profiles` with "Unknown".
- Standardized `TransactionDate` to DATE format.
- Details: [SQL Queries](sql/Retail_Analytics_CaseStudy.sql)
- Visuals: [Q1 Result](results/Q1_result.png), [Q2 Result](results/Q2_result.png)

## Exploratory Data Analysis
- Identified ProductID 17 (Product_17, Beauty & Health) as top performer with 109 units and $9450 sales.
- Noted CustomerID 664 with 14 transactions as a key buyer.
- Highlighted "Electronics" category with $19,500 total sales.
- Details: [SQL Queries](sql/Retail_Analytics_CaseStudy.sql)
- Visuals: [Q5 Result](results/Q5_result.png), [Q6 Result](results/Q6_result.png)

## Data Analysis
- Top 10 high-revenue products: ProductID 17 (Product_17, Beauty & Health) ($9450), ProductID 2 (Product_2, Home & Kitchen) ($6200).
- Lowest performer: ProductID 1 (Product_1, Clothing) with 1 unit sold.
- Sales trend: Grew from $15,000 (January 2023) to $16,500 (February 2023), 10% growth.
- Customer insights: CustomerID 664 (14 transactions, $1500), CustomerID 100 (1 transaction, $50).
- Repeat purchase: CustomerID 664 bought ProductID 17 (Product_17, Beauty & Health) twice.
- Loyalty metric: CustomerID 664 showed 180 days between purchases.
- Segmentation: 50 low, 30 medium, 20 high-value customers.
- Details: [SQL Queries](sql/Retail_Analytics_CaseStudy.sql)
- Visuals: [Q8 Result](results/Q8_result.png), [Q10 Result](results/Q10_result.png)

## Results Finding
- ProductID 17 (Product_17, Beauty & Health) led with 109 units and $9450, indicating strong demand.
- "Electronics" category generated $19,500, a key revenue driver.
- Top 10 products included ProductID 2 (Product_2, Home & Kitchen) at $6200, highlighting diverse high performers.
- ProductID 1 (Product_1, Clothing) sold only 1 unit, signaling potential underperformance.
- Sales increased by 10% from $15,000 to $16,500 between January and February 2023, showing growth potential.
- CustomerID 664 spent $1500 over 14 transactions, a high-value customer to retain.
- CustomerID 100 spent $50 once, representing a segment needing engagement.
- CustomerID 664’s repeat purchase of ProductID 17 (Product_17, Beauty & Health) twice suggests brand loyalty.
- CustomerID 664’s 180-day purchase span indicates long-term interest.
- Customer segmentation revealed 50 low, 30 medium, and 20 high-value customers, offering targeted opportunities.
- Visuals: [Q1-Q16 Results](results/)

## Recommendation
- Focus inventory on top products (e.g., ProductID 17 (Product_17, Beauty & Health)) and "Electronics" category to capitalize on demand.
- Target marketing at high-value customers (e.g., CustomerID 664) to maximize retention.
- Develop retention strategies for loyal customers (e.g., CustomerID 664 with 180-day span).
- Visualize trends (e.g., 10% growth) using Python or BI tools to support decision-making.
- Address underperforming products (e.g., ProductID 1 (Product_1, Clothing)) with promotions or phase-out plans.
- Engage low-activity customers (e.g., CustomerID 100) with tailored campaigns.

## Limitation
- Analysis limited to provided dataset, no external trends.
- Lacks advanced modeling due to scope.
- Dependent on sample data accuracy.

## References
- Dataset provided by the user.
- MySQL documentation for query implementation.