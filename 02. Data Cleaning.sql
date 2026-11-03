-- Data Cleaning

-- convert data type and cleaning the format row

SELECT
  customer_id,
  name,
  email,
  city,
  order_id,
  CAST(
    CASE
      WHEN amount IS NULL THEN '0'                                        -- convert the null row to '0'
        ELSE
          SAFE_CAST(REPLACE(REPLACE(amount,'₱',''),',','') AS STRING)
    END
  AS NUMERIC) AS amount,

  CASE
    WHEN UPPER(status) LIKE '%COMPLETE%'                                  -- standardized the status
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
FROM data_cleaning;

-- delete the duplicate orders

SELECT customer_id,
  name,
  email,
  city,
  order_id,
  amount,
  status,
  payment_method
FROM data_cleaning
QUALIFY ROW_NUMBER() OVER(PARTITION BY CAST(REGEXP_REPLACE(order_id,'ORD-','') AS NUMERIC)) = 1      -- return 368 rows
ORDER BY customer_id;
