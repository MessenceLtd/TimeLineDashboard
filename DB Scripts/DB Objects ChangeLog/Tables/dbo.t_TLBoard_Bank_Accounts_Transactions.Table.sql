SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Bank_Accounts_Transactions](
	[Bank_Account_Transaction_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Bank_Account_Id] [int] NULL,
	[Transaction_Account_Balance] [decimal](16, 2) NULL,
	[Transaction_Actual_DateTime] [datetime] NOT NULL,
	[Positive_Amount_Entered] [decimal](16, 2) NULL,
	[Negative_Amount_Paid] [decimal](16, 2) NULL,
	[Transaction_Value_DateTime] [datetime] NULL,
	[Reference_Number] [nvarchar](50) NULL,
	[Transaction_Bank_Description] [nvarchar](40) NULL,
	[Transaction_Bank_Inner_Reference_Code] [nvarchar](15) NULL,
	[Transaction_User_Description] [nvarchar](200) NULL,
	[Transaction_User_Comments] [nvarchar](200) NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Credit_Card_Statement_Transaction] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts_Transactions] PRIMARY KEY CLUSTERED 
(
	[Bank_Account_Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Transactions_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Bank_Accounts_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Transactions_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
