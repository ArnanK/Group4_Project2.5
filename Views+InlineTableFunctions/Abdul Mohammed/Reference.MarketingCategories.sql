--Inline Tables Value Function
CREATE OR ALTER FUNCTION itv_dbo.GetMarketingCategories
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT MakeName, MarketingType, @UserAuthorizationKey AS UserKey
	FROM Reference.MarketingCategories
)

--View For Reference.Forex
CREATE OR ALTER VIEW [Reference].view_MarketingCategories
AS
SELECT *
FROM itv_dbo.GetMarketingCategories(1)
GO