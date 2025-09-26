/*

-----------------------------------------------
Use this script to create databases and schemas
-----------------------------------------------

*/



use master 
GO

----------------------Checking if the Database we want to create already exists or not. If it exists then delete it.
  
IF EXISTS 
(
	select name from sys.databases where name = 'DataWarehouse'	
)

BEGIN
	Drop database DataWarehouse
END

-------------------------Creating New Databse
  
create database DataWarehouse
 

-------------------------Creating New Schemas  
use DataWarehouse
GO


create schema bronze
go
create schema silver
go
create schema gold
go
