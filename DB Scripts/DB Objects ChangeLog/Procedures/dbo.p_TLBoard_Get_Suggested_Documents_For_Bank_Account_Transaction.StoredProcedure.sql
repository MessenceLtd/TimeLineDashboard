SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Suggested_Documents_For_Bank_Account_Transaction]
@User_Id Int, @Bank_Account_Transaction_Id BigInt
As

-- Validate User_Id against the bank account transaction id
Declare @Expected_User_Id Int; 
Set     @Expected_User_Id = 
            (   Select  bankAccount.[User_Id]
                From    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                Join    t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = transactionDetails.Bank_Account_Id
                Where   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id );

If ( @Expected_User_Id != @User_Id )
Begin
    Declare @ErrorMessage NVarChar(500) = N'Error validating owner user ' + Convert(VarChar, @User_Id) + ' against transaction id ' + Convert(VarChar, @Bank_Account_Transaction_Id) +'.';
    Throw 500011, @ErrorMessage, 1;
End

-- Selecting suggested documents
-- Get the date of the transaction
Declare @Bank_Account_Transaction_Date SmallDateTime = 
    (   Select  transactionDetails.Transaction_Actual_DateTime 
        From    t_TLBoard_Bank_Accounts_Transactions transactionDetails
        Join    t_TLBoard_Bank_Accounts bankAccount on bankAccount.Bank_Account_Id = transactionDetails.Bank_Account_Id
        Where   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id );


Select  expenses.Expense_Record_Id                              As Suggested_Document_Id                                    , 
        'Expense'                                               As Suggested_Document_Type                                  , 
        expenses.Currency_Id                                    As Suggested_Document_Currency_Id                           ,
        expenses.Total_Amount                                   As Suggested_Document_Total_Amount                          ,
        expenses.Expense_Invoice_DateTime                       As Suggested_Document_Date                                  ,
        expenses.Original_File_Name                             As Suggested_Document_Original_File_Name                    ,
        expenses.Is_Visible_To_Anonymous_Users                  As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
        expenses.Is_Available_For_Download_For_Anonymous_Users  As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
        expenses.Is_Visible_To_Followers_Users                  As Suggested_Document_Is_Visible_To_Followers_Users         ,
        expenses.Is_Available_For_Download_For_Followers_Users  As Suggested_Document_Is_Downloadable_For_Followers_Users   
From    t_TLBoard_Expenses expenses
Where   expenses.[User_Id] = @User_Id 
        And Convert(Varchar, expenses.Expense_Invoice_DateTime , 103) = Convert(Varchar, @Bank_Account_Transaction_Date , 103)
Union 
Select  invoices.Invoice_Record_Id                              As Suggested_Document_Id                                    , 
        'Invoice'                                               As Suggested_Document_Type                                  , 
        invoices.Currency_Id                                    As Suggested_Document_Currency_Id                           ,
        invoices.Total_Amount                                   As Suggested_Document_Total_Amount                          ,
        invoices.Invoice_DateTime                               As Suggested_Document_Date                                  ,
        invoices.Original_File_Name                             As Suggested_Document_Original_File_Name                    ,
        invoices.Is_Visible_To_Anonymous_Users                  As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
        invoices.Is_Available_For_Download_For_Anonymous_Users  As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
        invoices.Is_Visible_To_Followers_Users                  As Suggested_Document_Is_Visible_To_Followers_Users         ,
        invoices.Is_Available_For_Download_For_Followers_Users  As Suggested_Document_Is_Downloadable_For_Followers_Users   
From    t_TLBoard_Invoices invoices
Where   invoices.[User_Id] = @User_Id 
        And Convert(Varchar, invoices.Invoice_DateTime , 103) = Convert(Varchar, @Bank_Account_Transaction_Date , 103)
Union 
Select  gdocuments.General_Document_Id                              As Suggested_Document_Id                                    , 
        'General_Document'                                          As Suggested_Document_Type                                  , 
        Null                                                        As Suggested_Document_Currency_Id                           ,
        Null                                                        As Suggested_Document_Total_Amount                          ,
        gdocuments.Document_Creation_DateTime                       As Suggested_Document_Date                                  ,
        gdocuments.Original_File_Name                               As Suggested_Document_Original_File_Name                    ,
        gdocuments.Is_Visible_To_Anonymous_Users                    As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
        gdocuments.Is_Available_For_Download_For_Anonymous_Users    As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
        gdocuments.Is_Visible_To_Followers_Users                    As Suggested_Document_Is_Visible_To_Followers_Users         ,
        gdocuments.Is_Available_For_Download_For_Followers_Users    As Suggested_Document_Is_Downloadable_For_Followers_Users   
From    t_TLBoard_General_Documents gdocuments
Where   gdocuments.[User_Id] = @User_Id 
        And Convert(Varchar, gdocuments.Document_Creation_DateTime , 103) = Convert(Varchar, @Bank_Account_Transaction_Date , 103)
Order By Suggested_Document_Date Desc

GO
