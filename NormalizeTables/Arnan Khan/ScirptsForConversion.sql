USE [PrestigeCars]
GO

/****** Object:  Table [Data].[CountryTest]    Script Date: 11/22/2023 2:59:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Data].[CountryTest](
	[CountryName] [NVARCHAR](150) NULL,
	[CountryISO2] [NCHAR](10) NULL,
	[CountryISO3] [NCHAR](10) NULL,
	[SalesRegion] [NVARCHAR](20) NULL,
	[CountryFlag] [VARBINARY](MAX) NULL,
	[FlagFileName] [NVARCHAR](50) NULL,
	[FlagFileType] [NCHAR](3) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

INSERT INTO Data.CountryTest(CountryName,CountryISO2,CountryISO3,SalesRegion,CountryFlag,FlagFileName,FlagFileType)
SELECT
DISTINCT
CountryName,CountryISO2,CountryISO3,SalesRegion,CountryFlag,FlagFileName,FlagFileType
FROM Data.Country

--Delete Data.Country and create the new one in the scripts.

INSERT INTO Data.SalesRegion(SalesRegion)
SELECT
DISTINCT
SalesRegion
FROM Data.CountryTest

INSERT INTO Data.Country(CountryFlag, FlagFileName,FlagFileType)
SELECT
DISTINCT
CountryFlag,FlagFileName,FlagFileType
FROM Data.CountryTest


INSERT INTO Data.Country(CountryName,CountryISO2,CountryISO3,SalesRegionId,CountryFlagId)
SELECT
DISTINCT
CT.CountryName,
CT.CountryISO2,
CT.CountryISO3,
SR.SalesRegionId,
1
FROM Data.CountryTest AS CT
INNER JOIN Data.SalesRegion AS SR ON CT.SalesRegion = SR.SalesRegion

--------------------------------------------------------------------------------------------------------------------------



SELECT *
FROM Data.CustomerTest
SELECT * 
FROM Data.CustomerStatus
SELECT * FROM DATA.Country

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
