
ALTER PROC p_TLBoard_Delete_Bank_Accounts_Transactions_Document_Connection
@p_Document_Connection_Id BigInt, 
@p_Bank_Account_Transaction_Id BigInt,
@p_Deleting_User_Id Int
AS

-- Validate deleting user vs the owner and the security settings
Declare @_l_User_Id_Bank_Owner Int; 
Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                WHERE   transactionDetails.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id )

If ( @_l_User_Id_Bank_Owner Is Null Or @p_Deleting_User_Id != @_l_User_Id_Bank_Owner )
Begin 
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    Return;
End

UPDATE  t_TLBoard_Bank_Accounts_Transactions_Document_Connections 
SET     Is_Deleted = 1 , 
        Record_Deleted_By_User_Id = @p_Deleting_User_Id, 
        Record_Deleted_DateTime_UTC = GETUTCDATE(),
        Record_Last_Updated_By_User_Id = @p_Deleting_User_Id, 
        Record_Last_Updated_DateTime_UTC = GETUTCDATE() 
WHERE   Document_Connection_Id = @p_Document_Connection_Id And Is_Deleted = 0


GO

ALTER PROC p_TLBoard_Update_Bank_Accounts_Transactions_Document_Connection
@p_Document_Connection_Id BigInt, 
@p_Bank_Account_Transaction_Id BigInt,
@p_Is_Visible_To_Anonymous_Users Bit,
@p_Is_Available_For_Download_For_Anonymous_Users Bit,
@p_Is_Visible_To_Followers_Users Bit,
@p_Is_Available_For_Download_For_Followers_Users Bit,
@p_Updating_User_Id Int
AS

-- Validate updating user vs the owner and the security settings
Declare @_l_User_Id_Bank_Owner Int; 
Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                WHERE   transactionDetails.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id )

If ( @_l_User_Id_Bank_Owner Is Null Or @p_Updating_User_Id != @_l_User_Id_Bank_Owner )
Begin 
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    Return;
End

UPDATE  t_TLBoard_Bank_Accounts_Transactions_Document_Connections 
SET     Is_Visible_To_Anonymous_Users = @p_Is_Visible_To_Anonymous_Users ,
        Is_Available_For_Download_For_Anonymous_Users = @p_Is_Available_For_Download_For_Anonymous_Users,
        Is_Visible_To_Followers_Users = @p_Is_Visible_To_Followers_Users,
        Is_Available_For_Download_For_Followers_Users = @p_Is_Available_For_Download_For_Followers_Users,
        Record_Last_Updated_By_User_Id = @p_Updating_User_Id, 
        Record_Last_Updated_DateTime_UTC = GETUTCDATE() 
WHERE   Document_Connection_Id = @p_Document_Connection_Id And Is_Deleted = 0


GO

ALTER PROC p_TLBoard_Insert_Bank_Accounts_Transactions_Document_Connection
@p_Bank_Account_Transaction_Id   BIGINT,
@p_Connection_Type               TINYINT,
@p_Document_Record_Id            INT,
@p_Is_Visible_To_Anonymous_Users BIT,
@p_Is_Available_For_Download_For_Anonymous_Users BIT,
@p_Is_Visible_To_Followers_Users BIT,
@p_Is_Available_For_Download_For_Followers_Users BIT,
@p_Creating_User_Id              INT
AS

-- Validate creating user vs the owner and the security settings
Declare @_l_User_Id_Bank_Owner Int; 
Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                WHERE   transactionDetails.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id )

If ( @_l_User_Id_Bank_Owner Is Null Or @p_Creating_User_Id != @_l_User_Id_Bank_Owner )
Begin 
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    Return;
End


INSERT INTO t_TLBoard_Bank_Accounts_Transactions_Document_Connections
        (   [Bank_Account_Transaction_Id]       ,
            [Connection_Type]                   ,
            [Document_Record_Id]                ,
            [Is_Visible_To_Anonymous_Users]     ,
            [Is_Available_For_Download_For_Anonymous_Users] ,
            [Is_Visible_To_Followers_Users]     ,
            [Is_Available_For_Download_For_Followers_Users] , 
            [Record_Created_By_User_Id]         ,
            [Record_Creation_DateTime_UTC]      ,
            [Record_Last_Updated_By_User_Id]    ,
            [Record_Last_Updated_DateTime_UTC]  ,
            [Is_Deleted]                        
        )
     VALUES 
        (
            @p_Bank_Account_Transaction_Id      ,
            @p_Connection_Type                  ,              
            @p_Document_Record_Id               ,
            @p_Is_Visible_To_Anonymous_Users    ,
            @p_Is_Available_For_Download_For_Anonymous_Users ,
            @p_Is_Visible_To_Followers_Users    ,
            @p_Is_Available_For_Download_For_Followers_Users , 
            @p_Creating_User_Id                 ,
            GETUTCDATE()                        ,
            @p_Creating_User_Id                 ,
            GETUTCDATE()                        ,
            0
        )

Select @@IDENTITY;


GO

ALTER PROC p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections
@p_Bank_Account_Transaction_Id BIGINT,
@p_Transaction_Type TINYINT,
@p_Searching_User_Id INT
As

IF(@p_Transaction_Type Not In (1,2) Or @p_Transaction_Type Is null)
BEGIN
    Set @p_Transaction_Type = 1;
END

-- Transaction_Type 1 --> Bank_Account_Transaction
-- Transaction_Type 2 --> Credit_Card_Statement_Transaction

-- Validate searching user vs the owner and the security settings
Declare @_l_User_Id_Bank_Owner Int; 
IF (@p_Transaction_Type = 1)
BEGIN
    Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                    FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                    WHERE   transactionDetails.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id )
END
ELSE
BEGIN
    Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                    FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions transactionDetails
                                    JOIN    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
                                            ON transactionDetails.Bank_Account_Credit_Card_Statement_Id = statementDetails.Bank_Account_Credit_Card_Statement_Id
                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
                                    WHERE   transactionDetails.Credit_Card_Statement_Transaction_Id = @p_Bank_Account_Transaction_Id );
