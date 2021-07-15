SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Insert_Credit_Card_Statement_Transaction_Document_Connection]
@User_Id_Bank_Owner Int,
@Credit_Card_Statement_Transaction_Id BigInt,
@Connection_Type TinyInt,
@Document_Record_Id Int,
@Is_Visible_To_Anonymous_Users Bit ,
@Is_Available_For_Download_For_Anonymous_Users Bit ,
@Is_Visible_To_Followers_Users Bit ,
@Is_Available_For_Download_For_Followers_Users Bit ,
@Creating_User_Id Int
As

Declare @Bank_Account_Credit_Card_Statement_Id Int = 
    (   Select  transactions.Bank_Account_Credit_Card_Statement_Id 
        From    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions transactions
        Join    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
                ON  statementDetails.Bank_Account_Credit_Card_Statement_Id = transactions.Bank_Account_Credit_Card_Statement_Id
        Join    t_TLBoard_Bank_Accounts bankAccount ON bankAccount.Bank_Account_Id = statementDetails.Bank_Account_Id
        Where   transactions.Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And
                bankAccount.[User_Id] =  @User_Id_Bank_Owner
        );

If ( @Bank_Account_Credit_Card_Statement_Id Is Not Null)
Begin

    INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections]
           (    [Credit_Card_Statement_Transaction_Id],
                [Bank_Account_Credit_Card_Statement_ID],
                [Connection_Type],
                [Document_Record_Id],
                [Is_Visible_To_Anonymous_Users] ,
                [Is_Available_For_Download_For_Anonymous_Users] ,
                [Is_Visible_To_Followers_Users] ,
                [Is_Available_For_Download_For_Followers_Users] ,
                [Record_Created_By_User_Id] ,
                [Record_Creation_DateTime_UTC] )
     VALUES
           (    @Credit_Card_Statement_Transaction_Id,
                @Bank_Account_Credit_Card_Statement_Id, 
                @Connection_Type, 
                @Document_Record_Id,
                @Is_Visible_To_Anonymous_Users, 
                @Is_Available_For_Download_For_Anonymous_Users, 
                @Is_Visible_To_Followers_Users,
                @Is_Available_For_Download_For_Followers_Users,
                @Creating_User_Id, 
                GETUTCDATE()
           )

    Select @@IDENTITY;

End

GO
