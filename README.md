# Data Warehouse and ETL Pipeline using SQL
Creating a Data Warehouse model and ETL pipeline using SQL. 
This project implements a data warehouse designed to unify and transform disparate, raw source data into reliable, business-ready analytical assets. The project automates the entire Extraction, Transformation, and Loading (ETL) pipeline using a structured multi-layered Medallion Architecture.

<img width="1620" height="922" alt="data_architecture" src="https://github.com/user-attachments/assets/9c282e33-a1c1-4cb2-8686-12c67500d86d" />

### Project Overview
This project involves:

Data Architecture: Designing a Modern Data Warehouse Using Medallion Architecture Bronze, Silver, and Gold layers.
ETL Pipelines: Extracting, transforming, and loading data from source systems into the warehouse.
Data Modeling: Developing fact and dimension tables optimized for analytical queries.
Analytics & Reporting: Creating SQL-based reports and dashboards for actionable insights.


The pipeline processes data through three distinct architectural stages:

### Bronze Layer (Raw Ingestion):
Purpose: 
Acts as the landing zone where raw data from source systems (like CSV files containing customer, product, and sales records) is ingested exactly as-is.

Implementation: Databases and schemas are set up, and automated stored procedures utilize BULK INSERT to rapidly load data, logging execution details for audit tracking. Checking data quality to avoid irrevelent data before ingest to silver layer.

<img width="1171" height="193" alt="bronze" src="https://github.com/user-attachments/assets/6e14d7ca-f477-4135-ad91-f7d2a633e4ba" />



### Silver Layer (Data Cleansing & Transformation):

Purpose: Cleans, standardizes, and enriches the raw data to ensure quality and consistency.

Implementation: Stored procedures perform data deduplication, handle null values, trim trailing whitespaces, fix date formats, and standardize fields (such as mapping conflicting gender or marital status codes across different systems into a unified format).

<img width="1171" height="219" alt="silver" src="https://github.com/user-attachments/assets/00e9caea-6972-455d-ab29-d30d6b0b892f" />




### Gold Layer (Analytical Modeling):

Purpose: Organizes the clean data into optimized structures tailored for high-performance reporting and business intelligence (BI) tools.

Implementation: Creates dimensional views and fact tables (dim_customers, fact_sales, etc.) using a Star Schema data model, making it perfectly structured for analytical queries and dashboards.

<img width="1171" height="193" alt="gold" src="https://github.com/user-attachments/assets/51cc24e3-546e-449e-b9c0-061e52e6eba2" />


### Data Governance & Quality Assurance:

Includes built-in data quality checks and validation scripts to identify integrity anomalies (e.g., duplicate primary keys, broken relationships, invalid date ranges) before data hits production views.

