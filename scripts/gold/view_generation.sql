
---------------------------------------------CRETING  VIEW FOR CUSTOMER DIMENSION



CREATE VIEW gold.dim_customers AS

	select 
		ROW_NUMBER() OVER  (ORDER BY ci.cst_id) AS customer_key,
		ci.cst_id AS customer_id,
		ci.cst_key AS customer_number,
		ci.cst_firstname AS first_name,
		ci.cst_lastname AS last_name,	
		CASE
			WHEN ci.cst_gndr != 'N/A' THEN ci.cst_gndr
			ELSE COALESCE(ca.gen, 'N/A')
		END as gender,
		ci.cst_marital_status AS marital_status,
		la.cntry AS country,
		ca.bdate AS birth_date,
		ci.cst_create_date AS create_date
	
	FROM [silver].[crm_cust_info] ci
	LEFT JOIN   [silver].[erp_CUST_AZ12] ca
	ON			ci.cst_key = ca.cid
	LEFT JOIN   [silver].[erp_LOC_A101] la
	ON			ci.cst_key = la.cid


---------------------------------------------CRETING  VIEW FOR PRODUCT DIMENSION



CREATE view gold.dim_products AS

	select 
		ROW_NUMBER() OVER (ORDER BY pin.prd_start_dt,pin.prd_key) AS product_key,
		pin.prd_id AS product_id,
		pin.prd_key AS product_number,
		pin.prd_nm AS product_name,
		pin.cat_id AS category_id,
		pc.cat AS category,
		pc.subcat AS sub_category,
		pc.maintenance,
		pin.prd_cost AS product_cost,
		pin.prd_line AS product_line,
		pin.prd_start_dt AS start_date

	

	from [silver].[crm_prd_info] pin
	LEFT JOIN   [silver].[erp_PX_CAT_G1V2] pc
	ON			pin.cat_id = pc.id
	WHERE pin.prd_end_dt IS NULL




---------------------------------------------CRETING  VIEW FOR SALES DIMENSION


CREATE VIEW gold.fact_sales AS
	SELECT 
		sd.sls_ord_num AS order_number,
		pr.product_key,
		cs.customer_key,
		sd.sls_order_dt AS order_date,
		sd.sls_ship_dt AS shiping_date,
		sd.sls_due_dt AS due_date,
		sd.sls_sales AS sales_amount,
		sd.sls_quantity AS quantity,
		sd.sls_price AS price

	FROM SILVER.crm_sales_details sd
	LEFT JOIN gold.dim_products pr
	ON		  sd.sls_prd_key = pr.product_number
	LEFT JOIN gold.dim_customers cs
	ON		  sd.sls_cust_id = cs.customer_id



