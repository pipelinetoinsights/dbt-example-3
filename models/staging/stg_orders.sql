SELECT
    order_id,
    customer_id,
    order_date,
    lower(order_status) AS order_status,
    order_total,
    updated_at
FROM {{ source('raw', 'raw_orders') }}
