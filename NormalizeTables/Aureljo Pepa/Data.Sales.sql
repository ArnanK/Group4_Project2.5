USE [PrestigeCars]
GO 
--Create Copy of Old table-- 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE TABLE [Data].[SalesOld](
	[SalesID] [INT] NULL,
	[CustomerID] [NVARCHAR](5) NULL,
	[InvoiceNumber] [CHAR](8) NULL, 
	[TotalSalePrice] [Numeric](18,2) NULL,
	[SaleDate] [DATETIME] NULL,
	[ID] [INT] NULL
) ON [PRIMARY] 
GO 
INSERT INTO Data.SalesOld(SalesID,CustomerID,InvoiceNumber,TotalSalePrice,SaleDate,ID) 
SELECT 
DISTINCT 
SalesID, CustomerID, InvoiceNumber, TotalSalePrice,SaleDate, ID 
FROM Data.Sales 
--Delete Data.Sales and create new one: 

INSERT INTO Data.Sales( CustomerID, InvoiceNumber, TotalSalePrice,SaleDate) 
SELECT DISTINCT 
C.CustomerID,
SL.InvoiceNumber, 
SL.TotalSalePrice,
SL.SaleDate
FROM Data.SalesOld as SL 
Inner Join Data.Customer as C ON SL.CustomerID = C.CustomerID

--Normalizing Data.Sales-- 
Set ANSI_NULLS ON
GO 

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [Data].[Sales]
CREATE TABLE [Data].[Sales](
    [SalesID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[CustomerID] [Udt].[SurrogateKeyInt] NOT NULL,
	[InvoiceNumber] [Udt].[InvNum] NOT NULL,
	[TotalSalePrice] [Udt].[TotalPrice] NOT NULL, 
	[SaleDate] [Udt].[dte] NOT NULL, 
CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED
(
	[SalesID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Altering Foreign Keys and constraints 
ALTER TABLE [Data].[Sales] WITH CHECK ADD CONSTRAINT [FK_CustomerID] FOREIGN KEY ([CustomerID])
REFERENCES [Data].[Customer] ([CustomerID])
GO 
ALTER TABLE [Data].[Sales] CHECK CONSTRAINT [FK_CustomerID] 
GO
ALTER TABLE [Data].[Sales] WITH CHECK ADD CONSTRAINT [CK_SalesID] CHECK ((len([CustomerID])<=(5))) 
GO
ALTER TABLE [Data].[Sales] WITH CHECK ADD CONSTRAINT [CK_InvNum] CHECK ((len([InvoiceNumber])<=(8))) 
GO
ALTER TABLE [Data].[Sales] WITH CHECK ADD CONSTRAINT [CK_TotalSalePrice] CHECK ((len([TotalSalePrice])<=(8))) 
GO

