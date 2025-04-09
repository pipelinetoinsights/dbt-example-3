SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price,
    updated_at
FROM {{ source('raw', 'raw_order_items') }}
