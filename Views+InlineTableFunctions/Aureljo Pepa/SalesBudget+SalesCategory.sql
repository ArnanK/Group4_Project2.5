USE [PrestigeCars]
go
--Inline Table for Reference.SalesBudgets
CREATE OR ALTER FUNCTION itv_dbo.GetSalesBudgets
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS
RETURN 
(
	SELECT *, @UserAuthorizationKey AS UserKey
	FROM Reference.SalesBudgets
)
GO
-- View 
CREATE OR ALTER VIEW Reference.view_SalesBudgets 
AS 
SELECT *
FROM itv_dbo.GetSalesBudgets(3)
GO


--Inline table for Reference.SalesCategory
CREATE OR ALTER FUNCTION itv_dbo.GetSalesCategory
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS
RETURN 
(
	SELECT *, @UserAuthorizationKey AS UserKey
	FROM Reference.SalesCategory
)
GO
-- View for SalesCategories
CREATE OR ALTER VIEW Reference.view_SalesCategory
AS 
SELECT *
FROM itv_dbo.GetSalesCategory(3)
GO