# The Coffee Subscription Orders: Case Study

## Introduction
In this case study, I will perform scenario tasks of an analyst at a fictional company, Timpla Coffee Club. In order to answer the key business questions, I will follow the steps of the data analysis process:

### Quick Links
Data Source: [Scenario 3 - SQL](https://www.millennialbusinessacademy.net/free-resources/data-cleaning-lab)   
Data Cleaning Tool: [BigQuery](https://console.cloud.google.com/bigquery?ws=!1m7!1m6!12m5!1m3!1ssql-porto-513513!2sasia-southeast2!3sb5b34d0a-ee1e-4128-810d-47942074618e!2e1)

## Brief

Timpla Coffee Club runs a monthly coffee subscription. There are two tables: customers and orders, linked by customer_id. The orders table has a re-pasted chunk of exact duplicate rows, some orders whose customer_id is not in the customers table, amounts stored as text like ₱1,250.00 or with stray spaces, and a status column typed many ways (paid, PAID, complete, Completed). The founder, Ms. Tanchanco, is about to report revenue to an investor and wants it right.

## Task

**Cleaning Requested:**
1. Download both CSVs and import them into a free SQL tool: DB Browser for SQLite is easiest, or a BigQuery sandbox.
2. Load timpla-customers.csv into a customers table and timpla-orders.csv into an orders table.
3. Clean with queries, then answer. Dedup and standardize status before you aggregate.

**Analysis Question**
1. How many distinct orders are there?
2. How many orphan orders (no matching customer) are there?
3. What is the total paid revenue?
4. How many Paid orders are there?

## process
BigQuery is used to combine the various datasets into one dataset and clean it.   

### Data Exploration
SQL query: [Data Exploration](https://github.com/siti-zahro/The-Coffee-Subscription-Orders-Case-Study/blob/main/01.%20Data%20Exploration.sql)   
2 csv files are uploaded as tables in the dataset 'SQL1'. Another table named "data_cleaning" is created, containing 383 rows of data for the first half of 2026.   

Before cleaning the data, I am combining the data and familiarizing myself with it to find the inconsistencies.   

Observation:

1. Combining 2 data into a new table named "data_cleaning" and checking total rows.   

   <img width="189" height="55" alt="image" src="https://github.com/user-attachments/assets/18d92177-9d6c-4f3a-9daf-efc037cf4839" />

2. The table below shows all column names and their data types. The `customer_id` column is the primary key.

   <img width="717" height="59" alt="Screenshot 2026-11-03 222117" src="https://github.com/user-attachments/assets/63b3a30e-18e6-4d26-95b7-28937ae12619" />

3. The following table shows number of null values in each column.

   <img width="1057" height="56" alt="Screenshot 2026-11-03 223829" src="https://github.com/user-attachments/assets/6736024f-f616-49e2-808e-b7a16f3f8657" />

4. Now checking the duplicate rows in each column.

   <img width="1057" height="57" alt="Screenshot 2026-11-03 224142" src="https://github.com/user-attachments/assets/bc6b05be-b27b-4631-a13f-93ed610afe13" />

5. Because each customer can order coffee multiple times in a different time, then I am checking the unique rows from the `order_id`.

   <img width="190" height="59" alt="Screenshot 2026-11-03 165306" src="https://github.com/user-attachments/assets/9a413bdc-8ec3-43d1-b777-4f53bfacc92f" />   

   There are 368 unique rows.

### Data Cleaning
SQL Query: [Data Cleaning](https://github.com/siti-zahro/The-Coffee-Subscription-Orders-Case-Study/blob/main/02.%20Data%20Cleaning.sql)   

1. Convert data type.
2. Convert null row in `amount` column to "0".
3. Replace inconsistent rows in `amount` column.
4. Standardize the status in `status` column as complete/completed to paid.
5. All the duplicate rows in `order_id` column are deleted.
6. Total 15 rows are removed in this step.

### Data Analysis
SQL Query: [Data Analysis](https://github.com/siti-zahro/The-Coffee-Subscription-Orders-Case-Study/blob/main/03.%20Data%20Analysis.sql)   

**Analysis Answer**

1. How many distinct orders are there? 368

   <img width="256" height="246" alt="image" src="https://github.com/user-attachments/assets/98c6b8d5-f6ff-4230-986d-c95e5757a050" />

2. How many orphan orders (no matching customer) are there? 8

   <img width="190" height="59" alt="image" src="https://github.com/user-attachments/assets/33803571-50eb-411e-a2c3-601b2964dabc" />

3. What is the total paid revenue? ₱233,036

   <img width="185" height="55" alt="image" src="https://github.com/user-attachments/assets/43dd13a1-dd95-4976-8eb6-df3debd18365" />

4. How many Paid orders are there? 260

   <img width="187" height="59" alt="image" src="https://github.com/user-attachments/assets/9e381769-f76b-4ae5-8aed-75f432dd840c" />
