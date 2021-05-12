SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Suppliers_Contacts](
	[Supplier_Contact_Id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Id] [int] NULL,
	[First_Name] [nvarchar](50) NULL,
	[Middle_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Email_Address] [nvarchar](100) NULL,
	[Mobile_Phone] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Telephone] [varchar](40) NULL,
	[User_Description] [nvarchar](500) NULL,
	[User_Comments] [nvarchar](500) NULL,
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
 CONSTRAINT [PK_t_TLBoard_Suppliers_Contacts] PRIMARY KEY CLUSTERED 
(
	[Supplier_Contact_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Suppliers_Contacts] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Contacts_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Suppliers_Contacts] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Contacts_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
