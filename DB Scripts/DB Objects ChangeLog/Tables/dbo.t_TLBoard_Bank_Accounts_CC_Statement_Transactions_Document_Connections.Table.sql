SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections](
	[Document_Connection_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Credit_Card_Statement_Transaction_Id] [bigint] NULL,
	[Bank_Account_Credit_Card_Statement_Id] [int] NULL,
	[Connection_Type] [tinyint] NULL,
	[Document_Record_Id] [int] NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Available_For_Download_For_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Available_For_Download_For_Followers_Users] [bit] NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections] PRIMARY KEY CLUSTERED 
(
	[Document_Connection_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
