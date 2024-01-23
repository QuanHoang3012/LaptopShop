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
  [id] integer  IDENTITY(1,1)  PRIMARY KEY,
  [name] nvarchar(255),
  [inPrice] money,
  [outPrice] money,
  [stock] integer,
  [screenId] integer,
  [cpuId] integer,
  [ramId] integer,
  [ssdId] integer,
  [card] nvarchar(255),
  [releaseyear] date,
  [origin] nvarchar(255),
  [discount] money,
  [system] nvarchar(255),
  [weight] float,
  [manufacturerId] integer
)
GO

CREATE TABLE [manufacturer] (
  [id] integer PRIMARY KEY,
  [name] nvarchar(255)
)
GO
CREATE TABLE [screen] (
  [id] integer,
  [detail] varchar(255)
)
CREATE TABLE [ssd] (
  [id] integer PRIMARY KEY,
  [detail] varchar(255)
)
GO

CREATE TABLE [ram] (
  [id] integer PRIMARY KEY,
  [detail] varchar(255)
)
GO

CREATE TABLE [cpu] (
  [id] integer PRIMARY KEY,
  [name] varchar(255)
)
GO

CREATE TABLE [images] (
  [href] varchar(255) PRIMARY KEY,
  [laptopId] integer
)
GO

CREATE TABLE [order] (
  [id] integer   IDENTITY(1,1) PRIMARY KEY,
  [customer] integer,
  [created] date,
  [status] nvarchar(255),
  [discountId] integer
)
GO

CREATE TABLE [orderDetails] (
  [laptopId] integer,
  [orderId] integer,
  [amount] integer,
  PRIMARY KEY ([laptopId], [orderId])
)
GO

CREATE TABLE [accounts] (
  [id] integer  IDENTITY(1,1) PRIMARY KEY,
  [username] nvarchar(255),
  [password] nvarchar(255),
  [fullName] nvarchar(255),
  [phoneNnumber] nvarchar(20),
  [email] nvarchar(255),
  [gender] nvarchar(255),
  [birthday] date,
  [image] nvarchar(255),
  [role] integer
)
GO

CREATE TABLE [reviews] (
  [id] integer   IDENTITY(1,1)  PRIMARY KEY,
  [customerId] integer,
  [laptopId] integer,
  [review] integer,
  [reviewDate] date,
  [details] text
)
GO

CREATE TABLE [discounts] (
  [id] integer  IDENTITY(1,1)  PRIMARY KEY,
  [code] nvarchar(255),
  [value] money
)
GO

CREATE TABLE [customer_discounts] (
  [customer] integer,
  [discountId] integer,
  PRIMARY KEY ([customer], [discountId])
)
GO

CREATE TABLE [customer_address] (
  [id] integer  IDENTITY(1,1)  PRIMARY KEY,
  [customer] integer,
  [streetNumber] integer,
  [streetName] nvarchar(255),
  [city] nvarchar(255),
  [country] nvarchar(255)
)
GO

CREATE TABLE [country] (
  [name] nvarchar(255) PRIMARY KEY
)
GO

ALTER TABLE [images] ADD FOREIGN KEY ([laptopId]) REFERENCES [Laptop] ([id])
GO

ALTER TABLE [orderDetails] ADD FOREIGN KEY ([orderId]) REFERENCES [order] ([id])
GO

ALTER TABLE [orderDetails] ADD FOREIGN KEY ([laptopId]) REFERENCES [Laptop] ([id])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([customer]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [reviews] ADD FOREIGN KEY ([customerId]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [customer_discounts] ADD FOREIGN KEY ([customer]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [customer_discounts] ADD FOREIGN KEY ([discountId]) REFERENCES [discounts] ([id])
GO

ALTER TABLE [customer_address] ADD FOREIGN KEY ([customer]) REFERENCES [accounts] ([id])
GO

ALTER TABLE [customer_address] ADD FOREIGN KEY ([country]) REFERENCES [country] ([name])
GO

ALTER TABLE [Laptop] ADD FOREIGN KEY ([manufacturerId]) REFERENCES [manufacturer] ([id])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([discountId]) REFERENCES [discounts] ([id])
GO

ALTER TABLE [reviews] ADD FOREIGN KEY ([laptopId]) REFERENCES [Laptop] ([id])
GO

ALTER TABLE [Laptop] ADD FOREIGN KEY ([cpuId]) REFERENCES [cpu] ([id])
GO

ALTER TABLE [Laptop] ADD FOREIGN KEY ([ramId]) REFERENCES [ram] ([id])
GO

ALTER TABLE [Laptop] ADD FOREIGN KEY ([ssdId]) REFERENCES [ssd] ([id])
GO
