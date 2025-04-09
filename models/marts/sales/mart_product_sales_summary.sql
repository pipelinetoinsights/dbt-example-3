{{ 
  config(
    unique_key='product_id',
    incremental_strategy='merge'
  ) 
}}

WITH order_items AS (
    SELECT *
    FROM {{ ref('int_order_item_details') }}
)

SELECT
    product_id,
    product_name,
    category,
    SUM(quantity) AS total_quantity_sold,
    SUM(item_total) AS total_revenue,
    MAX(updated_at) AS last_updated_at
FROM order_items
{% if is_incremental() %}
WHERE updated_at > (SELECT COALESCE(MAX(last_updated_at), '2000-01-01') FROM {{ this }})
{% endif %}
GROUP BY product_id, product_name, category
