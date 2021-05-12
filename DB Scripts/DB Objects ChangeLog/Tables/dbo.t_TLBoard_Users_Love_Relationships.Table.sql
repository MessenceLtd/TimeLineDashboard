SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Users_Love_Relationships](
	[Love_Relationship_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Partner_Full_Name] [nvarchar](100) NULL,
	[Partner_Mobile_Number] [varchar](20) NULL,
	[Had_Sexual_Intercourse] [bit] NULL,
	[Relationship_Start_DateTime] [datetime] NULL,
	[Relationship_End_DateTime] [datetime] NULL,
	[Relationship_Type_Id] [smallint] NULL,
	[Relationship_Main_Country_Id] [smallint] NULL,
	[Relationship_Main_State_Id] [smallint] NULL,
	[Relationship_Main_City] [nvarchar](100) NULL,
	[Relationship_Main_Address] [nvarchar](150) NULL,
	[Relationship_Main_ZipCode] [varchar](10) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Users_Love_Relationships] PRIMARY KEY CLUSTERED 
(
	[Love_Relationship_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Users_Love_Relationships] ADD  CONSTRAINT [DF_t_TLBoard_Users_Love_Relationships_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Users_Love_Relationships] ADD  CONSTRAINT [DF_t_TLBoard_Users_Love_Relationships_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
