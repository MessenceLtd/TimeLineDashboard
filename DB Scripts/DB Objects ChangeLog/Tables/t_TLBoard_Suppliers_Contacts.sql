SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Suppliers_Contacts](
	[Supplier_Contact_Id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Id] [int] NULL,
	[First_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Middle_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Last_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email_Address] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mobile_Phone] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Title] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Telephone] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_Comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
