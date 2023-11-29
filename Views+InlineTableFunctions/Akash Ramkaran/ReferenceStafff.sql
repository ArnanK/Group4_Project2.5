CREATE VIEW [Reference].[Staff_View]
AS
SELECT 
    [StaffID], 
    [StaffName],
    [ManagerID], 
    [Department]
FROM Reference.Staff
GO


CREATE FUNCTION [Reference].[Staff_IVTF] ()
RETURNS TABLE 
AS
RETURN 
(
    SELECT * 
    FROM Reference.Staff
)
GO




Select     * From [Reference].[Staff_View]