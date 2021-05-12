SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Clients](
	[Client_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Company_Name] [nvarchar](150) NULL,
	[Website_URL] [nvarchar](150) NULL,
	[Default_Currency_Id] [tinyint] NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Telephone] [varchar](40) NULL,
	[Mobile_Phone] [varchar](40) NULL,
	[Client_Type_Id] [smallint] NULL,
	[Client_Tax_Reference_Number] [nvarchar](20) NULL,
	[Main_Contact_FullName] [nvarchar](100) NULL,
	[Main_Contact_Email_Address] [nvarchar](100) NULL,
	[Main_Contact_Phone_Number] [nvarchar](50) NULL,
	[Client_From_Date] [datetime] NULL,
	[Client_To_Date] [datetime] NULL,
	[First_Contract_Date] [datetime] NULL,
	[First_Contract_Signed_With_Contact_Full_Name] [nvarchar](200) NULL,
	[First_Contract_Signed_In_Location_Description] [nvarchar](400) NULL,
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
 CONSTRAINT [PK_t_TLBoard_Clients] PRIMARY KEY CLUSTERED 
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Clients] ADD  CONSTRAINT [DF_t_TLBoard_Clients_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Clients] ADD  CONSTRAINT [DF_t_TLBoard_Clients_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Clients] ADD  CONSTRAINT [DF_t_TLBoard_Clients_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [t_TLBoard_Clients] ADD  CONSTRAINT [DF_t_TLBoard_Clients_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
