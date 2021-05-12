SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Users_Apartments](
	[User_Apartment_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ZipCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Telephone] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Lived_In_Apartment_From_DateTime] [datetime] NULL,
	[Lived_In_Apartment_To_DateTime] [datetime] NULL,
	[Lived_Alone] [bit] NULL,
	[Average_Monthly_Rent_Price_Amount] [decimal](12, 3) NULL,
	[Average_Monthly_Rent_Price_Currency_Id] [decimal](12, 3) NULL,
	[House_Owner_Full_Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[House_Owner_Mobile_Phone] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[House_Owner_Email_Address] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
