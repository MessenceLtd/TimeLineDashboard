SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Countries](
	[Country_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Country_Code] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Country_English_Name] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Country_Native_Name] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Primary_Currency_Id] [tinyint] NULL,
	[Continent_Id] [tinyint] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL
) ON [PRIMARY]
GO