END


If ( @_l_User_Id_Bank_Owner Is Null Or  @p_Searching_User_Id != @_l_User_Id_Bank_Owner)
Begin 
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    Return;
End


DECLARE @_l_Result_Table Table (
    Document_Connection_Id                          BIGINT          , 
    Transaction_Id                                  BIGINT          , 
    Transaction_Type                                TINYINT         , 
    Connection_Type                                 TINYINT         , 
    Document_Record_Id                              INT             ,
    Title                                           NVARCHAR(200)   ,
    Document_Date                                   DATETIME        , 
    [Description]                                   NVARCHAR(300)   ,
    Country_Name                                    NVARCHAR(100)   ,
    City                                            NVARCHAR(100)   ,
    Email_Address                                   NVARCHAR(100)   ,
    Creation_DateTime                               DATETIME        , 
    Is_Visible_To_Anonymous_Users                   BIT             , 
    Is_Available_For_Download_For_Anonymous_Users   BIT             , 
    Is_Visible_To_Followers_Users                   BIT             , 
    Is_Available_For_Download_For_Followers_Users   BIT             ,
    Record_Created_By_User_Id                       INT             ,
    Record_Creation_DateTime_UTC                    DATETIME        ,
    Record_Creation_By_User_Fullname                NVARCHAR(100)   ,
    Record_Last_Updated_By_User_Id                  INT             ,
    Record_Last_Updated_DateTime_UTC                DATETIME        ,
    Record_Last_Updated_By_User_Fullname            NVARCHAR(100)
)

-- Populate result table with expenses.
IF (@p_Transaction_Type = 1)
BEGIN
    INSERT INTO @_l_Result_Table
    SELECT      tdc.Document_Connection_Id                           , 
                tdc.Bank_Account_Transaction_Id                      , 
                @p_Transaction_Type                                  ,
                tdc.Connection_Type                                  ,             
                tdc.Document_Record_Id                               ,
                CASE WHEN (expense.Original_File_Name Is Not Null) 
                    THEN expense.Original_File_Name
                    ELSE expense.Invoice_Supplier_Company_Details END AS Title    ,
                expense.Expense_Invoice_DateTime                     ,
                expense.User_Description As [Description]            ,
                country.Country_English_Name As Country_Name         ,                      
                expense.Invoice_Supplier_City As City                ,                      
                expense.Invoice_Supplier_WebAddress As Email_Address ,
                expense.Record_Creation_DateTime_UTC                 ,
                tdc.Is_Visible_To_Anonymous_Users                    ,
                tdc.Is_Available_For_Download_For_Anonymous_Users    ,
                tdc.Is_Visible_To_Followers_Users                    ,
                tdc.Is_Available_For_Download_For_Followers_Users    ,
                tdc.Record_Created_By_User_Id                        ,
                tdc.Record_Creation_DateTime_UTC                     ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                tdc.Record_Last_Updated_By_User_Id                   ,
                tdc.Record_Last_Updated_DateTime_UTC                 ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Bank_Accounts_Transactions_Document_Connections tdc
    Join        t_TLBoard_Expenses expense on expense.Expense_Record_Id = tdc.Document_Record_Id
    Left Join	t_TLBoard_Countries country On country.Country_Id = expense.Invoice_Supplier_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = expense.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = tdc.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = tdc.Record_Last_Updated_By_User_Id
    WHERE       tdc.Connection_Type = 1 and tdc.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id And tdc.Is_Deleted = 0
END
ELSE IF (@p_Transaction_Type = 2)
BEGIN
    INSERT INTO @_l_Result_Table
    SELECT      cctdc.Document_Connection_Id                           , 
                cctdc.Credit_Card_Statement_Transaction_Id             , 
                @p_Transaction_Type                                    ,
                cctdc.Connection_Type                                  ,             
                cctdc.Document_Record_Id                               ,
                CASE WHEN (expense.Original_File_Name Is Not Null) 
                    THEN expense.Original_File_Name
                    ELSE expense.Invoice_Supplier_Company_Details END AS Title    ,
                expense.Expense_Invoice_DateTime                        ,
                expense.User_Description As [Description]               ,
                country.Country_English_Name As Country_Name            ,                      
                expense.Invoice_Supplier_City As City                   ,                      
                expense.Invoice_Supplier_WebAddress As Email_Address    ,
                expense.Record_Creation_DateTime_UTC                    ,
                cctdc.Is_Visible_To_Anonymous_Users                     ,
                cctdc.Is_Available_For_Download_For_Anonymous_Users     ,
                cctdc.Is_Visible_To_Followers_Users                     ,
                cctdc.Is_Available_For_Download_For_Followers_Users     ,
                cctdc.Record_Created_By_User_Id                         ,
                cctdc.Record_Creation_DateTime_UTC                      ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                cctdc.Record_Last_Updated_By_User_Id                    ,
                cctdc.Record_Last_Updated_DateTime_UTC                  ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections cctdc
    Join        t_TLBoard_Expenses expense on expense.Expense_Record_Id = cctdc.Document_Record_Id
    Left Join	t_TLBoard_Countries country On country.Country_Id = expense.Invoice_Supplier_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = expense.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = cctdc.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = cctdc.Record_Last_Updated_By_User_Id
    WHERE       cctdc.Connection_Type = 1 and cctdc.Credit_Card_Statement_Transaction_Id = @p_Bank_Account_Transaction_Id And cctdc.Is_Deleted = 0
END

