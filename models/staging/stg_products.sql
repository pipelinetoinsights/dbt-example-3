SELECT
    product_id,
    lower(product_name) AS product_name,
    lower(category) AS category,
    price,
    created_at
FROM {{ source('raw', 'raw_products') }}
