-- Create schema
CREATE SCHEMA IF NOT EXISTS raw;

-- Create tables
CREATE TABLE raw.raw_customers (
    customer_id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    created_at TIMESTAMP
);

CREATE TABLE raw.raw_products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price NUMERIC,
    created_at TIMESTAMP
);

CREATE TABLE raw.raw_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP,
    order_status TEXT,
    order_total NUMERIC,
    updated_at TIMESTAMP
);

CREATE TABLE raw.raw_order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price NUMERIC,
    updated_at TIMESTAMP
);


