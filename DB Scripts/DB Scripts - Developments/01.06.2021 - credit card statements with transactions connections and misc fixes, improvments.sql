Use [DashboardTimeLine]; 

Go


ALTER Proc [dbo].[p_TLBoard_Update_Credit_Card_Statement_Transaction]
@Credit_Card_Statement_Transaction_Id BigInt ,
@Transaction_Date DateTime ,
@Business_Name NVarChar(50),
@Transaction_Amount Decimal(10,2),
@Transaction_Amount_Currency_Id TinyInt,
@Transaction_Actual_Payment_Amount Decimal(10,2),
@Description NVarChar(80),
@Has_Been_Actually_Charged_In_Statement Bit,
@Total_Charged_In_Statement Decimal(10,2),
@Updating_User_Id Int
As

-- Verify the current user is permitted to update the transaction
Declare @User_Bank_Account_Owner_Id Int = 
    (   Select  bankDetails.[User_Id] 
        From    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions ccStatementTransaction
        Join    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
            On statementDetails.Bank_Account_Credit_Card_Statement_Id = ccStatementTransaction.Bank_Account_Credit_Card_Statement_Id
        Join    t_TLBoard_Bank_Accounts bankDetails On bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
        Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And ccStatementTransaction.Is_Deleted = 0  )

If (@User_Bank_Account_Owner_Id = @Updating_User_Id )
Begin
    Update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
    Set     Transaction_Date = @Transaction_Date, 
            Business_Name = @Business_Name, 
            Transaction_Amount = @Transaction_Amount,
            Transaction_Amount_Currency_Id = @Transaction_Amount_Currency_Id, 
            Transaction_Actual_Payment_Amount = @Transaction_Actual_Payment_Amount, 
            [Description] = @Description, 
            Has_Been_Actually_Charged_In_Statement = @Has_Been_Actually_Charged_In_Statement, 
            Total_Charged_In_Statement = @Total_Charged_In_Statement, 
            Record_Last_Updated_By_User_Id = @Updating_User_Id,
            Record_Last_Updated_DateTime_UTC = GETUTCDATE()
    Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And Is_Deleted = 0 
End
Else
Begin 
    RAISERROR (N'Permission error updating cc statement transaction %d by user %d.', -- Message text.  
           10, -- Severity,  
           1, -- State,  
           @Credit_Card_Statement_Transaction_Id,   
           @Updating_User_Id); 
End

Go

ALTER Proc [dbo].[p_TLBoard_Get_Credit_Card_Statements_List]
@User_ID_Bank_Owner Int, 
@Bank_Account_Id Int, 
@User_ID_Searching Int
As

Select      CCStatement.* ,
            bankAccount.Bank_Name As Bank_Account_Name , 
            currency.Currency_Symbol, 
            creditCard.Card_Name As Credit_Card_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name ,
            statementTotalPurchases.Total_Transactions As Total_Purchases
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatement.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatement.Record_Last_Updated_By_User_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
Left Join   (   Select      ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id, 
                            Count(ccTransaction.Credit_Card_Statement_Transaction_Id) As Total_Transactions
                From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions ccTransaction
                Join        t_TLBoard_Bank_Accounts_Credit_Cards_Statements ccTransactionStatement 
                            ON ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id = ccTransaction.Bank_Account_Credit_Card_Statement_Id
                Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = ccTransactionStatement.Bank_Account_Id  
                Where       bankAccount.[User_Id] = @User_ID_Bank_Owner And ccTransaction.Is_Deleted = 0
                Group By    ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id 
            )   statementTotalPurchases On statementTotalPurchases.Bank_Account_Credit_Card_Statement_Id = CCStatement.Bank_Account_Credit_Card_Statement_Id
Where       bankAccount.[User_Id]       = @User_ID_Bank_Owner And
            @User_ID_Searching          = @User_ID_Bank_Owner And
            ( @Bank_Account_Id Is Null Or @Bank_Account_Id <= 0 Or bankAccount.Bank_Account_Id = @Bank_Account_Id )
Order By    CCStatement.Statement_Date desc

Go

