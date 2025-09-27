/*

THE FOLLOWING SCRIPT CREATES A PROCEDURE TO LOAD DATA INTO BRONZE SCHEMA FROM EXTERNAL CSV FILES.
IT PERFORMS THE FOLLOWING ACTIONS:
          * TRUNCATES ALL TABLES BEFORE DATA INSERTION TO IMPOSE BULK INSERTION.
          * USES 'BULK INSERT' COMMAND TO LOAD DATA.

AFTER CRETING THE PROCEDURE USE THE FOLLOWING QUERY TO EXECUTE IT:

          Exec bronze.load_bronze


*/


---------------------INSERTING DATA INTO TABLES FROM SOURCE FILES

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		DECLARE	@start_time DATETIME, @end_time DATETIME, @layer_load_start_time DATETIME, @layer_load_end_time DATETIME

		SET @layer_load_start_time = GETDATE();
		PRINT '===================================================';
		PRINT 'Loading Data into Bronze Layer';
		PRINT '===================================================';

		PRINT '---------------------------------------------------';
		PRINT 'Loading Data From CRM Tables';
		PRINT '---------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE [bronze].[crm_cust_info]
		PRINT 'Insering Data Into: bronze.crm_cust_info';
		BULK INSERT [bronze].[crm_cust_info]
		FROM 'D:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION : ' + CAST (DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE [bronze].[crm_prd_info]
		PRINT 'Insering Data Into: bronze.crm_prd_info';
		BULK INSERT [bronze].[crm_prd_info]
		FROM 'D:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION : ' + CAST (DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE [bronze].[crm_sales_details]
		PRINT 'Insering Data Into: bronze.crm_sales_details';
		BULK INSERT [bronze].[crm_sales_details]
		FROM 'D:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION : ' + CAST (DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.erp_LOC_A101';
		TRUNCATE TABLE [bronze].[erp_LOC_A101]
		PRINT 'Insering Data Into: bronze.erp_LOC_A101';
		BULK INSERT [bronze].[erp_LOC_A101]
		FROM 'D:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION : ' + CAST (DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.erp_LOC_A101';
		TRUNCATE TABLE [bronze].[erp_LOC_A101]
		PRINT 'Insering Data Into: bronze.erp_LOC_A101';
		BULK INSERT [bronze].[erp_LOC_A101]
		FROM 'D:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION : ' + CAST (DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE [bronze].[erp_PX_CAT_G1V2]
		PRINT 'Insering Data Into: bronze.erp_PX_CAT_G1V2';
		BULK INSERT [bronze].[erp_PX_CAT_G1V2]
		FROM 'D:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION : ' + CAST (DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR(50)) + ' seconds';
		PRINT '----------------';
		SET @layer_load_end_time = GETDATE();
		PRINT '==================================================';
		PRINT 'Loading Bronze Layer Completed'
		PRINT '>>Time taken to Load Full Bronze Layer: ' + CAST(DATEDIFF(second, @layer_load_start_time,@layer_load_end_time)  AS NVARCHAR(50)) + ' seconds'
		PRINT '==================================================';


	END TRY

	BEGIN CATCH
		PRINT '==================================================';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR NUMBER' + CAST(ERROR_NUMBER() AS NVARCHAR(50));
		PRINT '==================================================';
	END CATCH

END
