/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

DELIMITER $$

CREATE PROCEDURE bronze.load_bronze()
BEGIN
    -- Declare local variables at the very beginning
    DECLARE start_time DATETIME(6);
    DECLARE end_time DATETIME(6);
    DECLARE batch_start_time DATETIME(6);
    DECLARE batch_end_time DATETIME(6);
    
    -- Error handling block variables
    DECLARE code CHAR(5) DEFAULT '00000';
    DECLARE msg TEXT;
    
    -- Error Handler for any SQL Exception
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            code = RETURNED_SQLSTATE, msg = MESSAGE_TEXT;
        
        SELECT '==========================================' AS '';
        SELECT 'ERROR OCCURED DURING LOADING BRONZE LAYER' AS '';
        SELECT CONCAT('Error Message: ', msg) AS '';
        SELECT CONCAT('Error Code: ', code) AS '';
        SELECT '==========================================' AS '';
    END;

    -- Start Batch Process
    SET batch_start_time = NOW(6);
    SELECT '================================================' AS '';
    SELECT 'Loading Bronze Layer' AS '';
    SELECT '================================================' AS '';

    SELECT '------------------------------------------------' AS '';
    SELECT 'Loading CRM Tables' AS '';
    SELECT '------------------------------------------------' AS '';

    -- 1. bronze.crm_cust_info
    SET start_time = NOW(6);
    SELECT '>> Truncating Table: bronze.crm_cust_info' AS '';
    TRUNCATE TABLE bronze.crm_cust_info;
    
    SELECT '>> Inserting Data Into: bronze.crm_cust_info' AS '';
    LOAD DATA LOCAL INFILE 'C:\\Users\\IT BD\\Desktop\\all things\cust_info.csv'
    INTO TABLE bronze.crm_cust_info
    FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW(6);
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS '';
    SELECT '>> -------------' AS '';

    -- 2. bronze.crm_prd_info
    SET start_time = NOW(6);
    SELECT '>> Truncating Table: bronze.crm_prd_info' AS '';
    TRUNCATE TABLE bronze.crm_prd_info;
    
    SELECT '>> Inserting Data Into: bronze.crm_prd_info' AS '';
    LOAD DATA INFILE 'C:\Users\IT BD\Desktop\all things\prd_info.csv'
    INTO TABLE bronze.crm_prd_info
    FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW(6);
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS '';
    SELECT '>> -------------' AS '';

    -- 3. bronze.crm_sales_details
    SET start_time = NOW(6);
    SELECT '>> Truncating Table: bronze.crm_sales_details' AS '';
    TRUNCATE TABLE bronze.crm_sales_details;
    
    SELECT '>> Inserting Data Into: bronze.crm_sales_details' AS '';
    LOAD DATA INFILE 'C:\Users\IT BD\Desktop\all things\sales_details.csv'
    INTO TABLE bronze.crm_sales_details
    FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW(6);
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS '';
    SELECT '>> -------------' AS '';


    SELECT '------------------------------------------------' AS '';
    SELECT 'Loading ERP Tables' AS '';
    SELECT '------------------------------------------------' AS '';
    
    -- 4. bronze.erp_loc_a101
    SET start_time = NOW(6);
    SELECT '>> Truncating Table: bronze.erp_loc_a101' AS '';
    TRUNCATE TABLE bronze.erp_loc_a101;
    
    SELECT '>> Inserting Data Into: bronze.erp_loc_a101' AS '';
    LOAD DATA INFILE 'C:\Users\IT BD\Desktop\all things\loc_a101.csv'
    INTO TABLE bronze.erp_loc_a101
    FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW(6);
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS '';
    SELECT '>> -------------' AS '';

    -- 5. bronze.erp_cust_az12
    SET start_time = NOW(6);
    SELECT '>> Truncating Table: bronze.erp_cust_az12' AS '';
    TRUNCATE TABLE bronze.erp_cust_az12;
    
    SELECT '>> Inserting Data Into: bronze.erp_cust_az12' AS '';
    LOAD DATA INFILE 'C:\Users\IT BD\Desktop\all things\cust_az12.csv'
    INTO TABLE bronze.erp_cust_az12
    FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW(6);
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS '';
    SELECT '>> -------------' AS '';

    -- 6. bronze.erp_px_cat_g1v2
    SET start_time = NOW(6);
    SELECT '>> Truncating Table: bronze.erp_px_cat_g1v2' AS '';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    
    SELECT '>> Inserting Data Into: bronze.erp_px_cat_g1v2' AS '';
    LOAD DATA INFILE 'C:\Users\IT BD\Desktop\all things\px_cat_g1v2.csv'
    INTO TABLE bronze.erp_px_cat_g1v2
    FIELDS TERMINATED BY ',' 
    OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES;
    
    SET end_time = NOW(6);
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS '';
    SELECT '>> -------------' AS '';

    -- End Batch Process
    SET batch_end_time = NOW(6);
    SELECT '==========================================' AS '';
    SELECT 'Loading Bronze Layer is Completed' AS '';
    SELECT CONCAT('   - Total Load Duration: ', TIMESTAMPDIFF(SECOND, batch_start_time, batch_end_time), ' seconds') AS '';
    SELECT '==========================================' AS '';

END$$

DELIMITER ;
