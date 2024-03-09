USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Laptop_Shop')
BEGIN
	ALTER DATABASE [Laptop_Shop] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [Laptop_Shop] SET ONLINE;
	DROP DATABASE [Laptop_Shop];
END

GO

CREATE DATABASE [Laptop_Shop]
GO

USE [Laptop_Shop]
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO 
CREATE TABLE [Laptop] (
  [id] integer  IDENTITY(1,1) PRIMARY KEY,
  [name] nvarchar(255),
  [inPrice] float,
  [outPrice] float,
  [stock] integer,
  [screenId] integer,
  [cpuId] integer,
  [ramId] integer,
  [ssdId] integer,
  [card] nvarchar(255),
  [releaseyear] date,
  [origin] nvarchar(255),
  [discount] float,
  [system] nvarchar(255),
  [weight] float,
  [manufacturerId] integer,
  [description] nvarchar(500)
)
GO

CREATE TABLE [screen] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [detail] varchar(255)
)
GO

CREATE TABLE [manufacturer] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [name] nvarchar(255)
)
GO

CREATE TABLE [ssd] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [detail] varchar(255)
)
GO

CREATE TABLE [ram] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [detail] varchar(255)
)
GO

CREATE TABLE [cpu] (
  [id] integer IDENTITY(1,1) PRIMARY KEY,
  [name] varchar(255)
)
GO

CREATE TABLE [images] (
  [href] varchar(255) PRIMARY KEY,
  [laptopId] integer
)
GO

CREATE TABLE [order] (
  [id] integer  IDENTITY(1,1) PRIMARY KEY,
  [customer] integer,
  [date] date,
  [status] nvarchar(255),
  [price] money,
  [address] integer
)
GO

CREATE TABLE [orderdetail] (
  [laptopId] integer,
  [orderId] integer,
  [quantity] integer,
  [price] money,
  PRIMARY KEY ([orderId])
)
GO

CREATE TABLE [accounts] (
  [id] integer  IDENTITY(1,1) PRIMARY KEY,
  [username] nvarchar(255),
  [password] nvarchar(255),
  [fullName] nvarchar(255),
  [phoneNumber] nvarchar(20),
  [email] nvarchar(255),
  [gender] nvarchar(255),
  [birthday] date,
  [image] nvarchar(255),
  [role] integer,
  [money] money
)
GO

CREATE TABLE [reviews] (
  [id] integer  IDENTITY(1,1) PRIMARY KEY,
  [customerId] integer,
  [laptopId] integer,
  [review] integer,
  [reviewDate] date,
  [details] text
)
GO

CREATE TABLE [customer_address] (
  [id] integer  IDENTITY(1,1) PRIMARY KEY,
  [customer] integer,
  [name] nvarchar(255),
  [phone] nvarchar(20),
  [address] nvarchar(255)
)
GO

ALTER TABLE [images] ADD FOREIGN KEY ([laptopId]) REFERENCES [Laptop] ([id])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([customer]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [reviews] ADD FOREIGN KEY ([customerId]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [customer_address] ADD FOREIGN KEY ([customer]) REFERENCES [accounts] ([id])
GO



ALTER TABLE [orderdetail] ADD FOREIGN KEY ([orderId]) REFERENCES [order] ([id])
GO





