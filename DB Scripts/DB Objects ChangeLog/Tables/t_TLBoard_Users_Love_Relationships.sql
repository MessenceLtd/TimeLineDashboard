SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Users_Love_Relationships](
	[Love_Relationship_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Partner_Full_Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Partner_Mobile_Number] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Had_Sexual_Intercourse] [bit] NULL,
	[Relationship_Start_DateTime] [datetime] NULL,
	[Relationship_End_DateTime] [datetime] NULL,
	[Relationship_Type_Id] [smallint] NULL,
	[Relationship_Main_Country_Id] [smallint] NULL,
	[Relationship_Main_State_Id] [smallint] NULL,
	[Relationship_Main_City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Relationship_Main_Address] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Relationship_Main_ZipCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL
) ON [PRIMARY]
GO
