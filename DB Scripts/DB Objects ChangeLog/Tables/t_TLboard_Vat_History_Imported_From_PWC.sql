SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLboard_Vat_History_Imported_From_PWC](
	[vat_Country_Desc] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vat] [decimal](6, 3) NULL,
	[countryName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[synced] [bit] NULL
) ON [PRIMARY]
GO