-- Populate result table with invoices.
IF (@p_Transaction_Type = 1)
BEGIN
    INSERT INTO @_l_Result_Table
    SELECT      tdc.Document_Connection_Id                           , 
                tdc.Bank_Account_Transaction_Id                      , 
                @p_Transaction_Type                                  ,
                tdc.Connection_Type                                  ,             
                tdc.Document_Record_Id                               ,
                CASE WHEN (invoice.Original_File_Name Is Not Null) 
                    THEN invoice.Original_File_Name
                    ELSE Convert( Varchar , invoice.Invoice_Number ) + ' - ' + invoice.Invoiced_Client_To_CompanyName END AS Title ,
                invoice.Invoice_DateTime                     ,
                invoice.User_Description As [Description]            ,
                country.Country_English_Name As Country_Name         ,                      
                invoice.Invoiced_Client_To_City As City                ,                      
                invoice.Invoiced_Client_To_EmailAddress As Email_Address ,
                invoice.Record_Creation_DateTime_UTC                 ,
                tdc.Is_Visible_To_Anonymous_Users                    ,
                tdc.Is_Available_For_Download_For_Anonymous_Users    ,
                tdc.Is_Visible_To_Followers_Users                    ,
                tdc.Is_Available_For_Download_For_Followers_Users    ,
                tdc.Record_Created_By_User_Id                        ,
                tdc.Record_Creation_DateTime_UTC                     ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                tdc.Record_Last_Updated_By_User_Id                   ,
                tdc.Record_Last_Updated_DateTime_UTC                 ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Bank_Accounts_Transactions_Document_Connections tdc
    Join        t_TLBoard_Invoices invoice on invoice.Invoice_Record_Id = tdc.Document_Record_Id
    Left Join	t_TLBoard_Countries country On country.Country_Id = invoice.Invoiced_Client_To_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = invoice.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = tdc.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = tdc.Record_Last_Updated_By_User_Id
    WHERE       tdc.Connection_Type = 2 and tdc.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id And tdc.Is_Deleted = 0
END
ELSE IF (@p_Transaction_Type = 2)
BEGIN
    INSERT INTO @_l_Result_Table
    SELECT      cctdc.Document_Connection_Id                           , 
                cctdc.Credit_Card_Statement_Transaction_Id             , 
                @p_Transaction_Type                                    ,
                cctdc.Connection_Type                                  ,             
                cctdc.Document_Record_Id                               ,
                CASE WHEN (invoice.Original_File_Name Is Not Null) 
                    THEN invoice.Original_File_Name
                    ELSE Convert( Varchar , invoice.Invoice_Number ) + ' - ' + invoice.Invoiced_Client_To_CompanyName END AS Title ,
                invoice.Invoice_DateTime                               ,
                invoice.User_Description As [Description]              ,
                country.Country_English_Name As Country_Name           ,                      
                invoice.Invoiced_Client_To_City As City                ,                      
                invoice.Invoiced_Client_To_EmailAddress As Email_Address ,
                invoice.Record_Creation_DateTime_UTC                   ,
                cctdc.Is_Visible_To_Anonymous_Users                    ,
                cctdc.Is_Available_For_Download_For_Anonymous_Users    ,
                cctdc.Is_Visible_To_Followers_Users                    ,
                cctdc.Is_Available_For_Download_For_Followers_Users    ,
                cctdc.Record_Created_By_User_Id                        ,
                cctdc.Record_Creation_DateTime_UTC                     ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                cctdc.Record_Last_Updated_By_User_Id                   ,
                cctdc.Record_Last_Updated_DateTime_UTC                 ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections cctdc
    Join        t_TLBoard_Invoices invoice on invoice.Invoice_Record_Id = cctdc.Document_Record_Id
    Left Join	t_TLBoard_Countries country On country.Country_Id = invoice.Invoiced_Client_To_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = invoice.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = cctdc.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = cctdc.Record_Last_Updated_By_User_Id
    WHERE       cctdc.Connection_Type = 2 and cctdc.Credit_Card_Statement_Transaction_Id = @p_Bank_Account_Transaction_Id And cctdc.Is_Deleted = 0
END


-- Populate result table with general documents.
IF (@p_Transaction_Type = 1)
BEGIN
    INSERT INTO @_l_Result_Table
    SELECT      tdc.Document_Connection_Id                           , 
                tdc.Bank_Account_Transaction_Id                      , 
                @p_Transaction_Type                                  ,
                tdc.Connection_Type                                  ,             
                tdc.Document_Record_Id                               ,
                CASE WHEN (document.Original_File_Name Is Not Null) 
                    THEN document.Original_File_Name
                    ELSE document.Title END AS Title                 ,
                document.Recieved_DateTime                           ,
                document.[Description] As [Description]              ,
                country.Country_English_Name As Country_Name         ,                      
                document.Sent_By_Entity_City As City                 ,                      
                document.Sent_By_Entity_Email_Address As Email_Address ,
                document.Sent_By_Entity_DateTime                     ,
                tdc.Is_Visible_To_Anonymous_Users                    ,
                tdc.Is_Available_For_Download_For_Anonymous_Users    ,
                tdc.Is_Visible_To_Followers_Users                    ,
                tdc.Is_Available_For_Download_For_Followers_Users    ,
                tdc.Record_Created_By_User_Id                        ,
                tdc.Record_Creation_DateTime_UTC                     ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                tdc.Record_Last_Updated_By_User_Id                   ,
                tdc.Record_Last_Updated_DateTime_UTC                 ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Bank_Accounts_Transactions_Document_Connections tdc
    Join        t_TLBoard_General_Documents document on document.General_Document_Id = tdc.Document_Record_Id
    Left Join	t_TLBoard_Countries country On country.Country_Id = document.Sent_By_Entity_Country_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = tdc.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = tdc.Record_Last_Updated_By_User_Id
    WHERE       tdc.Connection_Type = 3 and tdc.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id And tdc.Is_Deleted = 0
