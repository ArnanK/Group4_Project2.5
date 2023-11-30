USE [PrestigeCars]
GO

/****** Object:  Table [Data].[MakeOld]    Script Date: 11/29/2023 8:56:54 PM ******/

--New Data.Make table created
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Data].[OldMake](
	[MakeID] [SMALLINT]  NOT NULL,
	[MakeName] [NVARCHAR](100) NULL,
	[MakeCountry] [CHAR](3) NULL
) ON [PRIMARY]
GO

INSERT INTO Data.OldMake(MakeID,MakeName,MakeCountry)
SELECT MakeID,MakeName,MakeCountry
FROM Data.Make

DROP TABLE IF EXISTS [Data].[Make]
CREATE TABLE [Data].[Make](
	[MakeID] [Udt].[SurrogateKeyInt] IDENTITY (1,1) NOT NULL,
	[MakeName] [Udt].[CustName] NOT NULL,
	[MakeCountry] [Udt].[ISO3] NOT NULL,
 CONSTRAINT [PK_Make] PRIMARY KEY CLUSTERED 
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--Insert Data from Data.MakeOld joined with inner join to Data.Make
INSERT INTO Data.Make(MakeName, MakeCountry)
SELECT  d.MakeName, d.makeCountry
FROM Data.OldMake as d
inner join Data.Country as c on c.CountryISO3=d.MakeCountry;



