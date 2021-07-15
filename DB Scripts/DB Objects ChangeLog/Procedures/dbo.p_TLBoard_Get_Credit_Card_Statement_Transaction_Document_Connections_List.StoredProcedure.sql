SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Credit_Card_Statement_Transaction_Document_Connections_List]
@User_Id_Bank_Owner Int,
@Credit_Card_Statement_Transaction_Id BigInt , 
@Searching_User_Id Int
As

Select  documentConnections.* ,
        createdBy.First_Name As Created_By_First_Name, 
        createdBy.Last_Name As Created_By_Last_Name, 
        coalesce(expenses.Expense_Invoice_DateTime, invoices.Invoice_DateTime, general_documents.Document_Creation_DateTime) As Document_Date,
        coalesce(expenses.Total_Amount, invoices.Total_Amount, NULL) As Document_Total_Amount,
        coalesce(expenses.Currency_Id, invoices.Currency_Id, NULL) As Document_Currency_Id,
        coalesce(expenses.Original_File_Name, invoices.Original_File_Name, general_documents.Original_File_Name) As Document_Original_File_Name
From    [t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections] documentConnections
Join      t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
            ON  statementDetails.Bank_Account_Credit_Card_Statement_Id = documentConnections.Bank_Account_Credit_Card_Statement_Id
Join      t_TLBoard_Bank_Accounts bankAccount ON bankAccount.Bank_Account_Id = statementDetails.Bank_Account_Id
Left Join t_TLBoard_Expenses expenses 
            ON  documentConnections.Connection_Type = 1 And 
                expenses.Expense_Record_Id = documentConnections.Document_Record_Id And
                expenses.[User_Id] = @User_Id_Bank_Owner
Left Join t_TLBoard_Invoices invoices 
            ON  documentConnections.Connection_Type = 2 And 
                invoices.Invoice_Record_Id = documentConnections.Document_Record_Id And
                expenses.[User_Id] = @User_Id_Bank_Owner
Left Join   t_TLBoard_General_Documents general_documents 
            ON  documentConnections.Connection_Type = 3 And 
                general_documents.General_Document_Id = documentConnections.Document_Record_Id And
                expenses.[User_Id] = @User_Id_Bank_Owner
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = documentConnections.Record_Created_By_User_Id
Where   documentConnections.Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And
        bankAccount.[User_Id] =  @User_Id_Bank_Owner And
        documentConnections.Is_Deleted = 0


GO
