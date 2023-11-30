USE [PrestigeCars]
GO

/****** Object:  Table [Data].[Stock]    Script Date: 11/29/2023 7:11:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Data].[StockOld](
	[StockCode] [NVARCHAR](50) NULL,
	[ModelID] [SMALLINT] NULL,
	[Cost] [MONEY] NULL,
	[RepairsCost] [MONEY] NULL,
	[PartsCost] [MONEY] NULL,
	[TransportInCost] [MONEY] NULL,
	[IsRHD] [BIT] NULL,
	[Color] [NVARCHAR](50) NULL,
	[BuyerComments] [NVARCHAR](4000) NULL,
	[DateBought] [DATE] NULL,
	[TimeBought] [TIME](7) NULL
) ON [PRIMARY]
GO

INSERT INTO Data.StockOld(BuyerComments,
                          Color,
                          Cost,
                          DateBought,
                          IsRHD,
                          ModelID,
                          PartsCost,
                          RepairsCost,
                          StockCode,
                          TimeBought,
                          TransportInCost	)
SELECT 
BuyerComments,
                          Color,
                          Cost,
                          DateBought,
                          IsRHD,
                          ModelID,
                          PartsCost,
                          RepairsCost,
                          StockCode,
                          TimeBought,
                          TransportInCost	
FROM DATA.Stock

INSERT INTO Data.Cars(ColorId,RepairsCost,PartsCost,ModelId,TransportInCost)
SELECT
DISTINCT C.ColorId, So.RepairsCost,So.PartsCost,So.ModelID,SO.TransportInCost
FROM Data.StockOld AS SO
INNER JOIN Data.Color AS C ON  SO.Color= C.Color

SELECT * FROM DATA.Cars

INSERT INTO Data.Stock(StockCode,BuyerComments,DateBought,TimeBought,Cost,IsRHD,CarsId)
SELECT 
	DISTINCT 
		SO.StockCode,
		SO.BuyerComments,
		SO.DateBought,
		SO.TimeBought,
		SO.Cost,
		SO.IsRHD,
		C.CarsId
FROM Data.StockOld AS SO
INNER JOIN  Data.Cars AS C ON SO.ModelId = C.ModelId AND SO.RepairsCost = C.RepairsCost AND SO.PartsCost=C.PartsCost AND SO.TransportInCost = C.TransportInCost 
