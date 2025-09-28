
/*


EXECUTE THE FOLLOWING QUERY TO GENERATE ALL CRM AND ERP TABLES.


*/





-----------------------------Creating tables in Database

IF OBJECT_ID('silver.crm_cust_info' ,'U') is NOT NULL
	DROP TABLE silver.crm_cust_info;

create table silver.crm_cust_info
(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);


IF OBJECT_ID('silver.crm_prd_info' ,'U') is NOT NULL
	DROP TABLE silver.crm_prd_info;

create table silver.crm_prd_info
(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);


IF OBJECT_ID('silver.crm_sales_details' ,'U') is NOT NULL
	DROP TABLE silver.crm_sales_details;

create table silver.crm_sales_details
(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);


IF OBJECT_ID('silver.erp_CUST_AZ12' ,'U') is NOT NULL
	DROP TABLE silver.erp_CUST_AZ12;

create table silver.erp_CUST_AZ12
(
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50)
);


IF OBJECT_ID('silver.erp_LOC_A101' ,'U') is NOT NULL
	DROP TABLE silver.erp_LOC_A101;

create table silver.erp_LOC_A101
(
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50)
);


IF OBJECT_ID('silver.erp_PX_CAT_G1V2' ,'U') is NOT NULL
	DROP TABLE silver.erp_PX_CAT_G1V2;

create table silver.erp_PX_CAT_G1V2
(
	ID NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50)
);
