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
- Details: [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L12-L67)

## Exploratory Data Analysis
- Identified ProductID 17 (Product_17, Beauty & Health) as top performer with 109 units and $9450 sales.
- Noted CustomerID 664 with 14 transactions as a key buyer.
- Highlighted "Electronics" category with $19,500 total sales.
- Details: [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L69-L96)

## Data Analysis
- Top 10 high-revenue products: ProductID 17 (Product_17, Beauty & Health) ($9450), ProductID 2 (Product_2, Home & Kitchen) ($6200). [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L98-L106)
- Lowest performer: ProductID 1 (Product_1, Clothing) with 1 unit sold. [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L108-L117)
- Sales trend: Grew from $15,000 (January 2023) to $16,500 (February 2023), 10% growth. [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L119-L142)
- Customer insights: CustomerID 664 (14 transactions, $1500), CustomerID 100 (1 transaction, $50). [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L144-L166)
- Repeat purchase: CustomerID 664 bought ProductID 17 (Product_17, Beauty & Health) twice. [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L169-L176)
- Loyalty metric: CustomerID 664 showed 180 days between purchases. [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L178-L188)
- Segmentation: 50 low, 30 medium, 20 high-value customers. [SQL Queries](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql#L190-L206)

## Results Finding
- ProductID_17 (**_Beauty & Health_**) led with **109 units and $9450**, indicating **strong demand**.
- "**_Electronics_**" category generated **$19,500**, a **key revenue driver**.
- Top 10 products included ProductID_2 (**_Home & Kitchen_**) at **$6200**, highlighting **diverse high performers**.
- ProductID_1 (**_Clothing_**) sold only 1 unit, signaling potential underperformance.
- **Sales increased by 10%** from **$15,000 to $16,500** between January and February 2023, showing growth potential.
- **CustomerID 664** spent $1500 over 14 transactions, a **high-value customer to retain**.
- **CustomerID 100** spent $50 once, representing a **segment needing engagement**.
- **CustomerID 664’s** repeat purchase of ProductID 17 (Beauty & Health) twice suggests **brand loyalty**.
- **CustomerID 664’s** 180-day purchase span indicates **long-term interest**.
- Customer segmentation revealed **50 low, 30 medium, and 20 high-value customers**, offering targeted opportunities.

## Recommendation
- Focus inventory on top products "**_Beauty & Health_**" and "**_Electronics_**" category to **capitalize on demand**.
- Target marketing at high-value customers (e.g., CustomerID 664) to maximize retention.
- Develop retention strategies for loyal customers (e.g., CustomerID 664 with 180-day span).
- Address underperforming products (e.g., ProductID_1, Clothing)) with promotions or phase-out plans.
- Engage low-activity customers (e.g., CustomerID 100) with tailored campaigns.

## Limitation
- Analysis limited to provided dataset, no external trends.
- Lacks advanced modeling due to scope.
- Dependent on sample data accuracy.

## References
- [MySQL documentation for query implementation.](https://github.com/Richa991/Retail_Analysis_SQL/blob/main/Rertail_Analytics_CaseStudy.sql)
