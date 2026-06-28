/*
=============================================================
Create Databases (Medallion Architecture Layers)
=============================================================
Script Purpose:
    This script sets up the data warehouse environment by creating 
    three distinct databases representing the Medallion layers:
    'datawarehouse_bronze', 'datawarehouse_silver', and 'datawarehouse_gold'.
*/

USE master;
GO

-- Drop and recreate the 'data_warehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'data_warehouse')
DROP DATABASE data_warehouse;

-- Create the 'data_warehouse' database
CREATE DATABASE data_warehouse;
USE data_warehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
