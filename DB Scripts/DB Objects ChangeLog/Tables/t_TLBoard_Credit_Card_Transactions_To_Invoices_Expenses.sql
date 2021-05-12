SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses](
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
	[Record_Delete_DateTime_UTC] [datetime] NULL
) ON [PRIMARY]
GO
