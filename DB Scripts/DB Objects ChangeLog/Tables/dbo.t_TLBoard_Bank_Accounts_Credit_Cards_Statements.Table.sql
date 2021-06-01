SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements](
	[Bank_Account_Credit_Card_Statement_Id] [int] IDENTITY(1,1) NOT NULL,
	[Bank_Account_Id] [int] NOT NULL,
	[Credit_Card_Id] [int] NOT NULL,
	[Statement_Date] [datetime] NOT NULL,
	[Total_Amount] [decimal](16, 2) NULL,
	[Currency_Id] [tinyint] NULL,
	[Original_File_Name] [nvarchar](255) NULL,
	[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
	[Bank_Account_Transaction_Id_Connection] [bigint] NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Available_For_Download_For_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Available_For_Download_For_Followers_Users] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts_Credit_Cards_Statements] PRIMARY KEY CLUSTERED 
(
	[Bank_Account_Credit_Card_Statement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