END
ELSE IF (@p_Transaction_Type = 2)
BEGIN
    INSERT INTO @_l_Result_Table
    SELECT      cctdc.Document_Connection_Id                            , 
                cctdc.Credit_Card_Statement_Transaction_Id              , 
                @p_Transaction_Type                                     ,
                cctdc.Connection_Type                                   ,             
                cctdc.Document_Record_Id                                ,
                CASE WHEN (document.Original_File_Name Is Not Null) 
                    THEN document.Original_File_Name
                    ELSE document.Title END AS Title                    ,
                document.Recieved_DateTime                              ,
                document.[Description] As [Description]                 ,
                country.Country_English_Name As Country_Name            ,                      
                document.Sent_By_Entity_City As City                    ,                      
                document.Sent_By_Entity_Email_Address As Email_Address  ,
                document.Sent_By_Entity_DateTime                        ,
                cctdc.Is_Visible_To_Anonymous_Users                     ,
                cctdc.Is_Available_For_Download_For_Anonymous_Users     ,
                cctdc.Is_Visible_To_Followers_Users                     ,
                cctdc.Is_Available_For_Download_For_Followers_Users     ,
                cctdc.Record_Created_By_User_Id                         ,
                cctdc.Record_Creation_DateTime_UTC                      ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                cctdc.Record_Last_Updated_By_User_Id                    ,
                cctdc.Record_Last_Updated_DateTime_UTC                  ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Bank_Accounts_CC_Statement_Transactions_Document_Connections cctdc
    Join        t_TLBoard_General_Documents document on document.General_Document_Id = cctdc.Document_Record_Id
    Left Join	t_TLBoard_Countries country On country.Country_Id = document.Sent_By_Entity_Country_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = cctdc.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = cctdc.Record_Last_Updated_By_User_Id
    WHERE       cctdc.Connection_Type = 3 and cctdc.Credit_Card_Statement_Transaction_Id = @p_Bank_Account_Transaction_Id And cctdc.Is_Deleted = 0
END


SELECT * FROM @_l_Result_Table ORDER BY Record_Creation_DateTime_UTC DESC;

GO

ALTER PROC p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connection_Suggestions
@p_Bank_Account_Transaction_Id  BIGINT  ,
@p_Transaction_Type             TINYINT ,
@p_Searching_User_Id            INT
As

IF ( @p_Transaction_Type Is Null Or @p_Transaction_Type Not In (1,2) )
BEGIN
    Set @p_Transaction_Type = 1;
END

-- Validate searching user vs the owner and the security settings
Declare @_l_User_Id_Bank_Owner Int; 
IF ( @p_Transaction_Type = 1 )
BEGIN
    Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                    FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                    WHERE   transactionDetails.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id )
END
ELSE IF ( @p_Transaction_Type = 2 )
BEGIN
    Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                    FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions transactionDetails
                                    JOIN    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
                                            ON transactionDetails.Bank_Account_Credit_Card_Statement_Id = statementDetails.Bank_Account_Credit_Card_Statement_Id
                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
                                    WHERE   transactionDetails.Credit_Card_Statement_Transaction_Id = @p_Bank_Account_Transaction_Id );
END


IF ( @_l_User_Id_Bank_Owner Is Null Or  @p_Searching_User_Id != @_l_User_Id_Bank_Owner)
BEGIN 
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    RETURN;
END

/* 
Suggestions will be based on the date of the bank account transaction.
Documents with the value that match that transaction value will have higher priority. (Than general documents)
If the document is already connected it will not be suggested for connection
If the bank account transaction is credit card statement, no document connection will be suggested (because the user can manage those connection per actual transaction)
More sophisticated process will be implemented in the future with suggestion per new transaction that is created/updated and for each document type that is created.
*/ 

DECLARE @_l_Result_Table Table (
    Connection_Type                                 TINYINT         , 
    Document_Record_Id                              INT             ,
    Title                                           NVARCHAR(200)   ,
    Document_Date                                   DATETIME        , 
    [Description]                                   NVARCHAR(300)   ,
    Country_Name                                    NVARCHAR(100)   ,
    City                                            NVARCHAR(100)   ,
    Email_Address                                   NVARCHAR(100)   ,
    Creation_DateTime                               DATETIME        , 
    Is_Visible_To_Anonymous_Users                   BIT             , 
    Is_Available_For_Download_For_Anonymous_Users   BIT             , 
    Is_Visible_To_Followers_Users                   BIT             , 
    Is_Available_For_Download_For_Followers_Users   BIT             ,
    Record_Created_By_User_Id                       INT             ,
    Record_Creation_DateTime_UTC                    DATETIME        ,
    Record_Creation_By_User_Fullname                NVARCHAR(100)   ,
    Record_Last_Updated_By_User_Id                  INT             ,
    Record_Last_Updated_DateTime_UTC                DATETIME        ,
    Record_Last_Updated_By_User_Fullname            NVARCHAR(100)
)

-- Imported from p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections (Should create a type for safer maintenance )
DECLARE @_l_Connected_Documents_Table Table (
    Document_Connection_Id                          BIGINT          , 
    Transaction_Id                                  BIGINT          , 
    Transaction_Type                                TINYINT         , 
    Connection_Type                                 TINYINT         , 
    Document_Record_Id                              INT             ,
    Title                                           NVARCHAR(200)   ,
    Document_Date                                   DATETIME        , 
    [Description]                                   NVARCHAR(300)   ,
    Country_Name                                    NVARCHAR(100)   ,
    City                                            NVARCHAR(100)   ,
    Email_Address                                   NVARCHAR(100)   ,
    Creation_DateTime                               DATETIME        , 
    Is_Visible_To_Anonymous_Users                   BIT             , 
    Is_Available_For_Download_For_Anonymous_Users   BIT             , 
    Is_Visible_To_Followers_Users                   BIT             , 
    Is_Available_For_Download_For_Followers_Users   BIT             ,
    Record_Created_By_User_Id                       INT             ,
    Record_Creation_DateTime_UTC                    DATETIME        ,
    Record_Creation_By_User_Fullname                NVARCHAR(100)   ,
    Record_Last_Updated_By_User_Id                  INT             ,
    Record_Last_Updated_DateTime_UTC                DATETIME        ,
    Record_Last_Updated_By_User_Fullname            NVARCHAR(100)
)

Insert Into @_l_Connected_Documents_Table
Exec p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections @p_Bank_Account_Transaction_Id, @p_Transaction_Type , @p_Searching_User_Id;

