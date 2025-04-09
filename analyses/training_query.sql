WITH customer_ltv AS (
    SELECT *
    FROM {{ ref('mart_customer_lifetime_value') }}
)

SELECT
    customer_id,
    total_orders,
    total_spent,
    avg_order_value,
    first_order_date,
    last_order_date
FROM customer_ltv
ORDER BY total_spent DESC
LIMIT 10;
