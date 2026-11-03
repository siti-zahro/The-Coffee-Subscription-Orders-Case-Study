-- Data Exploration

-- First, Combining Data in CTE as new table named 'data_cleaning' and check total rows

WITH data_cleaning AS(
  SELECT
    c.customer_id,
    name,
    email,
    city,
    order_id,
    amount,
    status,
    payment_method
  FROM `SQL1.Customers` c
  RIGHT JOIN `SQL1.Orders` o
    ON c.customer_id = o.customer_id
)

SELECT *
FROM data_cleaning;                            -- return 383 rows

-- then, check the data types of all columns

SELECT
  TYPEOF(customer_id) AS customer_id,
  TYPEOF(name) AS name,
  TYPEOF(email) AS email,
  TYPEOF(city) AS city,
  TYPEOF(order_id) AS order_id,
  TYPEOF(amount) AS amount,
  TYPEOF(status) AS status,
  TYPEOF(payment_method) AS payment_method
FROM data_cleaning
LIMIT 1;

-- checking for number of null values in all columns

SELECT
  COUNT(*)-COUNT(customer_id) AS customer_id,
  COUNT(*)-COUNT(name) AS name,
  COUNT(*)-COUNT(email) AS email,
  COUNT(*)-COUNT(city) AS city,
  COUNT(*)-COUNT(order_id) AS order_id,
  COUNT(*)-COUNT(amount) AS amount,
  COUNT(*)-COUNT(status) AS status,
  COUNT(*)-COUNT(payment_method) AS payment_method
FROM data_cleaning;

-- checking for duplicate rows

SELECT
  COUNT(customer_id)-COUNT(DISTINCT customer_id) AS customer_id,
  COUNT(name)-COUNT(DISTINCT name) AS name,
  COUNT(email)-COUNT(DISTINCT email) AS email,
  COUNT(city)-COUNT(DISTINCT city) AS city,
  COUNT(order_id)-COUNT(DISTINCT order_id) AS order_id,
  COUNT(amount)-COUNT(DISTINCT amount) AS amount,
  COUNT(status)-COUNT(DISTINCT status) AS status,
  COUNT(payment_method)-COUNT(DISTINCT payment_method) AS payment_method
FROM data_cleaning;

-- checking for unique order

SELECT COUNT(DISTINCT order_id) AS order_id      -- return 368 rows
FROM data_cleaning;
