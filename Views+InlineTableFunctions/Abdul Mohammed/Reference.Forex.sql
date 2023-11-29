--Inline Tables Value Function
CREATE OR ALTER FUNCTION itv_dbo.GetForex
(@UserAuthorizationKey AS INT)
RETURNS TABLE
AS 
RETURN
(
	SELECT ExchangeDate, ISOCurrency, ExchangeRate, @UserAuthorizationKey AS UserKey
	FROM Reference.Forex
)

--View For Reference.Forex
CREATE OR ALTER VIEW [Reference].view_Forex
AS
SELECT *
FROM itv_dbo.GetForex(1)
GO