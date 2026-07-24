
--checking nulls and duplicates in primary key

SELECT *
FROM bronze.crm_cust_info

SELECT
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

SELECT*
FROM bronze.crm_cust_info
WHERE cst_id = 29466
SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info


--unwanted spaces
SELECT *
FROM silver.crm_cust_info


SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

SELECT cst_gndr
FROM silver.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)



