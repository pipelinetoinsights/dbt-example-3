WITH order_items AS (
    SELECT *
    FROM {{ ref('stg_order_items') }}
),

products AS (
    SELECT *
    FROM {{ ref('stg_products') }}
)

SELECT
    oi.order_item_id,
    oi.order_id,
    oi.product_id,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total,
    oi.updated_at
FROM order_items oi
LEFT JOIN products p
    ON oi.product_id = p.product_id
