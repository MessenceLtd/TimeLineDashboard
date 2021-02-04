SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Invoices](
	[Invoice_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Client_Id] [int] NULL,
	[Currency_Id] [int] NULL,
	[Total_Without_Vat] [decimal](18, 3) NULL,
	[Total_Vat] [decimal](18, 3) NULL,
	[Vat_Percentage] [decimal](6, 2) NULL,
	[Total_Amount] [decimal](18, 3) NULL,
	[Creation_DateTime] [datetime] NULL,
	[Creation_DateTime_UTC] [datetime] NULL,
	[Invoiced_On_User_Location_Id] [int] NULL,
	[Invoiced_To_CompanyName] [nvarchar](150) NULL,
	[Invoiced_To_PhoneNumber] [nvarchar](50) NULL,
	[Invoiced_To_Address] [nvarchar](50) NULL,
	[Invoice_Number] [int] NULL,
	[Invoice_Reference_Number] [nvarchar](50) NULL,
	[Invoice_Type_Id] [tinyint] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[User_Description] [nvarchar](500) NULL,
	[User_Comments] [nvarchar](500) NULL,
	[Original_File_Name] [nvarchar](255) NULL,
	[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Delete_DateTime_UTC] [datetime] NULL,
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
