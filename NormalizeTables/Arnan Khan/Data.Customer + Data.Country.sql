USE PrestigeCars

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SalesRegion Table
CREATE TABLE [Data].[SalesRegion](
	[SalesRegionId] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[SalesRegion] [Udt].[SalesRegion] NOT NULL,
 CONSTRAINT [PK_SalesRegion] PRIMARY KEY CLUSTERED 
(
	[SalesRegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Country Table
CREATE TABLE [Data].[CountryFlag](
	[CountryFlagId] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[CountryFlag] [Udt].[CountryFlag] NULL,
	[FlagFileName] [Udt].[FlagFileName] NULL,
	[FlagFileType] [Udt].[FlagFileType] NULL,
 CONSTRAINT [PK_CountryFlag] PRIMARY KEY CLUSTERED 
(
	[CountryFlagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Country Table
CREATE TABLE [Data].[Country](
	[CountryId] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[CountryName] [Udt].[CountryName] NOT NULL,
	[CountryISO2] [Udt].[ISO2] NOT NULL,
	[CountryISO3] [Udt].[ISO3] NOT NULL,
	[SalesRegionId] [Udt].[SurrogateKeyInt] NOT NULL,
	[CountryFlagId] [Udt].[SurrogateKeyInt] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

--Alter FK and additional contstraints 
ALTER TABLE [Data].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_SalesRegion] FOREIGN KEY([SalesRegionId])
REFERENCES [Data].[SalesRegion] ([SalesRegionId])
GO
ALTER TABLE [Data].[Country] CHECK CONSTRAINT [FK_Country_SalesRegion]
GO
ALTER TABLE[Data].Country WITH CHECK ADD CONSTRAINT [FK_Country_CountryFlag] FOREIGN KEY([CountryFlagId])
REFERENCES [Data].[CountryFlag] ([CountryFlagId])
GO
ALTER TABLE [Data].[Country] CHECK CONSTRAINT [FK_Country_CountryFlag]
GO
ALTER TABLE [Data].[Country]  WITH CHECK ADD  CONSTRAINT [CK_CountryISO2] CHECK  ((len([CountryISO2])=(2)))
GO
ALTER TABLE [Data].[Country] CHECK CONSTRAINT [CK_CountryISO2]
GO
ALTER TABLE [Data].[Country]  WITH CHECK ADD  CONSTRAINT [CK_CountryISo3] CHECK  ((len([CountryISO3])=(3)))
GO
ALTER TABLE [Data].[Country] CHECK CONSTRAINT [CK_CountryISo3]
GO

--------------------------------------------------------------------------------------------------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CustomerAddress Table
CREATE TABLE [Data].[CustomerAddress]
(
	[AddressKey] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[Address1] [Udt].[AddressType] NULL,
	[Address2] [Udt].[AddressType] NULL,
	[Town] [Udt].[AddressType] NULL,
	[PostCode] [Udt].[AddressType] NULL,
	[CountryId] [Udt].[SurrogateKeyInt] NOT NULL,

	CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED 
(
	[AddressKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- CustomerStatus Table
CREATE TABLE [Data].[CustomerStatus]
(
	[CustomerStatusId] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[isReseller] [Udt].[isBool] NULL,
	[isCreditRisk] [Udt].[isBool] NULL,
	CONSTRAINT [PK_CustomerStatus] PRIMARY KEY CLUSTERED 
(
	[CustomerStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [Data].[Customer]    Script Date: 11/22/2023 2:23:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Customer Table
CREATE TABLE [Data].[Customer](
	[CustomerID] [Udt].[SurrogateKeyInt] IDENTITY(1,1) NOT NULL,
	[CustomerName] [Udt].[CustName]NULL,
	[AddressKey] [Udt].[SurrogateKeyInt] NOT NULL,
	[CustomerStatusId] [Udt].[SurrogateKeyInt] NOT NULL,
CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Data].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address] FOREIGN KEY([AddressKey])
REFERENCES [Data].[CustomerAddress] ([AddressKey])
GO
ALTER TABLE [Data].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Status] FOREIGN KEY([CustomerStatusId])
REFERENCES [Data].[CustomerStatus] ([CustomerStatusId])
GO
ALTER TABLE [Data].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddress_Country] FOREIGN KEY([CountryId])
REFERENCES [Data].[Country] ([CountryId])
GO


