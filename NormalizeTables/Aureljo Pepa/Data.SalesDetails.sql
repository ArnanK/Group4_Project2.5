USE [PrestigeCars]
GO 
--Create Copy of Old table-- 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE TABLE [Data].[SalesDetailsOld](
	[SalesDetailsID] [INT] NULL,
	[SalesID] [INT] NULL,
	[LineItemNumber] [Tinyint] NULL, 
	[StockID] [nvarchar](50) NULL,
	[SalePrice] [numeric](18,2) NULL,
	[LineItemDiscount] [numeric](18,2) NULL
) ON [PRIMARY] 
GO 
INSERT INTO Data.SalesDetailsOld(SalesDetailsID,SalesID,LineItemNumber,StockID,SalePrice,LineItemDiscount) 
SELECT 
DISTINCT 
SalesDetailsID,SalesID,LineItemNumber,StockID,SalePrice,LineItemDiscount
FROM Data.SalesDetails

--Delete Data.SalesDetails and create new one: 

INSERT INTO Data.SalesDetails(SalesID,LineItemNumber,StockID,SalePrice,LineItemDiscount) 
SELECT DISTINCT 
S.SalesID,
SL.LineItemNumber, 
ST.StockID,
SL.SalePrice,
SL.LineItemDiscount
FROM Data.SalesDetailsOld as SL 
INNER JOIN Data.Sales AS S ON SL.SalesId = S.SalesId
INNER JOIN Data.Stock AS ST ON ST.StockCode=SL.StockID


--Normalizing Data.SalesDetails-- 
Set ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [Data].[SalesDetails]
CREATE TABLE [Data].[SalesDetails](
    [SalesDetailsID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[SalesID] [Udt].[SurrogateKeyInt] NOT NULL,
	[LineItemNumber] [Udt].[LineNum] NOT NULL,
	[StockID] [Udt].[SurrogateKeyInt] NOT NULL, 
	[SalePrice] [Udt].[TotalPrice] NOT NULL,
	[LineItemDiscount] [Udt].[TotalPrice]
CONSTRAINT [PK_SalesDetails] PRIMARY KEY CLUSTERED
(
	[SalesDetailsID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [Data].[SalesDetails] WITH CHECK ADD CONSTRAINT [FK_SalesID] FOREIGN KEY ([SalesID])
REFERENCES [Data].[Sales] ([SalesId])
GO 
ALTER TABLE [Data].[SalesDetails] CHECK CONSTRAINT [FK_SalesID] 
GO
ALTER TABLE [Data].[SalesDetails] WITH CHECK ADD CONSTRAINT [FK_StockID] FOREIGN KEY ([StockID])
REFERENCES [Data].[Stock] ([StockID])
GO 
ALTER TABLE [Data].[SalesDetails] CHECK CONSTRAINT [FK_StockID] 
GO


--UDTS 
IF NOT EXISTS (SELECT 1 FROM sys.types WHERE name = 'LineNum' AND schema_id = SCHEMA_ID('Udt'))
BEGIN
    CREATE TYPE [Udt].[LineNum] FROM [tinyint] NULL
END

