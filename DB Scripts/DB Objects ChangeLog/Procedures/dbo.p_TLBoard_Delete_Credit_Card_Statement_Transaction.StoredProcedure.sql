SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Delete_Credit_Card_Statement_Transaction]
@Credit_Card_Statement_Transaction_Id BigInt,
@Deleting_User_Id Int
As

Update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
Set     Is_Deleted = 1, 
        Record_Deleted_By_User_Id = @Deleting_User_Id, 
        Record_Deleted_DateTime_UTC = GETUTCDATE(),
        Record_Last_Updated_By_User_Id = @Deleting_User_Id,
        Record_Last_Updated_DateTime_UTC = GETUTCDATE()
Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And Is_Deleted = 0 

GO
