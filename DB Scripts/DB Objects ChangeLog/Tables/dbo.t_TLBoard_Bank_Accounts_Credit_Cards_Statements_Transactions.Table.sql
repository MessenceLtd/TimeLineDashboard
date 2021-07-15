SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions](
	[Credit_Card_Statement_Transaction_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Bank_Account_Credit_Card_Statement_Id] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Business_Name] [nvarchar](50) NULL,
	[Transaction_Amount] [decimal](10, 2) NULL,
	[Transaction_Amount_Currency_Id] [tinyint] NULL,
	[Transaction_Actual_Payment_Amount] [decimal](10, 2) NULL,
	[Description] [nvarchar](80) NULL,
	[Has_Been_Actually_Charged_In_Statement] [bit] NULL,
	[Total_Charged_In_Statement] [decimal](10, 2) NULL,
	[User_Description] [nvarchar](300) NULL,
	[User_Comments] [nvarchar](300) NULL,
	[Transaction_Sort_Order_View] [smallint] NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Available_For_Download_For_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Available_For_Download_For_Followers_Users] [bit] NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] PRIMARY KEY CLUSTERED 
(
	[Credit_Card_Statement_Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Is_Visible_To_Anonymous_Users]  DEFAULT ((0)) FOR [Is_Visible_To_Anonymous_Users]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Is_Available_For_Download_For_Anonymous_Users]  DEFAULT ((0)) FOR [Is_Available_For_Download_For_Anonymous_Users]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Is_Visible_To_Followers_Users]  DEFAULT ((0)) FOR [Is_Visible_To_Followers_Users]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Is_Available_For_Download_For_Followers_Users]  DEFAULT ((0)) FOR [Is_Available_For_Download_For_Followers_Users]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
