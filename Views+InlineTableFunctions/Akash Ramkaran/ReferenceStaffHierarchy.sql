CREATE VIEW [Reference].[Staff1_1view]
AS
SELECT 
	[HierarchyReference], 
	[StaffID], 
	[StaffName],
	[ManagerID],
	[Department]
FROM Reference.StaffHierarchy
GO


CREATE FUNCTION [Reference].[Staff1_SHIVTF] ()
RETURNS TABLE 
AS
RETURN 
(
    SELECT * 
    FROM Reference.StaffHierarchy
)
GO



Select * From [Reference].[Staff1_1view]