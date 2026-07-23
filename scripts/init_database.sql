
/*
---
CREATE Database and Schemas
---

Script Purpose:
 This script creates a new databse name "DataWarehouse" after checking if it already exists.
 I f the db exists, it is dropped and recreated. aHence, the script sets up three shemas within
 the db : 'bronze','silver', and 'gold'.
*/
USE master;
GO

--Drop  and recreate the 'Datawarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = "Datawarehouse")
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END;
GO

--Create the DataWarehouse Database
CREATE DATABASE Datawahouse;

USE Datawarehouse;

--CREATE SCHEMAS

CREATE SCHEMA Bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
