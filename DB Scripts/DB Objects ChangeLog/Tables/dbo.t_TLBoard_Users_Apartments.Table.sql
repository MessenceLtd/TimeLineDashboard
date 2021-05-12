SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Users_Apartments](
	[User_Apartment_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Telephone] [varchar](40) NULL,
	[Lived_In_Apartment_From_DateTime] [datetime] NULL,
	[Lived_In_Apartment_To_DateTime] [datetime] NULL,
	[Lived_Alone] [bit] NULL,
	[Average_Monthly_Rent_Price_Amount] [decimal](12, 3) NULL,
	[Average_Monthly_Rent_Price_Currency_Id] [decimal](12, 3) NULL,
	[House_Owner_Full_Name] [nvarchar](100) NULL,
	[House_Owner_Mobile_Phone] [varchar](20) NULL,
	[House_Owner_Email_Address] [nvarchar](100) NULL,
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
 CONSTRAINT [PK_t_TLBoard_User_Apartments] PRIMARY KEY CLUSTERED 
(
	[User_Apartment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Users_Apartments] ADD  CONSTRAINT [DF_t_TLBoard_User_Apartments_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Users_Apartments] ADD  CONSTRAINT [DF_t_TLBoard_User_Apartments_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