Declare @_l_Bank_Account_Transaction_Date SmallDateTime;
Declare @_l_Bank_Account_Transaction_Value Decimal(16,2); -- If the transaction is negative its an expense. If its positive its an invoice/reciept.

IF (@p_Transaction_Type = 1)
BEGIN
    SELECT  @_l_Bank_Account_Transaction_Date =  [transaction].Transaction_Actual_DateTime , 
            @_l_Bank_Account_Transaction_Value = 
                CASE WHEN ([transaction].Positive_Amount_Entered > 0 ) THEN [transaction].Positive_Amount_Entered
                WHEN ([transaction].Negative_Amount_Paid > 0 ) THEN ( [transaction].Negative_Amount_Paid * -1) ELSE 0 END 
    FROM    t_TLBoard_Bank_Accounts_Transactions [transaction]
    WHERE   [transaction].Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id
END
ELSE IF (@p_Transaction_Type = 1)
BEGIN
    SELECT  @_l_Bank_Account_Transaction_Date =  [transaction].Transaction_Date , 
            @_l_Bank_Account_Transaction_Value = [transaction].Transaction_Amount 
    FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions [transaction]
    WHERE   [transaction].Credit_Card_Statement_Transaction_Id = @p_Bank_Account_Transaction_Id
END


-- Populate result table with relavant expenses.
IF ( (@p_Transaction_Type = 1 AND (@_l_Bank_Account_Transaction_Value <> 0)) 
     OR @p_Transaction_Type = 2)
BEGIN
   
    INSERT INTO @_l_Result_Table
    SELECT      1  As Connection_Type                                       ,             
                expense.Expense_Record_Id As Document_Record_Id             ,
                CASE WHEN (expense.Original_File_Name Is Not Null) 
                    THEN expense.Original_File_Name
                    ELSE expense.Invoice_Supplier_Company_Details END AS Title ,
                expense.Expense_Invoice_DateTime                            ,
                expense.User_Description As [Description]                   ,
                country.Country_English_Name As Country_Name                ,                      
                expense.Invoice_Supplier_City As City                       ,                      
                expense.Invoice_Supplier_WebAddress As Email_Address        ,
                expense.Record_Creation_DateTime_UTC                        ,
                expense.Is_Visible_To_Anonymous_Users                       ,
                expense.Is_Available_For_Download_For_Anonymous_Users       ,
                expense.Is_Visible_To_Followers_Users                       ,
                expense.Is_Available_For_Download_For_Followers_Users       ,
                expense.Record_Created_By_User_Id                           ,
                expense.Record_Creation_DateTime_UTC                        ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                expense.Record_Last_Updated_By_User_Id                      ,
                expense.Record_Last_Updated_DateTime_UTC                    ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Expenses expense 
    Left Join	t_TLBoard_Countries country On country.Country_Id = expense.Invoice_Supplier_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = expense.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = expense.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = expense.Record_Last_Updated_By_User_Id
    WHERE       expense.User_Id = @_l_User_Id_Bank_Owner AND 
                expense.Is_Active = 1 AND 
                expense.Is_Deleted = 0 AND
                -- Might be a supplier bank wire transfer or another form of late payment for an invoice/payment request
                (   convert(varchar, expense.Expense_Invoice_DateTime, 111) = convert(varchar, @_l_Bank_Account_Transaction_Date, 111)
                    OR (    expense.Total_Amount = (@_l_Bank_Account_Transaction_Value * -1) AND 
                            YEAR(expense.Expense_Invoice_DateTime) = YEAR(@_l_Bank_Account_Transaction_Date) AND
                            MONTH(expense.Expense_Invoice_DateTime) = MONTH(@_l_Bank_Account_Transaction_Date) ) )
                -- Exclude already connected documents
                AND expense.Expense_Record_Id NOT IN ( Select Document_Record_Id From @_l_Connected_Documents_Table Where Connection_Type = 1 )

END


IF ( (@p_Transaction_Type = 1 AND (@_l_Bank_Account_Transaction_Value <> 0)) 
     OR @p_Transaction_Type = 2)
BEGIN

    -- Populate result table with invoices.
    INSERT INTO @_l_Result_Table
    SELECT      2  As Connection_Type                                       ,             
                invoice.Invoice_Record_Id As Document_Record_Id             ,
                CASE WHEN (invoice.Original_File_Name Is Not Null) 
                    THEN invoice.Original_File_Name
                    ELSE Convert( Varchar , invoice.Invoice_Number ) + ' - ' + invoice.Invoiced_Client_To_CompanyName END AS Title ,
                invoice.Invoice_DateTime                                    ,
                invoice.User_Description As [Description]                   ,
                country.Country_English_Name As Country_Name                ,                      
                invoice.Invoiced_Client_To_City As City                     ,                      
                invoice.Invoiced_Client_To_EmailAddress As Email_Address    ,
                invoice.Record_Creation_DateTime_UTC                        ,
                invoice.Is_Visible_To_Anonymous_Users                       ,
                invoice.Is_Available_For_Download_For_Anonymous_Users       ,
                invoice.Is_Visible_To_Followers_Users                       ,
                invoice.Is_Available_For_Download_For_Followers_Users       ,
                invoice.Record_Created_By_User_Id                           ,
                invoice.Record_Creation_DateTime_UTC                        ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                invoice.Record_Last_Updated_By_User_Id                      ,
                invoice.Record_Last_Updated_DateTime_UTC                    ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Invoices invoice 
    Left Join	t_TLBoard_Countries country On country.Country_Id = invoice.Invoiced_Client_To_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = invoice.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = invoice.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = invoice.Record_Last_Updated_By_User_Id
    WHERE       invoice.User_Id = @_l_User_Id_Bank_Owner AND 
                invoice.Is_Active = 1 AND 
                invoice.Is_Deleted = 0 AND
                (   convert(varchar, invoice.Invoice_DateTime, 111) = convert(varchar, @_l_Bank_Account_Transaction_Date, 111)
                    OR (    invoice.Total_Amount = @_l_Bank_Account_Transaction_Value AND 
                            YEAR(invoice.Invoice_DateTime) = YEAR(@_l_Bank_Account_Transaction_Date) AND
                            MONTH(invoice.Invoice_DateTime) = MONTH(@_l_Bank_Account_Transaction_Date) ) )
                -- Exclude already connected documents
                AND invoice.Invoice_Record_Id NOT IN ( Select Document_Record_Id From @_l_Connected_Documents_Table Where Connection_Type = 2 )

