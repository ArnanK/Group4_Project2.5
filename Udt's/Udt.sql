USE [PrestigeCars]
GO

-- Check if [Udt] schema exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Udt')
BEGIN
    EXEC('CREATE SCHEMA [Udt]')
END

-- Check if [Utils] schema exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'Utils')
BEGIN
    EXEC('CREATE SCHEMA [Utils]')
END

-- Check if [CountryName] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'CountryName' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[CountryName] FROM [nvarchar](15) NOT NULL
END

-- Check if [ISO2] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'ISO2' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[ISO2] FROM [nchar](2) NULL
END

-- Check if [ISO3] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'ISO3' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[ISO3] FROM [nchar](3) NULL
END

-- Check if [SalesRegion] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'SalesRegion' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[SalesRegion] FROM [NVARCHAR](15) NULL
END

-- Check if [SurrogateKeyInt] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'SurrogateKeyInt' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[SurrogateKeyInt] FROM [INT] NULL
END

-- Check if [AddressType] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'AddressType' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[AddressType] FROM [NVARCHAR](50) NULL
END
-- Check if [CountryFlag] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'CountryFlag' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[CountryFlag] FROM VARBINARY(MAX) NULL
END
-- Check if [FlagFileName] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'FlagFileName' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[FlagFileName] FROM [NVARCHAR](50) NULL
END
-- Check if [isBool] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'isBool' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[isBool] FROM bit NULL
END-- Check if [CustName] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'CustName' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[CustName] FROM NVARCHAR(150) NULL
END


--Data.PivotTable UDTs
--*******************************************************
-- Check if [Color] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'Color' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[Color] FROM [NVARCHAR](50) NULL
END

-- Check if [Year2015] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'Year2015' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[Year2015] FROM [NUMERIC](38,2) NULL
END

-- Check if [Year2016] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'Year2016' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[Year2016] FROM [NUMERIC](38,2) NULL
END

-- Check if [Year2017] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'Year2017' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[Year2017] FROM [NUMERIC](38,2) NULL
END

-- Check if [Year2018] type exists before creating
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'Year2018' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[Year2018] FROM [NUMERIC](38,2) NULL
END
------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'StockCode' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[StockCode] FROM [nvarchar](50) NOT NULL
END


IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'Cost' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[Cost] FROM money NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'RepairsCost' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[RepairsCost] FROM money NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'PartsCost' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[PartsCost] FROM money NULL
END
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'TransportInCost' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[TransportInCost] FROM money NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'Color' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[Color] FROM nvarchar(50) NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'BuyerComments' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[BuyerComments] FROM NVARCHAR(4000) NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'DateBought' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[DateBought] FROM date NULL
END

IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'TimeBought' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[TimeBought] FROM time NULL
END
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'ModelId' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[ModelId] FROM smallint NULL
END