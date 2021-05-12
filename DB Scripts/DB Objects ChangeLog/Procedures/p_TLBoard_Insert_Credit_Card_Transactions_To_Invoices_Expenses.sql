SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Insert_Credit_Card_Transactions_To_Invoices_Expenses]
@Credit_Card_Statement_Transaction_Id bigint,
@Is_Supplier_Expense bit, @Expense_Record_Id int,
@Is_Invoice_Income bit, @Invoice_Record_Id int,
@Record_Created_By_User_Id int 
As


INSERT INTO [dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses]
           ([Credit_Card_Statement_Transaction_Id]
           ,[Is_Supplier_Expense]
           ,[Expense_Record_Id]
           ,[Is_Invoice_Income]
           ,[Invoice_Record_Id]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC])
     VALUES
           (
			@Credit_Card_Statement_Transaction_Id, 
			@Is_Supplier_Expense,
			@Expense_Record_Id,
			@Is_Invoice_Income, 
			@Invoice_Record_Id,
	        @Record_Created_By_User_Id, 
			GETUTCDATE(),
			@Record_Created_By_User_Id, 
		   GETUTCDATE()
		   )

Select @@IDENTITY;

GO
