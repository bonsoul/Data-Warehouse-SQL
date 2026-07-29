-- ============================================================
-- QUALITY CHECKS: gold.dim_customers
-- ============================================================

-- 1. Check for duplicate customer_key (should be unique — surrogate key)
SELECT customer_key, COUNT(*) AS cnt
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- 2. Check for duplicate customer_id (fan-out risk from LEFT JOINs to ca/cl)
-- If this returns rows, one of erp_cust_az12 or erp_loc_a101 has duplicate cid values
SELECT customer_id, COUNT(*) AS cnt
FROM gold.dim_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 3. Check for unexpected NULLs in key fields
SELECT *
FROM gold.dim_customers
WHERE customer_id IS NULL
   OR customer_number IS NULL
   OR create_date IS NULL;

-- 4. Check gender standardization — should only be a known set of values
SELECT DISTINCT gender
FROM gold.dim_customers;

-- 5. Check marital_status standardization
SELECT DISTINCT marital_status
FROM gold.dim_customers;

-- 6. Check for future-dated or implausible birth dates
SELECT customer_id, birth_date
FROM gold.dim_customers
WHERE birth_date > GETDATE()
   OR birth_date < '1920-01-01';

-- 7. Check country standardization (look for inconsistent codes vs full names, blanks)
SELECT DISTINCT country
FROM gold.dim_customers
ORDER BY country;


-- ============================================================
-- QUALITY CHECKS: gold.dim_products
-- ============================================================

-- 1. Check for duplicate product_key
SELECT product_key, COUNT(*) AS cnt
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- 2. Check for duplicate product_number (should be unique after filtering to current records)
SELECT product_number, COUNT(*) AS cnt
FROM gold.dim_products
GROUP BY product_number
HAVING COUNT(*) > 1;

-- 3. Check for unexpected NULLs in key fields
SELECT *
FROM gold.dim_products
WHERE product_id IS NULL
   OR product_number IS NULL
   OR product_name IS NULL;

-- 4. Check for negative or zero product cost
SELECT product_id, product_name, product_cost
FROM gold.dim_products
WHERE product_cost < 0
   OR product_cost IS NULL;

-- 5. Check category/subcategory standardization
SELECT DISTINCT category, subcategory
FROM gold.dim_products
ORDER BY category, subcategory;

-- 6. Check product_line standardization
SELECT DISTINCT product_line
FROM gold.dim_products;

-- 7. Check start_date is not null (used in ROW_NUMBER ordering)
SELECT *
FROM gold.dim_products
WHERE start_date IS NULL;


-- ============================================================
-- QUALITY CHECKS: gold.fact_sales
-- ============================================================

-- 1. Referential integrity — sales rows that failed to join to dim_products
SELECT *
FROM gold.fact_sales
WHERE product_key IS NULL;

-- 2. Referential integrity — sales rows that failed to join to dim_customers
SELECT *
FROM gold.fact_sales
WHERE customer_key IS NULL;

-- 3. Check for duplicate order_number + product_key combinations
-- (adjust grain definition if a single order can legitimately repeat a product)
SELECT order_number, product_key, COUNT(*) AS cnt
FROM gold.fact_sales
GROUP BY order_number, product_key
HAVING COUNT(*) > 1;

-- 4. Check sales_amount = quantity * price (business rule validation)
SELECT *
FROM gold.fact_sales
WHERE sales_amount IS NULL
   OR quantity IS NULL
   OR price IS NULL
   OR sales_amount != quantity * price
   OR sales_amount <= 0
   OR quantity <= 0
   OR price <= 0;

-- 5. Check date logic: order_date <= shipping_date <= due_date
SELECT *
FROM gold.fact_sales
WHERE order_date > shipping_date
   OR shipping_date > due_date
   OR order_date IS NULL;

-- 6. Check for implausible order dates (future dates or too far in the past)
SELECT *
FROM gold.fact_sales
WHERE order_date > GETDATE()
   OR order_date < '2000-01-01';
