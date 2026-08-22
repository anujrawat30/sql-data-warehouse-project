/*
===================================================================================================
STORED PROCEDURE: LOAD BRONZE LAYER (SOURCE -> BRONZE)
===================================================================================================
Script Purpose:
      This stored procedure loads data into the bronze schema from the external csv files.
      It performes the following actions:
        - Truncates the bronze tables before loading data.
        - Use the BULK INSERT command to load data from csv files to bronze tables.
Parameters:
      None, this stored procedure doesn't accept any parameters or return any values.

Usage example:
      EXEC bronze.load_bronze;
===================================================================================================
*/
EXEC bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=========================================';
		PRINT '----------LOADING BRONZE LAYER-----------';
		PRINT '=========================================';
	
		PRINT '=========================================';
		PRINT '-----------LOADING CRM TABLES------------';
		PRINT '=========================================';
		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Projects\guided project\End to End Data project- baraa\Data Warehouse\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'Seconds';
		PRINT '>>---------------------'

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Projects\guided project\End to End Data project- baraa\Data Warehouse\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'Seconds';
		PRINT '>>---------------------'

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Projects\guided project\End to End Data project- baraa\Data Warehouse\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'Seconds';
		PRINT '>>---------------------'

		PRINT '=========================================';
		PRINT 'LOADING ERP TABLES';
		PRINT '=========================================';
		
		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Projects\guided project\End to End Data project- baraa\Data Warehouse\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'Seconds';
		PRINT '>>---------------------'

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Projects\guided project\End to End Data project- baraa\Data Warehouse\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'Seconds';
		PRINT '>>---------------------'

		SET @start_time = GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Projects\guided project\End to End Data project- baraa\Data Warehouse\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: '+ CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + 'Seconds';
		PRINT '>>---------------------'

		SET @batch_end_time = GETDATE();
		PRINT '=========================================';
		PRINT 'LOADING BRONZE LAYER IS COMPLETED';
		PRINT '- TOTAL LOAD TIME: '+ CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR)+ 'Seconds';
	END TRY

	BEGIN CATCH
		PRINT '==================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE: '+ ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE: '+ CAST(ERROR_NUMBER() AS NVARCHAR); 
		PRINT 'ERROR MESSAGE: '+ CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '===================================================';
		
	END CATCH
END;
