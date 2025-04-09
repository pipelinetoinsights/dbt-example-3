WITH customer_ltv AS (
    SELECT *
    FROM {{ ref('mart_customer_lifetime_value') }}
)

SELECT
    customer_id,
    last_order_date,
    CURRENT_DATE - last_order_date::date AS days_since_last_order
FROM customer_ltv
WHERE CURRENT_DATE - last_order_date::date > 90
ORDER BY days_since_last_order DESC;
