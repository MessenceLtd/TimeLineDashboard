SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Bank_Accounts](
	[Bank_Account_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Bank_Name] [nvarchar](40) NULL,
	[Bank_Number] [nvarchar](10) NULL,
	[Branch_Name] [nvarchar](40) NULL,
	[Branch_Number] [nvarchar](50) NULL,
	[Account_Number] [nvarchar](50) NULL,
	[Account_Name] [nvarchar](50) NULL,
	[IBAN] [nvarchar](50) NULL,
	[Currency_Id] [tinyint] NULL,
	[Opened_Account_DateTime] [datetime] NULL,
	[Branch_Country_Id] [smallint] NULL,
	[Branch_State_Id] [smallint] NULL,
	[Branch_City] [nvarchar](100) NULL,
	[Branch_Address_Description] [nvarchar](255) NULL,
	[Branch_ZipCode] [nvarchar](20) NULL,
	[Branch_Phone] [nvarchar](50) NULL,
	[Branch_Main_Email_Address] [nvarchar](100) NULL,
	[Branch_Main_Contact] [nvarchar](100) NULL,
	[Main_Contact_Phone_Number] [nvarchar](50) NULL,
	[Account_Active_From_Date] [datetime] NULL,
	[Account_Active_To_Date] [datetime] NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Available_For_Download_For_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Available_For_Download_For_Followers_Users] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NOT NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts] PRIMARY KEY CLUSTERED 
(
	[Bank_Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
