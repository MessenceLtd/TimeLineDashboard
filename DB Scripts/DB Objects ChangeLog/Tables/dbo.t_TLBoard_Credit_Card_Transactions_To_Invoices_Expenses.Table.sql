SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses](
	[Credit_Card_Tranasction_Connection_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Credit_Card_Statement_Transaction_Id] [bigint] NOT NULL,
	[Is_Supplier_Expense] [bit] NULL,
	[Expense_Record_Id] [int] NULL,
	[Is_Invoice_Income] [bit] NULL,
	[Invoice_Record_Id] [int] NULL,
	[Is_Visible] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Delete_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses] PRIMARY KEY CLUSTERED 
(
	[Credit_Card_Tranasction_Connection_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