END


-- Populate result table with general documents.
INSERT INTO @_l_Result_Table
SELECT      3 As Connection_Type                                    ,             
            document.General_Document_Id As Document_Record_Id      ,
            CASE WHEN (document.Original_File_Name Is Not Null) 
                THEN document.Original_File_Name
                ELSE document.Title END AS Title                    ,
            document.Recieved_DateTime                              ,
            document.[Description] As [Description]                 ,
            country.Country_English_Name As Country_Name            ,                      
            document.Sent_By_Entity_City As City                    ,                      
            document.Sent_By_Entity_Email_Address As Email_Address  ,
            document.Sent_By_Entity_DateTime                        ,
            document.Is_Visible_To_Anonymous_Users                       ,
            document.Is_Available_For_Download_For_Anonymous_Users       ,
            document.Is_Visible_To_Followers_Users                       ,
            document.Is_Available_For_Download_For_Followers_Users       ,
            document.Record_Created_By_User_Id                           ,
            document.Record_Creation_DateTime_UTC                        ,
            createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
            document.Record_Last_Updated_By_User_Id                      ,
            document.Record_Last_Updated_DateTime_UTC                    ,
            lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

FROM        t_TLBoard_General_Documents document
Left Join	t_TLBoard_Countries country On country.Country_Id = document.Sent_By_Entity_Country_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = document.Record_Created_By_User_Id
Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = document.Record_Last_Updated_By_User_Id
WHERE       document.User_Id = @_l_User_Id_Bank_Owner AND 
            document.Is_Active = 1 AND 
            document.Is_Deleted = 0 AND
            convert(varchar, document.Document_Creation_DateTime, 111) = convert(varchar, @_l_Bank_Account_Transaction_Date, 111)
            -- Exclude already connected documents
            AND document.General_Document_Id NOT IN ( Select Document_Record_Id From @_l_Connected_Documents_Table Where Connection_Type = 3 )


SELECT * FROM @_l_Result_Table ORDER BY Record_Creation_DateTime_UTC DESC;


GO

ALTER PROC p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections_Search_Results
    @p_Bank_Account_Transaction_Id              BIGINT          ,
    @p_Transaction_Type                         TINYINT         ,
    @p_Filter_By_From_Date                      SMALLDATETIME   ,
    @p_Filter_By_To_Date                        SMALLDATETIME   ,
    @p_Filter_By_Type                           TINYINT         , 
    @p_Filter_By_Country_Id                     SMALLINT        ,
    @p_Filter_By_City_Or_Address_Or_Zipcode     NVARCHAR(100)   , 
    @p_Filter_By_Company_Name_Or_People_Name    NVARCHAR(100)   ,
    @p_Searching_User_Id                        INT             
AS

If (@p_Transaction_Type Is Null Or @p_Transaction_Type NOT IN (1,2))
BEGIN
    SET @p_Transaction_Type =  1; 
END

-- Validate searching user vs the owner and the security settings
Declare @_l_User_Id_Bank_Owner Int; 
IF ( @p_Transaction_Type = 1 )
BEGIN
    Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                    FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                    WHERE   transactionDetails.Bank_Account_Transaction_Id = @p_Bank_Account_Transaction_Id )
END
ELSE IF ( @p_Transaction_Type = 2 )
BEGIN
    Set @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                    FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions transactionDetails
                                    JOIN    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
                                            ON transactionDetails.Bank_Account_Credit_Card_Statement_Id = statementDetails.Bank_Account_Credit_Card_Statement_Id
                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
                                    WHERE   transactionDetails.Credit_Card_Statement_Transaction_Id = @p_Bank_Account_Transaction_Id );
END

If ( @_l_User_Id_Bank_Owner Is Null Or  @p_Searching_User_Id <> @_l_User_Id_Bank_Owner)
Begin 
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    print 'Permission denied';
    Return;
End

-- The Result Table is the same as the p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connection_Suggestions
DECLARE @_l_Result_Table Table (
    Connection_Type                                 TINYINT         , 
    Document_Record_Id                              INT             ,
    Title                                           NVARCHAR(200)   ,
    Document_Date                                   DATETIME        , 
    [Description]                                   NVARCHAR(300)   ,
    Country_Name                                    NVARCHAR(100)   ,
    City                                            NVARCHAR(100)   ,
    Email_Address                                   NVARCHAR(100)   ,
    Creation_DateTime                               DATETIME        , 
    Is_Visible_To_Anonymous_Users                   BIT             , 
    Is_Available_For_Download_For_Anonymous_Users   BIT             , 
    Is_Visible_To_Followers_Users                   BIT             , 
    Is_Available_For_Download_For_Followers_Users   BIT             ,
    Record_Created_By_User_Id                       INT             ,
    Record_Creation_DateTime_UTC                    DATETIME        ,
    Record_Creation_By_User_Fullname                NVARCHAR(100)   ,
    Record_Last_Updated_By_User_Id                  INT             ,
    Record_Last_Updated_DateTime_UTC                DATETIME        ,
    Record_Last_Updated_By_User_Fullname            NVARCHAR(100)
)

