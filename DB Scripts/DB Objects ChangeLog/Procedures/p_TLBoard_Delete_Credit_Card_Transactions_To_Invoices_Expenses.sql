SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_Credit_Card_Transactions_To_Invoices_Expenses]
@Credit_Card_Tranasction_Connection_Record_Id Int, 
@Record_Deleted_By_User_Id int 
As

UPDATE	[dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Delete_DateTime_UTC = GETUTCDATE()
WHERE	Credit_Card_Tranasction_Connection_Record_Id = @Credit_Card_Tranasction_Connection_Record_Id And
		(Is_Deleted Is Null Or Is_Deleted = 0 )


GO
