WITH customer_orders AS (
    SELECT *
    FROM {{ ref('int_customer_orders') }}
)

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_total) AS total_spent,
    AVG(order_total) AS avg_order_value,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date
FROM customer_orders
WHERE order_status != 'cancelled'
GROUP BY customer_id
