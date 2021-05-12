SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Suppliers_Contracts_Agreements](
	[Supplier_Contract_Agreement_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Supplier_Id] [int] NULL,
	[Agreement_Contract_Name] [nvarchar](100) NULL,
	[Agreement_Contract_Title] [nvarchar](150) NULL,
	[Description] [nvarchar](500) NULL,
	[Signed_On_DateTime] [datetime] NULL,
	[Signed_In_Country_Id] [nvarchar](100) NULL,
	[Signed_In_State_Id] [smallint] NULL,
	[Signed_In_City] [nvarchar](100) NULL,
	[Signed_In_Address] [nvarchar](150) NULL,
	[Signed_In_ZipCode] [varchar](10) NULL,
	[Has_Sent_Agreement_Contract_By_Email_Address] [bit] NULL,
	[Email_Recipient] [varchar](100) NULL,
	[Email_Recipient_Full_Name] [varchar](100) NULL,
	[Email_Recipient_Mobile_Phone] [varchar](100) NULL,
	[Email_Subject] [varchar](100) NULL,
	[Email_Submition_DateTime_UTC] [varchar](100) NULL,
	[Email_Sent_From_Email_Address] [varchar](100) NULL,
	[Comments] [nvarchar](100) NULL,
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
 CONSTRAINT [PK_t_TLBoard_Suppliers_Contracts_Agreements] PRIMARY KEY CLUSTERED 
(
	[Supplier_Contract_Agreement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Suppliers_Contracts_Agreements] ADD  CONSTRAINT [DF_t_Doc_Man_Suppliers_Contracts_Agreements_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Suppliers_Contracts_Agreements] ADD  CONSTRAINT [DF_t_Doc_Man_Suppliers_Contracts_Agreements_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
