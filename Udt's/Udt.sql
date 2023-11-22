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