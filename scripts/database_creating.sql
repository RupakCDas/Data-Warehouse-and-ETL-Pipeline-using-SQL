/*
=============================================================
Create Databases (Medallion Architecture Layers)
=============================================================
Script Purpose:
    This script sets up the data warehouse environment by creating 
    three distinct databases representing the Medallion layers:
    'datawarehouse_bronze', 'datawarehouse_silver', and 'datawarehouse_gold'.
    
WARNING:
    Running this script will drop these databases if they exist. 
    All data in them will be permanently deleted. Proceed with caution.
*/

-- Drop existing databases if they exist
DROP DATABASE IF EXISTS bronze;
DROP DATABASE IF EXISTS silver;
DROP DATABASE IF EXISTS gold;

-- Create the individual layer databases
CREATE DATABASE bronze;
CREATE DATABASE silver;
CREATE DATABASE gold;