-- Imported from p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections
DECLARE @_l_Connected_Documents_Table Table (
    Document_Connection_Id                          BIGINT          , 
    Transaction_Id                                  BIGINT          , 
    Transaction_Type                                TINYINT         , 
    Connection_Type                                 TINYINT         , 
    Document_Record_Id                              INT             ,
    Title                                           NVARCHAR(200)   ,
    Document_Date                                   DATETIME        , 
    [Description]                                   NVARCHAR(300)   ,
    Country_Name                                    NVARCHAR(100)   ,
    City                                            NVARCHAR(100)   ,
    Email_Address                                   NVARCHAR(100)   ,
    Creation_DateTime                               DATETIME        , 
    Is_Visible_To_Anonymous_Users                   BIT             , 
    Is_Available_For_Download_For_Anonymous_Users   BIT             , 
    Is_Visible_To_Followers_Users                   BIT             , 
    Is_Available_For_Download_For_Followers_Users   BIT             ,
    Record_Created_By_User_Id                       INT             ,
    Record_Creation_DateTime_UTC                    DATETIME        ,
    Record_Creation_By_User_Fullname                NVARCHAR(100)   ,
    Record_Last_Updated_By_User_Id                  INT             ,
    Record_Last_Updated_DateTime_UTC                DATETIME        ,
    Record_Last_Updated_By_User_Fullname            NVARCHAR(100)
)

-- Make sure to exclude from search results the documents that already connected
Insert Into @_l_Connected_Documents_Table
Exec p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections @p_Bank_Account_Transaction_Id, @p_Transaction_Type, @p_Searching_User_Id;


