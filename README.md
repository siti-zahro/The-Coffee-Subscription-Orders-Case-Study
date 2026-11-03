# The Coffee Subscription Orders: Case Study

## Introduction
In this case study, I will perform real-world tasks of an analyst at a fictional company, Timpla Coffee Club. In order to answer the key business questions, I will follow the steps of the data analysis process:

### Quick Links
Data Source: [Scenario 3 - SQL](https://www.millennialbusinessacademy.net/free-resources/data-cleaning-lab)   
Data Cleaning Tool: [BigQuery](https://console.cloud.google.com/bigquery?ws=!1m7!1m6!12m5!1m3!1ssql-porto-513513!2sasia-southeast2!3sb5b34d0a-ee1e-4128-810d-47942074618e!2e1)

## Brief

Timpla Coffee Club runs a monthly coffee subscription. There are two tables: customers and orders, linked by customer_id. The orders table has a re-pasted chunk of exact duplicate rows, some orders whose customer_id is not in the customers table, amounts stored as text like ₱1,250.00 or with stray spaces, and a status column typed many ways (paid, PAID, complete, Completed). The founder is about to report revenue to an investor and wants it right.

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

### Combining the Data


### Data Exploration
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.   

Observation:

### Data Analysis

**Analysis Answer**

1. <img width="256" height="246" alt="image" src="https://github.com/user-attachments/assets/98c6b8d5-f6ff-4230-986d-c95e5757a050" />

2. <img width="190" height="59" alt="image" src="https://github.com/user-attachments/assets/33803571-50eb-411e-a2c3-601b2964dabc" />

3. <img width="185" height="55" alt="image" src="https://github.com/user-attachments/assets/43dd13a1-dd95-4976-8eb6-df3debd18365" />

4. <img width="187" height="59" alt="image" src="https://github.com/user-attachments/assets/9e381769-f76b-4ae5-8aed-75f432dd840c" />
