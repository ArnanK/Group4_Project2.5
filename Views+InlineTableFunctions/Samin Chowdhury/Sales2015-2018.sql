SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM   DataTransfer.view_Sales2015


SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM   DataTransfer.view_Sales2016


SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM   DataTransfer.view_Sales2017


SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate
FROM   DataTransfer.view_Sales2018



--Inline Tables Value Function for Sales2015

CREATE OR ALTER FUNCTION dbo.getSales2015
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate, @UserAuthorizationKey AS UserKey
	FROM DataTransfer.Sales2015
)

--View For Output.StockPrices
CREATE OR ALTER VIEW [DataTransfer].view_Sales2015
AS
SELECT *
FROM dbo.getSales2015(2)
GO
--Inline Tables Value Function for Sales2016

CREATE OR ALTER FUNCTION dbo.getSales2016
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate, 
	@UserAuthorizationKey AS UserKey
	FROM DataTransfer.Sales2016
)
--View For Output.StockPrices
CREATE OR ALTER VIEW [DataTransfer].view_Sales2016
AS
SELECT *
FROM dbo.getSales2015(2)
GO

--Inline Tables Value Function for Sales2017

CREATE OR ALTER FUNCTION dbo.getSales2017
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate, 
	@UserAuthorizationKey AS UserKey
	FROM DataTransfer.Sales2017
)
--View For Output.StockPrices
CREATE OR ALTER VIEW [DataTransfer].view_Sales2017
AS
SELECT *
FROM dbo.getSales2015(2)
GO

--Inline Tables Value Function for Sales2018

CREATE OR ALTER FUNCTION dbo.getSales2018
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT MakeName, ModelName, CustomerName, CountryName, Cost, RepairsCost, PartsCost, TransportInCost, SalePrice, SaleDate, 
	@UserAuthorizationKey AS UserKey
	FROM DataTransfer.Sales2018
)
--View For Output.StockPrices
CREATE OR ALTER VIEW [DataTransfer].view_Sales2018
AS
SELECT *
FROM dbo.getSales2015(2)
GO

