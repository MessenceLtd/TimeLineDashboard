SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Suggested_Documents_For_CCStatementTransaction]
@User_Id_Bank_Owner Int, 
@Credit_Card_Statement_Transaction_Id Int, 
@User_Id_Searching Int
As

-- Validate User_Id against the bank account credit card statement transaction id
Declare @Expected_User_Id Int; 
Set     @Expected_User_Id = 
            (   Select  bankAccount.[User_Id]
                From    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions ccStatementTransactionDetails
                Join    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
                    On statementDetails.Bank_Account_Credit_Card_Statement_Id = ccStatementTransactionDetails.Bank_Account_Credit_Card_Statement_Id
                Join    t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = statementDetails.Bank_Account_Id
                Where   ccStatementTransactionDetails.Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id );
                
If ( @Expected_User_Id != @User_ID_Bank_Owner Or @User_Id_Bank_Owner != @User_Id_Searching )
Begin
    Declare @ErrorMessage NVarChar(500) = N'Error validating owner user ' + Convert(VarChar, @User_ID_Bank_Owner) + ' against cc statement transaction id ' + Convert(VarChar, @Credit_Card_Statement_Transaction_Id) +'.';
    Throw 500012, @ErrorMessage, 1;
End
Else
Begin
    
    Declare @CCStatement_Transaction_Date DateTime = 
        (   Select  ccStatementTransactionDetails.Transaction_Date 
            From    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions ccStatementTransactionDetails
            Where   ccStatementTransactionDetails.Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id );

    Select  expenses.Expense_Record_Id                              As Suggested_Document_Id                                    , 
            1                                                       As Suggested_Document_Record_Type_Id                        , 
            expenses.Currency_Id                                    As Suggested_Document_Currency_Id                           ,
            expenses.Total_Amount                                   As Suggested_Document_Total_Amount                          ,
            expenses.Expense_Invoice_DateTime                       As Suggested_Document_Date                                  ,
            expenses.Original_File_Name                             As Suggested_Document_Original_File_Name                    ,
            expenses.Is_Visible_To_Anonymous_Users                  As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
            expenses.Is_Available_For_Download_For_Anonymous_Users  As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
            expenses.Is_Visible_To_Followers_Users                  As Suggested_Document_Is_Visible_To_Followers_Users         ,
            expenses.Is_Available_For_Download_For_Followers_Users  As Suggested_Document_Is_Downloadable_For_Followers_Users   
    From    t_TLBoard_Expenses expenses
    Where   expenses.[User_Id] = @User_Id_Bank_Owner 
            And Convert(Varchar, expenses.Expense_Invoice_DateTime , 103) = Convert(Varchar, @CCStatement_Transaction_Date , 103)
    Union 
    Select  invoices.Invoice_Record_Id                              As Suggested_Document_Id                                    , 
            2                                                       As Suggested_Document_Record_Type_Id                        , 
            invoices.Currency_Id                                    As Suggested_Document_Currency_Id                           ,
            invoices.Total_Amount                                   As Suggested_Document_Total_Amount                          ,
            invoices.Invoice_DateTime                               As Suggested_Document_Date                                  ,
            invoices.Original_File_Name                             As Suggested_Document_Original_File_Name                    ,
            invoices.Is_Visible_To_Anonymous_Users                  As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
            invoices.Is_Available_For_Download_For_Anonymous_Users  As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
            invoices.Is_Visible_To_Followers_Users                  As Suggested_Document_Is_Visible_To_Followers_Users         ,
            invoices.Is_Available_For_Download_For_Followers_Users  As Suggested_Document_Is_Downloadable_For_Followers_Users   
    From    t_TLBoard_Invoices invoices
    Where   invoices.[User_Id] = @User_Id_Bank_Owner 
            And Convert(Varchar, invoices.Invoice_DateTime , 103) = Convert(Varchar, @CCStatement_Transaction_Date , 103)
    Union 
    Select  gdocuments.General_Document_Id                              As Suggested_Document_Id                                    , 
            3                                                           As Suggested_Document_Record_Type_Id                                  , 
            Null                                                        As Suggested_Document_Currency_Id                           ,
            Null                                                        As Suggested_Document_Total_Amount                          ,
            gdocuments.Document_Creation_DateTime                       As Suggested_Document_Date                                  ,
            gdocuments.Original_File_Name                               As Suggested_Document_Original_File_Name                    ,
            gdocuments.Is_Visible_To_Anonymous_Users                    As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
            gdocuments.Is_Available_For_Download_For_Anonymous_Users    As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
            gdocuments.Is_Visible_To_Followers_Users                    As Suggested_Document_Is_Visible_To_Followers_Users         ,
            gdocuments.Is_Available_For_Download_For_Followers_Users    As Suggested_Document_Is_Downloadable_For_Followers_Users   
    From    t_TLBoard_General_Documents gdocuments
    Where   gdocuments.[User_Id] = @User_Id_Bank_Owner 
            And Convert(Varchar, gdocuments.Document_Creation_DateTime , 103) = Convert(Varchar, @CCStatement_Transaction_Date , 103)
    Order By Suggested_Document_Date Desc

End


GO
