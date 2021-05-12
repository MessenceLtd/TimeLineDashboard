SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Clients](
	[Client_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Company_Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Website_URL] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Default_Currency_Id] [tinyint] NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Telephone] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Mobile_Phone] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Client_Type_Id] [smallint] NULL,
	[Client_Tax_Reference_Number] [nvarchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Main_Contact_FullName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Main_Contact_Email_Address] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Main_Contact_Phone_Number] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Client_From_Date] [datetime] NULL,
	[Client_To_Date] [datetime] NULL,
	[First_Contract_Date] [datetime] NULL,
	[First_Contract_Signed_With_Contact_Full_Name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[First_Contract_Signed_In_Location_Description] [nvarchar](400) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NOT NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL
) ON [PRIMARY]
GO
