SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Invoices](
	[Invoice_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Client_Id] [int] NULL,
	[Invoice_DateTime] [datetime] NOT NULL,
	[Currency_Id] [tinyint] NOT NULL,
	[Total_Amount] [decimal](18, 3) NULL,
	[Vat_Percentage] [decimal](6, 2) NULL,
	[Total_Without_Vat] [decimal](18, 3) NULL,
	[Total_Vat] [decimal](18, 3) NULL,
	[Creation_DateTime] [datetime] NULL,
	[Invoiced_Client_On_User_Location_Id] [int] NULL,
	[Invoiced_Client_To_CompanyName] [nvarchar](150) NULL,
	[Invoiced_Client_To_Tax_Reference] [nvarchar](50) NULL,
	[Invoiced_Client_To_PersonName] [nvarchar](100) NULL,
	[Invoiced_Client_To_PhoneNumber] [nvarchar](50) NULL,
	[Invoiced_Client_To_Country_Id] [smallint] NULL,
	[Invoiced_Client_To_State_Id] [smallint] NULL,
	[Invoiced_Client_To_City] [nvarchar](100) NULL,
	[Invoiced_Client_To_Address] [nvarchar](120) NULL,
	[Invoiced_Client_To_Zip] [nvarchar](10) NULL,
	[Invoiced_Client_To_EmailAddress] [nvarchar](120) NULL,
	[Invoice_Type_Id] [tinyint] NULL,
	[Invoice_Number] [int] NULL,
	[Invoice_Reference_Number] [nvarchar](50) NULL,
	[Invoice_Content_Long_Description] [nvarchar](2000) NULL,
	[User_Description] [nvarchar](1000) NULL,
	[User_Comments] [nvarchar](1000) NULL,
	[Original_File_Name] [nvarchar](255) NULL,
	[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Available_For_Download_For_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Available_For_Download_For_Followers_Users] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NOT NULL,
	[Active_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](400) NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_tbl_Invoices] PRIMARY KEY CLUSTERED 
(
	[Invoice_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Invoices] ADD  CONSTRAINT [DF_t_TLBoard_Invoices_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Invoices] ADD  CONSTRAINT [DF_t_TLBoard_Invoices_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Invoices] ADD  CONSTRAINT [DF_t_TLBoard_Invoices_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [t_TLBoard_Invoices] ADD  CONSTRAINT [DF_t_TLBoard_Invoices_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