ALTER Proc [dbo].[p_TLBoard_Insert_Credit_Card_Statement_Transaction]
@Bank_Account_Credit_Card_Statement_Id Int ,
@Transaction_Date DateTime ,
@Business_Name NVarChar(50),
@Transaction_Amount Decimal(10,2),
@Transaction_Amount_Currency_Id TinyInt,
@Transaction_Actual_Payment_Amount Decimal(10,2),
@Description NVarChar(80),
@Has_Been_Actually_Charged_In_Statement Bit,
@Total_Charged_In_Statement Decimal(10,2),
@User_Description NVarChar(300),
@User_Comments NVarChar(300),
@Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, 
@Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, 
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions]
    (
        [Bank_Account_Credit_Card_Statement_Id],
        [Transaction_Date],
        [Business_Name],
        [Transaction_Amount],
        [Transaction_Amount_Currency_Id],
        [Transaction_Actual_Payment_Amount],
        [Description],
        [Has_Been_Actually_Charged_In_Statement],
        [Total_Charged_In_Statement],
        [User_Description],
        [User_Comments],
        [Is_Visible_To_Anonymous_Users],
        [Is_Available_For_Download_For_Anonymous_Users], 
        [Is_Visible_To_Followers_Users],
        [Is_Available_For_Download_For_Followers_Users], 
        [Record_Created_By_User_Id],
        [Record_Creation_DateTime_UTC],
        [Record_Last_Updated_By_User_Id],
        [Record_Last_Updated_DateTime_UTC]
    )
VALUES
    (   @Bank_Account_Credit_Card_Statement_Id,
        @Transaction_Date,
        @Business_Name,
        @Transaction_Amount,
        @Transaction_Amount_Currency_Id,
        @Transaction_Actual_Payment_Amount,
        @Description,
        @Has_Been_Actually_Charged_In_Statement,
        @Total_Charged_In_Statement,
        @User_Description, 
        @User_Comments,
        @Is_Visible_To_Anonymous_Users,
        @Is_Available_For_Download_For_Anonymous_Users, 
        @Is_Visible_To_Followers_Users,
        @Is_Available_For_Download_For_Followers_Users, 
        @Creating_User_Id,
        GETUTCDATE(),
        @Creating_User_Id,
        GETUTCDATE()
    )

Select @@Identity;

Go

Alter Proc [p_TLBoard_Update_Credit_Card_Statement_Transaction_FullDetails]
@Credit_Card_Statement_Transaction_Id BigInt ,
@Transaction_Date DateTime ,
@Business_Name NVarChar(50),
@Transaction_Amount Decimal(10,2),
@Transaction_Amount_Currency_Id TinyInt,
@Transaction_Actual_Payment_Amount Decimal(10,2),
@Description NVarChar(80),
@Has_Been_Actually_Charged_In_Statement Bit,
@Total_Charged_In_Statement Decimal(10,2),
@User_Description NVarChar(300),
@User_Comments NVarChar(300),
@Is_Visible_To_Anonymous_Users Bit,
@Is_Available_For_Download_For_Anonymous_Users Bit,
@Is_Visible_To_Followers_Users Bit,
@Is_Available_For_Download_For_Followers_Users Bit,
@Updating_User_Id Int
As

-- Verify the current user is permitted to update the transaction
Declare @User_Bank_Account_Owner_Id Int = 
    (   Select  bankDetails.[User_Id] 
        From    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions ccStatementTransaction
        Join    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
            On statementDetails.Bank_Account_Credit_Card_Statement_Id = ccStatementTransaction.Bank_Account_Credit_Card_Statement_Id
        Join    t_TLBoard_Bank_Accounts bankDetails On bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
        Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And ccStatementTransaction.Is_Deleted = 0  )

