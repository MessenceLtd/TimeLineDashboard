﻿SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Suppliers](
	[Supplier_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Company_Name] [nvarchar](100) NULL,
	[Website_URL] [nvarchar](150) NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Default_Currency_Id] [tinyint] NULL,
	[Default_Vat_Percentage] [decimal](6, 2) NULL,
	[Telephone] [varchar](40) NULL,
	[Mobile_Phone] [varchar](40) NULL,
	[Supplier_Type_Id] [smallint] NULL,
	[Supplier_Tax_Reference_Number] [nvarchar](20) NULL,
	[Main_Contact_FullName] [nvarchar](100) NULL,
	[Main_Contact_Email_Address] [nvarchar](100) NULL,
	[Main_Contact_Phone_Number] [nvarchar](50) NULL,
	[Supplier_From_Date] [datetime] NULL,
	[Supplier_To_Date] [datetime] NULL,
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
 CONSTRAINT [PK_t_TLBoard_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Supplier_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Suppliers] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Suppliers] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Suppliers] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [t_TLBoard_Suppliers] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
