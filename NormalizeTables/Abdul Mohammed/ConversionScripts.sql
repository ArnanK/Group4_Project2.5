USE [PrestigeCars]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS Data.PivotTableOld
CREATE TABLE [Data].[PivotTableOld](
	[Color] [NVARCHAR](50) NULL,
	[2015] [numeric](38,2) NULL,
	[2016] [numeric](38,2) NULL,
	[2017] [numeric](38,2) NULL,
	[2018] [numeric](38,2) NULL,
) ON [PRIMARY]
GO

INSERT INTO Data.PivotTableOld(Color,[2015],[2016],[2017],[2018])
SELECT
DISTINCT
[Color],[2015],[2016],[2017],[2018]
FROM Data.PivotTable



INSERT INTO [Data].[Color] ([Color])
SELECT DISTINCT 
[Color]
FROM [Data].[PivotTableOld]


INSERT INTO Data.PivotTable([ColorID],[2015],[2016],[2017],[2018])
SELECT
DISTINCT
    [ColorID], [2015],[2016],[2017],[2018]
FROM Data.PivotTableOld AS CT
INNER JOIN Data.Color AS SR ON CT.Color = SR.Color

--------------------------------------------------------------------------------------------------------------------------