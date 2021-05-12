SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Countries](
	[Country_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Country_Code] [varchar](10) NOT NULL,
	[Country_English_Name] [nvarchar](80) NOT NULL,
	[Country_Native_Name] [nvarchar](80) NULL,
	[Primary_Currency_Id] [tinyint] NULL,
	[Continent_Id] [tinyint] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_t_TLBoard_Countries] PRIMARY KEY CLUSTERED 
(
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Countries] ADD  CONSTRAINT [DF_t_TLBoard_Countries_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Countries] ADD  CONSTRAINT [DF_t_TLBoard_Countries_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