If (@User_Bank_Account_Owner_Id = @Updating_User_Id )
Begin
    Update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
    Set     Transaction_Date = @Transaction_Date, 
            Business_Name = @Business_Name, 
            Transaction_Amount = @Transaction_Amount,
            Transaction_Amount_Currency_Id = @Transaction_Amount_Currency_Id, 
            Transaction_Actual_Payment_Amount = @Transaction_Actual_Payment_Amount, 
            [Description] = @Description, 
            Has_Been_Actually_Charged_In_Statement = @Has_Been_Actually_Charged_In_Statement, 
            Total_Charged_In_Statement = @Total_Charged_In_Statement, 
            User_Description = @User_Description,
            User_Comments = @User_Comments,
            Is_Visible_To_Anonymous_Users = @Is_Visible_To_Anonymous_Users , 
            Is_Available_For_Download_For_Anonymous_Users = @Is_Available_For_Download_For_Anonymous_Users ,
            Is_Visible_To_Followers_Users = @Is_Visible_To_Followers_Users ,
            Is_Available_For_Download_For_Followers_Users = @Is_Available_For_Download_For_Followers_Users ,
            Record_Last_Updated_By_User_Id = @Updating_User_Id,
            Record_Last_Updated_DateTime_UTC = GETUTCDATE()
    Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And Is_Deleted = 0 
End
Else
Begin 
    RAISERROR (N'Permission error updating cc statement %d by user %d.', -- Message text.  
           10, -- Severity,  
           1, -- State,  
           @Credit_Card_Statement_Transaction_Id,   
           @Updating_User_Id); 
End


Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Credit_Card_Statement_Transaction_Document_Connections_List'  ))
Begin
	Drop Proc [p_TLBoard_Get_Credit_Card_Statement_Transaction_Document_Connections_List]
End

Go

Create Proc p_TLBoard_Get_Credit_Card_Statement_Transaction_Document_Connections_List
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

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Credit_Card_Statement_Transaction_Document_Connection'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Credit_Card_Statement_Transaction_Document_Connection]
End

Go

Create Proc p_TLBoard_Insert_Credit_Card_Statement_Transaction_Document_Connection
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

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Delete_Credit_Card_Statement_Transaction_Document_Connection'  ))
Begin
	Drop Proc [p_TLBoard_Delete_Credit_Card_Statement_Transaction_Document_Connection]
End

Go

Create Proc p_TLBoard_Delete_Credit_Card_Statement_Transaction_Document_Connection
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

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Credit_Card_Statement_Transaction_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Credit_Card_Statement_Transaction_Details]
End

Go

Create Proc p_TLBoard_Get_Credit_Card_Statement_Transaction_Details
@User_Id_Bank_Owner Int,
@Credit_Card_Statement_Transaction_Id BigInt,
@Searching_User_Id Int
AS


Select      CCStatementTransaction.* ,
            bankAccount.Bank_Account_Id As Bank_Account_Id , 
            bankAccount.Bank_Name As Bank_Account_Name , 
            currency.Currency_Symbol As Bank_Currency_Symbol, 
            TransactionCurrency.Currency_Symbol As Payment_Currency ,
            creditCard.Credit_Card_Id As Credit_Card_Id , 
            creditCard.Card_Name As Credit_Card_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions CCStatementTransaction
Join        t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
            ON statementDetails.Bank_Account_Credit_Card_Statement_Id = CCStatementTransaction.Bank_Account_Credit_Card_Statement_Id
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = statementDetails.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = statementDetails.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatementTransaction.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatementTransaction.Record_Last_Updated_By_User_Id
Left Join	t_TLBoard_Currencies TransactionCurrency On TransactionCurrency.Currency_Id = CCStatementTransaction.Transaction_Amount_Currency_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
Where       CCStatementTransaction.Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And
            bankAccount.[User_Id]       = @User_ID_Bank_Owner And
            @Searching_User_Id          = @User_ID_Bank_Owner 


GO

-- Todo -- Sync statement privacy settings to the transaction insert process 
--update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
--set     Is_Visible_To_Anonymous_Users = 0,
--        Is_Available_For_Download_For_Anonymous_Users = 0, 
--        Is_Visible_To_Followers_Users = 0,
--        Is_Available_For_Download_For_Followers_Users = 0

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Suggested_Documents_For_CCStatementTransaction'  ))
Begin
	Drop Proc [p_TLBoard_Get_Suggested_Documents_For_CCStatementTransaction]
End

Go

Create Proc p_TLBoard_Get_Suggested_Documents_For_CCStatementTransaction
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


Go


Select * From t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections






