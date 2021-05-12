SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Countries_Currencies](
	[Country_Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency_Name_Desc] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency_Code] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency_Number] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
