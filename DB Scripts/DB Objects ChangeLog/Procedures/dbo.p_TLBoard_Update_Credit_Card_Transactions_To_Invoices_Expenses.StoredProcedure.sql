SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Credit_Card_Transactions_To_Invoices_Expenses]
@Credit_Card_Tranasction_Connection_Record_Id Int, 
@Credit_Card_Statement_Transaction_Id bigint,
@Is_Supplier_Expense bit, @Expense_Record_Id int,
@Is_Invoice_Income bit, @Invoice_Record_Id int, 
@Is_Visible Bit, 
@Record_Updated_By_User_Id int 
As

UPDATE	[dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses]
SET		[Credit_Card_Statement_Transaction_Id] = @Credit_Card_Statement_Transaction_Id,
		[Is_Supplier_Expense] = @Is_Supplier_Expense, 
		[Expense_Record_Id] = @Expense_Record_Id,
		[Is_Invoice_Income] = @Is_Invoice_Income,
		[Invoice_Record_Id] = @Invoice_Record_Id,
		Is_Visible = @Is_Visible, 
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GETUTCDATE()
WHERE	Credit_Card_Tranasction_Connection_Record_Id = @Credit_Card_Tranasction_Connection_Record_Id


GO
