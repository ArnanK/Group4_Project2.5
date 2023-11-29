USE [PrestigeCars]
GO

/****** Object:  Table [Data].[CountryTest]    Script Date: 11/22/2023 2:59:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Data].[CountryOld](
	[CountryName] [NVARCHAR](150) NULL,
	[CountryISO2] [NCHAR](10) NULL,
	[CountryISO3] [NCHAR](10) NULL,
	[SalesRegion] [NVARCHAR](20) NULL,
	[CountryFlag] [VARBINARY](MAX) NULL,
	[FlagFileName] [NVARCHAR](50) NULL,
	[FlagFileType] [NCHAR](3) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


INSERT INTO Data.CountryOld(CountryName,CountryISO2,CountryISO3,SalesRegion,CountryFlag,FlagFileName,FlagFileType)
SELECT
DISTINCT
CountryName,CountryISO2,CountryISO3,SalesRegion,CountryFlag,FlagFileName,FlagFileType
FROM Data.Country

--Delete Data.Country and create the new one in the scripts.

INSERT INTO Data.SalesRegion(SalesRegion)
SELECT
DISTINCT
SalesRegion
FROM Data.CountryOld

INSERT INTO Data.CountryFlag(CountryFlag, FlagFileName,FlagFileType)
SELECT
DISTINCT
CountryFlag,FlagFileName,FlagFileType
FROM Data.CountryOld


INSERT INTO Data.Country(CountryName,CountryISO2,CountryISO3,SalesRegionId,CountryFlagId)
SELECT
DISTINCT
CT.CountryName,
CT.CountryISO2,
CT.CountryISO3,
SR.SalesRegionId,
1
FROM Data.CountryOld AS CT
INNER JOIN Data.SalesRegion AS SR ON CT.SalesRegion = SR.SalesRegion

--------------------------------------------------------------------------------------------------------------------------
USE [PrestigeCars]
GO

/****** Object:  Table [Data].[CustomerOld]    Script Date: 11/27/2023 8:35:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Data].[CustomerOld](
	[CustomerID] [NVARCHAR](5) NOT NULL,
	[CustomerName] [NVARCHAR](150) NULL,
	[Address1] [NVARCHAR](50) NULL,
	[Address2] [NVARCHAR](50) NULL,
	[Town] [NVARCHAR](50) NULL,
	[PostCode] [NVARCHAR](50) NULL,
	[Country] [NCHAR](10) NULL,
	[IsReseller] [BIT] NULL,
	[IsCreditRisk] [BIT] NULL
) ON [PRIMARY]
GO

INSERT INTO Data.[CustomerOld] (CustomerId, CustomerName,Address1,Address2,Town,PostCode,Country,IsReseller,IsCreditRisk)
SELECT CustomerId, CustomerName,Address1,Address2,Town,PostCode,Country,IsReseller,IsCreditRisk FROM Data.Customer

--DELETE DATA.CUSTOMER TABLE

INSERT INTO Data.CustomerAddress(Address1,Address2,Town,PostCode,CountryId)
SELECT DISTINCT
CT.Address1,
CT.Address2,
CT.Town,
CT.PostCode,
C.CountryId
FROM Data.CustomerTest AS CT
INNER JOIN Data.Country AS C ON CT.Country = C.CountryISO2

INSERT INTO Data.CustomerStatus(isReseller, isCreditRisk)
SELECT 
isReseller,
isCreditRisk
FROM Data.CustomerTest

INSERT INTO Data.Customer(CustomerName,AddressKey,CustomerStatusId)
SELECT 
CT.CustomerName,
CA.AddressKey,
ROW_NUMBER() OVER (ORDER BY CT.CustomerName) AS CustomerStatusId
FROM Data.CustomerTest AS CT
INNER JOIN Data.CustomerAddress AS CA
ON CT.Address1=CA.Address1 AND CT.Town = CA.Town
