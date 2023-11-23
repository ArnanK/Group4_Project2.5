--Inline Tables Value Function
CREATE OR ALTER FUNCTION itv_dbo.GetStockPrices
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT MakeName,ModelName,Cost, @UserAuthorizationKey AS UserKey
	FROM [Output].StockPrices
)

--View For Output.StockPrices
CREATE OR ALTER VIEW [Output].view_StockPrices
AS
SELECT *
FROM itv_dbo.GetStockPrices(1)
GO
-------------------------------------------------------------------------------------
--Inline Tables Value Function
CREATE OR ALTER FUNCTION itv_dbo.GetBudget
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT BudgetKey,BudgetValue,[Year],[Month],BudgetDetail,BudgetElement, @UserAuthorizationKey AS UserKey
	FROM Reference.Budget
)

--View For Output.StockPrices
CREATE OR ALTER VIEW [Reference].view_Budget
AS
SELECT *
FROM itv_dbo.GetBudget(1)
GO