If (@p_Filter_By_Type Is Null or @p_Filter_By_Type = 1)
BEGIN
    
    INSERT INTO @_l_Result_Table
    SELECT      1  As Connection_Type                                       ,             
                expense.Expense_Record_Id As Document_Record_Id             ,
                CASE WHEN (expense.Original_File_Name Is Not Null) 
                    THEN expense.Original_File_Name
                    ELSE expense.Invoice_Supplier_Company_Details END AS Title ,
                expense.Expense_Invoice_DateTime                            ,
                expense.User_Description As [Description]                   ,
                country.Country_English_Name As Country_Name                ,                      
                expense.Invoice_Supplier_City As City                       ,                      
                expense.Invoice_Supplier_WebAddress As Email_Address        ,
                expense.Record_Creation_DateTime_UTC                        ,
                expense.Is_Visible_To_Anonymous_Users                       ,
                expense.Is_Available_For_Download_For_Anonymous_Users       ,
                expense.Is_Visible_To_Followers_Users                       ,
                expense.Is_Available_For_Download_For_Followers_Users       ,
                expense.Record_Created_By_User_Id                           ,
                expense.Record_Creation_DateTime_UTC                        ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                expense.Record_Last_Updated_By_User_Id                      ,
                expense.Record_Last_Updated_DateTime_UTC                    ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Expenses expense 
    Left Join	t_TLBoard_Countries country On country.Country_Id = expense.Invoice_Supplier_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = expense.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = expense.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = expense.Record_Last_Updated_By_User_Id
    WHERE       expense.User_Id = @_l_User_Id_Bank_Owner AND 
                expense.Is_Active = 1 AND 
                expense.Is_Deleted = 0 AND
                ( @p_Filter_By_From_Date IS NULL OR expense.Expense_Invoice_DateTime >= @p_Filter_By_From_Date ) AND
                ( @p_Filter_By_To_Date IS NULL OR Convert(smalldatetime, Convert(Varchar, expense.Expense_Invoice_DateTime , 111)) <= @p_Filter_By_From_Date ) AND
                ( @p_Filter_By_Country_Id IS NULL OR expense.Invoice_Supplier_Country_Id = @p_Filter_By_Country_Id OR expense.Invoiced_Client_To_Country_Id = @p_Filter_By_Country_Id ) AND
                (   @p_Filter_By_City_Or_Address_Or_Zipcode IS NULL OR 
                    expense.Invoice_Supplier_City Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' OR
                    expense.Invoice_Supplier_ZipCode Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' OR
                    expense.Invoice_Supplier_Address_Description Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' ) AND 
                (   @p_Filter_By_Company_Name_Or_People_Name IS NULL OR 
                    expense.Invoice_Supplier_Company_Details Like '%'+ @p_Filter_By_Company_Name_Or_People_Name +'%' OR
                    expense.Invoice_Supplier_Contact_FullName Like '%'+ @p_Filter_By_Company_Name_Or_People_Name +'%' ) AND 
                expense.Expense_Record_Id NOT IN ( Select Document_Record_Id From @_l_Connected_Documents_Table Where Connection_Type = 1 )

END


If (@p_Filter_By_Type Is Null or @p_Filter_By_Type = 2)
BEGIN
    
    INSERT INTO @_l_Result_Table
    SELECT      2  As Connection_Type                                       ,             
                invoice.Invoice_Record_Id As Document_Record_Id             ,
                CASE WHEN (invoice.Original_File_Name Is Not Null) 
                    THEN invoice.Original_File_Name
                    ELSE Convert( Varchar , invoice.Invoice_Number ) + ' - ' + invoice.Invoiced_Client_To_CompanyName END AS Title ,
                invoice.Invoice_DateTime                                    ,
                invoice.User_Description As [Description]                   ,
                country.Country_English_Name As Country_Name                ,                      
                invoice.Invoiced_Client_To_City As City                     ,                      
                invoice.Invoiced_Client_To_EmailAddress As Email_Address    ,
                invoice.Record_Creation_DateTime_UTC                        ,
                invoice.Is_Visible_To_Anonymous_Users                       ,
                invoice.Is_Available_For_Download_For_Anonymous_Users       ,
                invoice.Is_Visible_To_Followers_Users                       ,
                invoice.Is_Available_For_Download_For_Followers_Users       ,
                invoice.Record_Created_By_User_Id                           ,
                invoice.Record_Creation_DateTime_UTC                        ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                invoice.Record_Last_Updated_By_User_Id                      ,
                invoice.Record_Last_Updated_DateTime_UTC                    ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_Invoices invoice 
    Left Join	t_TLBoard_Countries country On country.Country_Id = invoice.Invoiced_Client_To_Country_Id
    Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = invoice.Currency_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = invoice.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = invoice.Record_Last_Updated_By_User_Id
    WHERE       invoice.User_Id = @_l_User_Id_Bank_Owner AND 
                invoice.Is_Active = 1 AND 
                invoice.Is_Deleted = 0 AND
                ( @p_Filter_By_From_Date IS NULL OR invoice.Invoice_DateTime >= @p_Filter_By_From_Date ) AND
                ( @p_Filter_By_To_Date IS NULL OR Convert(smalldatetime, Convert(Varchar, invoice.Invoice_DateTime , 111)) <= @p_Filter_By_From_Date ) AND
                ( @p_Filter_By_Country_Id IS NULL OR invoice.Invoiced_Client_To_Country_Id = @p_Filter_By_Country_Id ) AND
                (   @p_Filter_By_City_Or_Address_Or_Zipcode IS NULL OR 
                    invoice.Invoiced_Client_To_City Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' OR
                    invoice.Invoiced_Client_To_Address Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' OR
                    invoice.Invoiced_Client_To_Zip Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' ) AND 
                (   @p_Filter_By_Company_Name_Or_People_Name IS NULL OR 
                    invoice.Invoiced_Client_To_CompanyName Like '%'+ @p_Filter_By_Company_Name_Or_People_Name +'%' OR
                    invoice.Invoiced_Client_To_PersonName Like '%'+ @p_Filter_By_Company_Name_Or_People_Name +'%' ) AND 
                -- Exclude already connected documents
                invoice.Invoice_Record_Id NOT IN ( Select Document_Record_Id From @_l_Connected_Documents_Table Where Connection_Type = 2 )

END


If (@p_Filter_By_Type Is Null or @p_Filter_By_Type = 3)
BEGIN
    
    INSERT INTO @_l_Result_Table
    SELECT      3 As Connection_Type                                    ,             
                document.General_Document_Id As Document_Record_Id      ,
                CASE WHEN (document.Original_File_Name Is Not Null) 
                    THEN document.Original_File_Name
                    ELSE document.Title END AS Title                    ,
                document.Recieved_DateTime                              ,
                document.[Description] As [Description]                 ,
                country.Country_English_Name As Country_Name            ,                      
                document.Sent_By_Entity_City As City                    ,                      
                document.Sent_By_Entity_Email_Address As Email_Address  ,
                document.Sent_By_Entity_DateTime                        ,
                document.Is_Visible_To_Anonymous_Users                       ,
                document.Is_Available_For_Download_For_Anonymous_Users       ,
                document.Is_Visible_To_Followers_Users                       ,
                document.Is_Available_For_Download_For_Followers_Users       ,
                document.Record_Created_By_User_Id                           ,
                document.Record_Creation_DateTime_UTC                        ,
                createdBy.First_Name + ' ' + createdBy.Last_Name As Record_Creation_By_User_Fullname, 
                document.Record_Last_Updated_By_User_Id                      ,
                document.Record_Last_Updated_DateTime_UTC                    ,
                lastUpdatedBy.First_Name + ' ' + lastUpdatedBy.Last_Name As Record_Last_Updated_By_User_Fullname 

    FROM        t_TLBoard_General_Documents document
    Left Join	t_TLBoard_Countries country On country.Country_Id = document.Sent_By_Entity_Country_Id
    Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = document.Record_Created_By_User_Id
    Left Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = document.Record_Last_Updated_By_User_Id
    WHERE       document.User_Id = @_l_User_Id_Bank_Owner AND 
                document.Is_Active = 1 AND 
                document.Is_Deleted = 0 AND
                ( @p_Filter_By_From_Date IS NULL OR document.Recieved_DateTime >= @p_Filter_By_From_Date ) AND
                ( @p_Filter_By_To_Date IS NULL OR Convert(smalldatetime, Convert(Varchar, document.Recieved_DateTime , 111)) <= @p_Filter_By_From_Date ) AND
                ( @p_Filter_By_Country_Id IS NULL OR document.Sent_By_Entity_Country_Id = @p_Filter_By_Country_Id ) AND
                (   @p_Filter_By_City_Or_Address_Or_Zipcode IS NULL OR 
                    document.Sent_By_Entity_City Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' OR
                    document.Sent_By_Entity_Address Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' OR
                    document.Sent_By_Entity_ZipCode Like '%'+ @p_Filter_By_City_Or_Address_Or_Zipcode +'%' ) AND 
                (   @p_Filter_By_Company_Name_Or_People_Name IS NULL OR 
                    document.Sent_By_Entity_Name Like '%'+ @p_Filter_By_Company_Name_Or_People_Name +'%' OR
                    document.Sent_To_Entity_Name Like '%'+ @p_Filter_By_Company_Name_Or_People_Name +'%' ) AND 
                -- Exclude already connected documents
                document.General_Document_Id NOT IN ( Select Document_Record_Id From @_l_Connected_Documents_Table Where Connection_Type = 3 )

END


SELECT Top 50 * FROM @_l_Result_Table ORDER BY Record_Creation_DateTime_UTC DESC;


GO


ALTER Proc [dbo].[p_TLBoard_Insert_Credit_Card_Statement_Transaction_Document_Connection]
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
                [Record_Creation_DateTime_UTC] , 
                Record_Last_Updated_By_User_Id,
                Record_Last_Updated_DateTime_UTC)
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
                GETUTCDATE(),
                @Creating_User_Id, 
                GETUTCDATE()
           )

    Select @@IDENTITY;

End

GO

IF (EXISTS (Select * From sysobjects where name = 'p_TLBoard_Get_Suggested_Documents_For_CCStatementTransaction' and xtype = 'P'))
BEGIN
    DROP PROC p_TLBoard_Get_Suggested_Documents_For_CCStatementTransaction;
END

IF (EXISTS (Select * From sysobjects where name = 'p_TLBoard_Get_Credit_Card_Statement_Transaction_Document_Connections_List' and xtype = 'P'))
BEGIN
    DROP PROC p_TLBoard_Get_Credit_Card_Statement_Transaction_Document_Connections_List;
END

Go


--t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses ??? 


