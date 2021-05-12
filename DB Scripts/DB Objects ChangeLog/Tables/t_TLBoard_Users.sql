SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Encrypted_Password] [varchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Encryption_Random_Salt] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[App_Permission_Type_Id] [tinyint] NOT NULL,
	[First_Name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Middle_Name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last_Name] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Country_Id] [smallint] NOT NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Default_Currency_Id] [tinyint] NULL,
	[Mobile_Phone] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Additional_Phone_Number] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Birth_Date] [datetime] NULL,
	[Gender] [tinyint] NOT NULL,
	[Registration_DateTime_UTC] [datetime] NULL,
	[Heard_About_Application_From] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Our_Administrative_Side_Notes] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Deleted_By_User_Id] [int] NULL,
	[Deleted_DateTime_UTC] [datetime] NULL,
	[Delete_Reason] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Is_Active] [bit] NOT NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Azure_Container_Ref] [nvarchar](60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
