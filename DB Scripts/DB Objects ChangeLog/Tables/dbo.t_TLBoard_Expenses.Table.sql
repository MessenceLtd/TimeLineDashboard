SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Expenses](
	[Expense_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Supplier_Id] [int] NOT NULL,
	[Expense_Invoice_DateTime] [datetime] NOT NULL,
	[Currency_Id] [tinyint] NOT NULL,
	[Total_Amount] [decimal](18, 3) NOT NULL,
	[Vat_Percentage] [decimal](6, 2) NOT NULL,
	[Total_Without_Vat] [decimal](18, 3) NOT NULL,
	[Total_Vat] [decimal](18, 3) NOT NULL,
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
	[Expense_Type_Id] [tinyint] NULL,
	[Invoice_Number] [nvarchar](30) NULL,
	[Invoice_Reference_Number] [nvarchar](50) NULL,
	[Invoice_Supplier_Company_Details] [nvarchar](120) NULL,
	[Invoice_Supplier_Tax_Reference] [nvarchar](50) NULL,
	[Invoice_Supplier_Country_Id] [smallint] NULL,
	[Invoice_Supplier_State_Id] [smallint] NULL,
	[Invoice_Supplier_City] [nvarchar](100) NULL,
	[Invoice_Supplier_Address_Description] [nvarchar](255) NULL,
	[Invoice_Supplier_ZipCode] [nvarchar](10) NULL,
	[Invoice_Supplier_WebAddress] [nvarchar](120) NULL,
	[Invoice_Supplier_Phone_Number] [nvarchar](50) NULL,
	[Invoice_Supplier_Contact_FullName] [nvarchar](80) NULL,
	[Invoice_Content_Long_Description] [nvarchar](2000) NULL,
	[User_Description] [nvarchar](1000) NULL,
	[User_Comments] [nvarchar](1000) NULL,
	[Original_File_Name] [nvarchar](255) NULL,
	[Azure_Block_Blob_Reference] [nvarchar](256) NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Available_For_Download_For_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Available_For_Download_For_Followers_Users] [bit] NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Active_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](400) NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Expenses] PRIMARY KEY CLUSTERED 
(
	[Expense_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Expenses] ADD  CONSTRAINT [DF_t_TLBoard_Expenses_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [t_TLBoard_Expenses] ADD  CONSTRAINT [DF_t_TLBoard_Expenses_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
