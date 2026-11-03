-- Data Analysis

-- Started from the CTE, new table named 'data_cleaning'

WITH data_cleaning AS(
  SELECT
  c.customer_id,
  name,
  email,
  city,
  order_id,
 
  CAST(
    CASE
      WHEN amount IS NULL THEN '0'
        ELSE
          SAFE_CAST(REPLACE(REPLACE(amount,'₱',''),',','') AS STRING)
    END
  AS NUMERIC) AS amount,

  CASE
    WHEN UPPER(status) LIKE '%COMPLETE%'
      THEN 'PAID'
    WHEN UPPER(status) LIKE '%REFUND%'
      THEN 'REFUNDED'
       ELSE UPPER(status)
    END AS status,

  CASE
    WHEN LOWER(payment_method) IN ('maya', 'paymaya')
      THEN 'PayMaya'
    WHEN LOWER(payment_method) = 'gcash'
      THEN 'GCash'
    WHEN UPPER(payment_method) = 'COD'
      THEN 'COD'
       ELSE INITCAP(payment_method)
  END AS payment_method

FROM `SQL1.Customers` c
RIGHT JOIN `SQL1.Orders` o
  ON c.customer_id=o.customer_id

QUALIFY ROW_NUMBER() OVER(PARTITION BY CAST(REGEXP_REPLACE(order_id,'ORD-','') AS NUMERIC)) = 1
ORDER BY O.customer_id
);

-- How many distinct orders are there?
  
SELECT *                                           -- giving 368 distinct orders
FROM data_cleaning;

-- How many orphan orders (no matching customer) are there?

SELECT COUNT(order_id) AS order_id                 -- giving 8 orders with no customer id
FROM data_cleaning
WHERE customer_id IS NULL;

-- What is the total paid revenue?

SELECT SUM(amount) AS revenue                      -- the total paid revenue is 233,036 peso currency
FROM data_cleaning
WHERE status = 'PAID';

--How many Paid orders are there?

SELECT COUNT(status) AS status                     -- giving 260 paid orders
FROM data_cleaning
WHERE status = 'PAID';
