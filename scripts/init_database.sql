/*

==================================================================================
CREATE DATABASE AND SCHEMAS
==================================================================================
SCRIPT PURPOSE:
      This script creates a new database named 'DataWarehouse' after checking whether it already exists.
      If the database exists, it will be dropped and recreated. Also, the script creates three
      schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
      Running this script will completely drop the existing 'DataWarehouse' database, if it exists.
      All data within the database will be permanently deleted. Proceed with caution.
      Ensure that proper backups exist before running this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

-- Use the 'DataWarehouse' database
USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
