# Example dbt Project - 3

This is an example dbt project prepared by [Pipeline To Insights](https://pipeline2insights.substack.com/) for tutorial purposes. Check out full blog post for more details.

🔗 [Full Post](post-link) 

This project is a demonstration of **dbt best practices** for transforming and analysing e-commerce data using a **layered approach**, including:

- `stg_`: Source cleaning
- `int_`: Business logic
- `mart_`: Final outputs for dashboards
- `analyses/`: Exploratory and one-off queries

---

## Dataset

We use sample data representing:

- Customers
- Products
- Orders
- Order Items

These CSV files are loaded into a local **Postgres** database under a `raw` schema.

---

## Project Layers

### `staging/`
- Materialised as **views**
- Clean and standardise raw source data

### `intermediate/`
- Materialised as **views**
- Business logic and joining staged data

### `marts/`
- Mixed materialisations:
  - `mart_customer_lifetime_value`: **table**
  - `mart_product_sales_summary`: **incremental**

### `analyses/`
- Contains training and one-off queries using `ref()` syntax
- Useful for ad hoc exploration and demos

---

## Setup Instructions

### 1. Clone the repo

```bash
git clone https://github.com/your-username/dbt-example-3.git
cd dbt-example-3
```

### 2. Install dependencies

```bash
python -m venv env
source env/bin/activate  # or .\env\Scripts\activate on Windows
pip install -r requirements.txt
```

### 3. Configure your dbt profile

dbt needs a `profiles.yml` file to connect to your Postgres database.

Create (or update) the file at `~/.dbt/profiles.yml` with the following:

```yaml
dbt_post_3:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: 'your_user' # your Postgres username
      password: 'your_password' # your Postgres password
      port: 5432
      dbname: 'your_db'  # name of your database
      schema: 'your_schema' # name of your database schema
      threads: 4
```

Once set up, test your connection by running:

```bash
dbt debug
```

We have included `dbt_post_3_setup.sql` in the root directory of the repo for creating the tables and
`./data` folder includes `.csv` file to be imported into the tables.

### 4. Run dbt

After importing the data into db.

```bash
dbt run
dbt test
```

### 5. Explore models + analyses queries

After `dbt run` all the models will materialized in the defined db (`stg_` and `int_` models as views,
`mart_` models as table).

Additionally, to make use of analyses queries:

```bash
dbt compile
```

This will compile queries in the analyses folder into `/target/compiles/dbt_post_3/analyses/` so that 
you can run in your db by simply copy/paste.
