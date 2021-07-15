SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Delete_Credit_Card_Statement_Transaction_Document_Connection]
@User_Id_Bank_Owner Int,
@Document_Connection_Id BigInt,
@Deleting_User_Id Int
As

Declare @_l_User_Id_Document_Connection_Owner Int = 
    (   Select  bankAccount.User_Id
        From    [t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections] documentConnections
        Join    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
            ON  statementDetails.Bank_Account_Credit_Card_Statement_Id = documentConnections.Bank_Account_Credit_Card_Statement_Id
        Join    t_TLBoard_Bank_Accounts bankAccount ON bankAccount.Bank_Account_Id = statementDetails.Bank_Account_Id
        Where   documentConnections.Document_Connection_Id = @Document_Connection_Id);

If ( @User_Id_Bank_Owner =  @Deleting_User_Id And @User_Id_Bank_Owner = @_l_User_Id_Document_Connection_Owner )
Begin

    Update  t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections 
    Set     Is_Deleted = 1, Record_Deleted_By_User_Id = @Deleting_User_Id, Record_Deleted_DateTime_UTC = GETUTCDATE()
    Where   Document_Connection_Id = @Document_Connection_Id 

End


GO
