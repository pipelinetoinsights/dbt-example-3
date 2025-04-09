SELECT
    customer_id,
    lower(trim(first_name)) AS first_name,
    lower(trim(last_name)) AS last_name,
    lower(email) AS email,
    created_at
FROM {{ source('raw', 'raw_customers') }}
