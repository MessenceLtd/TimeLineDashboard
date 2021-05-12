SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLboard_Vat_History_Imported_From_PWC](
	[vat_Country_Desc] [nvarchar](200) NULL,
	[vat] [decimal](6, 3) NULL,
	[countryName] [nvarchar](50) NULL,
	[synced] [bit] NULL
) ON [PRIMARY]
GO
