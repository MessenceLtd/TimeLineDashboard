
ALTER PROC p_TLBoard_Get_Credit_Card_Statements_Unconnected_Statements_By_BankAccountTransactionId
@Bank_Account_Transaction_Id BIGINT, 
@Searching_User_ID INT 
AS

DECLARE @_l_User_Id_Bank_Owner INT; 
SET @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                WHERE   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id AND
                                        bankDetails.Is_Deleted = 0 AND 
                                        transactionDetails.Is_Deleted = 0 );

IF ( @_l_User_Id_Bank_Owner Is Null Or @Searching_User_ID != @_l_User_Id_Bank_Owner )
BEGIN
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    Return;
END

DECLARE @_l_Transaction_Actual_DateTime DATETIME;
DECLARE @_l_Transaction_Value_DateTime DATETIME;

SELECT  @_l_Transaction_Actual_DateTime = transactionDetails.Transaction_Actual_DateTime,
        @_l_Transaction_Value_DateTime = transactionDetails.Transaction_Value_DateTime
FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
WHERE   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id AND
        Is_Deleted = 0;

IF (@_l_Transaction_Actual_DateTime Is Not Null)
BEGIN 
    SET @_l_Transaction_Actual_DateTime = Convert(DATETIME, Convert( VARCHAR, @_l_Transaction_Actual_DateTime , 111));
END

IF (@_l_Transaction_Value_DateTime Is Not Null)
BEGIN 
    SET @_l_Transaction_Value_DateTime = Convert(DATETIME, Convert( VARCHAR, @_l_Transaction_Value_DateTime , 111));
END


IF ( @_l_Transaction_Actual_DateTime IS NOT NULL OR @_l_Transaction_Value_DateTime IS NOT NULL )
BEGIN
    SELECT      CCStatement.* ,
                bankAccount.Bank_Name As Bank_Account_Name , 
                currency.Currency_Symbol, 
                creditCard.Card_Name As Credit_Card_Name , 
		        createdBy.First_Name As Created_By_First_Name, 
                createdBy.Last_Name As Created_By_Last_Name , 
		        lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
                lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name ,
                statementTotalPurchases.Total_Transactions As Total_Purchases
    FROM        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
    JOIN        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
    JOIN        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
    JOIN	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatement.Record_Created_By_User_Id
    LEFT JOIN   t_TLBoard_Bank_Accounts_Transactions bankTransactionDetails 
                    On bankTransactionDetails.Bank_Account_Transaction_Id = CCStatement.Bank_Account_Transaction_Id_Connection
    LEFT JOIN   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatement.Record_Last_Updated_By_User_Id
    LEFT JOIN	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
    LEFT JOIN   (   SELECT      ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id, 
                                Count(ccTransaction.Credit_Card_Statement_Transaction_Id) As Total_Transactions
                    FROM        t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions ccTransaction
                    JOIN        t_TLBoard_Bank_Accounts_Credit_Cards_Statements ccTransactionStatement 
                                ON ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id = ccTransaction.Bank_Account_Credit_Card_Statement_Id
                    JOIN        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = ccTransactionStatement.Bank_Account_Id  
                    WHERE       bankAccount.[User_Id] = @_l_User_Id_Bank_Owner And ccTransaction.Is_Deleted = 0
                    GROUP BY    ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id 
                )   statementTotalPurchases On statementTotalPurchases.Bank_Account_Credit_Card_Statement_Id = CCStatement.Bank_Account_Credit_Card_Statement_Id
    Where       bankAccount.[User_Id] = @_l_User_Id_Bank_Owner AND 
                CCStatement.Is_Deleted = 0 AND 
                -- Statements that are not connected to a bank account transaction
                ( CCStatement.Bank_Account_Transaction_Id_Connection Is Null OR bankTransactionDetails.Bank_Account_Transaction_Id IS NULL) AND
                -- Statements that thier date matches the dates of transaction
                ( Convert(Datetime, Convert(Varchar, CCStatement.Statement_Date, 111)) = @_l_Transaction_Actual_DateTime 
                    OR Convert(Datetime, Convert(Varchar, CCStatement.Statement_Date, 111)) = @_l_Transaction_Value_DateTime )
            
    Order By    CCStatement.Statement_Date desc
END


GO

ALTER PROC p_TLBoard_Update_Bank_Account_Transaction_Connect_With_Statement
@Bank_Account_Transaction_Id BIGINT, 
@Credit_Card_Statement_Id INT, 
@Updating_User_ID INT 
AS 

DECLARE @_l_User_Id_Bank_Owner INT; 
SET @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                WHERE   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id AND
                                        bankDetails.Is_Deleted = 0 AND 
                                        transactionDetails.Is_Deleted = 0 );

IF ( @_l_User_Id_Bank_Owner Is Null Or @Updating_User_ID != @_l_User_Id_Bank_Owner )
BEGIN
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    print 'Unauthorized..';
    Return;
END

Declare @_l_Transaction_Bank_Account_Id INT;
Declare @_l_Credit_Card_Statement_Bank_Account_Id INT;

SET @_l_Transaction_Bank_Account_Id = ( SELECT  bankDetails.Bank_Account_Id
                                        FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                        JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                        WHERE   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id AND
                                                bankDetails.Is_Deleted = 0 AND 
                                                transactionDetails.Is_Deleted = 0 AND
                                                transactionDetails.Bank_Account_Credit_Card_Statement_Id IS NULL )

SET @_l_Credit_Card_Statement_Bank_Account_Id = (   SELECT  bankDetails.Bank_Account_Id
                                                    FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails
                                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
                                                    WHERE   statementDetails.Bank_Account_Credit_Card_Statement_Id = @Credit_Card_Statement_Id AND
                                                            bankDetails.Is_Deleted = 0 AND 
                                                            statementDetails.Is_Deleted = 0 AND
                                                            statementDetails.Bank_Account_Transaction_Id_Connection IS NULL )

IF (    @_l_Transaction_Bank_Account_Id IS NOT NULL AND 
        @_l_Credit_Card_Statement_Bank_Account_Id IS NOT NULL AND
        @_l_Transaction_Bank_Account_Id = @_l_Credit_Card_Statement_Bank_Account_Id     )
BEGIN
    
    print 'Before updates..';

    UPDATE  t_TLBoard_Bank_Accounts_Transactions 
    SET     Is_Credit_Card_Statement_Transaction = 1, 
            Bank_Account_Credit_Card_Statement_Id = @Credit_Card_Statement_Id,
            Record_Last_Updated_By_User_Id = @Updating_User_ID , 
            Record_Last_Updated_DateTime_UTC = GETUTCDATE()  
    WHERE   Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id

    UPDATE  t_TLBoard_Bank_Accounts_Credit_Cards_Statements 
    SET     Bank_Account_Transaction_Id_Connection = @Bank_Account_Transaction_Id ,
            Record_Last_Updated_By_User_Id = @Updating_User_ID , 
            Record_Last_Updated_DateTime_UTC = GETUTCDATE()  
    WHERE   Bank_Account_Credit_Card_Statement_Id = @Credit_Card_Statement_Id

END
ELSE
BEGIN
    print 'Invalid parameters..';
END


GO

ALTER PROC p_TLBoard_Update_Bank_Account_Transaction_Disconnect_Statement
@Bank_Account_Transaction_Id BIGINT, 
@Credit_Card_Statement_Id INT, 
@Updating_User_ID INT 
AS 

DECLARE @_l_User_Id_Bank_Owner INT; 
SET @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                WHERE   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id AND
                                        bankDetails.Is_Deleted = 0 AND 
                                        transactionDetails.Is_Deleted = 0 AND 
                                        transactionDetails.Bank_Account_Credit_Card_Statement_Id IS NOT NULL );

IF ( @_l_User_Id_Bank_Owner Is Null Or @Updating_User_ID != @_l_User_Id_Bank_Owner )
BEGIN
    print 'Unauthorized..';
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    Return;
END

Declare @_l_Transaction_Bank_Account_Id INT;
Declare @_l_Credit_Card_Statement_Bank_Account_Id INT;

SET @_l_Transaction_Bank_Account_Id = ( SELECT  bankDetails.Bank_Account_Id
                                        FROM    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                                        JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
                                        WHERE   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id AND
                                                bankDetails.Is_Deleted = 0 AND 
                                                transactionDetails.Is_Deleted = 0 AND 
                                                transactionDetails.Bank_Account_Credit_Card_Statement_Id IS NOT NULL );

SET @_l_Credit_Card_Statement_Bank_Account_Id = (   SELECT  bankDetails.Bank_Account_Id
                                                    FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails
                                                    JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
                                                    WHERE   statementDetails.Bank_Account_Credit_Card_Statement_Id = @Credit_Card_Statement_Id AND
                                                            bankDetails.Is_Deleted = 0 AND 
                                                            statementDetails.Is_Deleted = 0 AND 
                                                            statementDetails.Bank_Account_Transaction_Id_Connection IS NOT NULL );
IF (    @_l_Transaction_Bank_Account_Id IS NOT NULL AND 
        @_l_Credit_Card_Statement_Bank_Account_Id IS NOT NULL AND
        @_l_Transaction_Bank_Account_Id = @_l_Credit_Card_Statement_Bank_Account_Id     )
BEGIN

    print 'before disconnection updates';

    UPDATE  t_TLBoard_Bank_Accounts_Transactions 
    SET     Is_Credit_Card_Statement_Transaction = 0, 
            Bank_Account_Credit_Card_Statement_Id = NULL,
            Record_Last_Updated_By_User_Id = @Updating_User_ID , 
            Record_Last_Updated_DateTime_UTC = GETUTCDATE()  
    WHERE   Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id

    UPDATE  t_TLBoard_Bank_Accounts_Credit_Cards_Statements 
    SET     Bank_Account_Transaction_Id_Connection = NULL ,
            Record_Last_Updated_By_User_Id = @Updating_User_ID , 
            Record_Last_Updated_DateTime_UTC = GETUTCDATE()  
    WHERE   Bank_Account_Credit_Card_Statement_Id = @Credit_Card_Statement_Id

END
ELSE
BEGIN
    print 'invalid parameters';
END


GO

ALTER Proc [p_TLBoard_Get_Bank_Account_Transaction_Details]
@Bank_Account_Transaction_Record_Id BigInt, 
@User_Id_Bank_Account_Transaction_Owner Int, 
@User_Id_Searching_For_Bank_Account_Transaction_Details Int 
As

Select  transactionDetails.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Bank_Accounts_Transactions transactionDetails
Join	t_TLBoard_Bank_Accounts bankAccountDetails On bankAccountDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = transactionDetails.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = transactionDetails.Record_Last_Updated_By_User_Id
Where	transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Record_Id And
		bankAccountDetails.[User_Id] = @User_Id_Bank_Account_Transaction_Owner And 
		bankAccountDetails.Is_Active = 1 And
		( transactionDetails.Is_Deleted Is Null Or transactionDetails.Is_Deleted = 0 )

GO

ALTER Proc [p_TLBoard_Update_Bank_Account_Transaction_Full_Details]
@Bank_Account_Transaction_Id BigInt,
@Transaction_Account_Balance Decimal(16,2),
@Transaction_Actual_DateTime DateTime,
@Positive_Amount_Entered Decimal(16,2), 
@Negative_Amount_Paid Decimal(16,2), 
@Transaction_Value_DateTime DateTime,
@Reference_Number NVarchar(40),
@Transaction_Bank_Description NVarchar(40),
@Transaction_Bank_Inner_Reference_Code NVarchar(15), 
@User_Description NVarchar(200),
@User_Comments NVarchar(200),
@Is_Visible_To_Anonymous_Users bit,
@Is_Visible_To_Followers_Users bit,
@Updating_User_Id Int
As

UPDATE [dbo].[t_TLBoard_Bank_Accounts_Transactions] 
   SET 
      [Transaction_Account_Balance] = @Transaction_Account_Balance,
      [Transaction_Actual_DateTime] = @Transaction_Actual_DateTime,
      [Positive_Amount_Entered] = @Positive_Amount_Entered,
      [Negative_Amount_Paid] = @Negative_Amount_Paid, 
      [Transaction_Value_DateTime] = @Transaction_Value_DateTime,
      [Reference_Number] = @Reference_Number,
      [Transaction_Bank_Description] = @Transaction_Bank_Description,
      [Transaction_Bank_Inner_Reference_Code] = @Transaction_Bank_Inner_Reference_Code,
      [Transaction_User_Description] = @User_Description,
      [Transaction_User_Comments] = @User_Comments, 
      [Is_Visible_To_Anonymous_Users] = @Is_Visible_To_Anonymous_Users,
      [Is_Visible_To_Followers_Users] = @Is_Visible_To_Followers_Users,
	  [Record_Last_Updated_By_User_Id] = @Updating_User_Id,
      [Record_Last_Updated_DateTime_UTC] = GetUTCDate()
from [t_TLBoard_Bank_Accounts_Transactions] transactionDetails
    inner join t_TLBoard_Bank_Accounts bankAccountDetails on
        transactionDetails.Bank_Account_Id = bankAccountDetails.Bank_Account_Id
WHERE	transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id and 
		bankAccountDetails.[User_Id] = @Updating_User_Id And 
		bankAccountDetails.Is_Active = 1 And
		( transactionDetails.Is_Deleted Is Null Or transactionDetails.Is_Deleted = 0 )


GO

ALTER Proc [dbo].[p_TLBoard_Get_Credit_Card_Statement_Details]
@Bank_Account_Credit_Card_Statement_Id INT, 
@User_ID_Bank_Owner INT, 
@User_ID_Searching INT
As

SELECT      CCStatement.* ,
            bankAccount.[User_Id] As Bank_Account_Owner_User_Id, 
            bankAccount.Bank_Name as Bank_Account_Name , 
            creditCard.Card_Name As Credit_Card_Name,
            currency.Currency_Symbol As Currency_Symbol,
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
FROM        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
JOIN        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
JOIN        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
LEFT JOIN   t_TLBoard_Currencies currency On currency.Currency_Id = CCStatement.Currency_Id
JOIN	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatement.Record_Created_By_User_Id
LEFT JOIN   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatement.Record_Last_Updated_By_User_Id
WHERE       CCStatement.Bank_Account_Credit_Card_Statement_Id = @Bank_Account_Credit_Card_Statement_Id And
            creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id And
            bankAccount.[User_Id] = @User_ID_Bank_Owner And
            @User_ID_Searching = @User_ID_Bank_Owner

GO

ALTER PROC p_TLBoard_Get_Bank_Account_Transactions_By_Date_Unconnected_Transactions_To_Credit_Card_Statements
@Credit_card_Statement_Id INT, 
@User_ID_Searching INT
AS

DECLARE @_l_User_Id_Bank_Owner INT; 
SET @_l_User_Id_Bank_Owner = (  SELECT  bankDetails.[User_Id] As User_Id_Bank_Owner
                                FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails
                                JOIN    t_TLBoard_Bank_Accounts bankDetails on bankDetails.Bank_Account_Id = statementDetails.Bank_Account_Id
                                WHERE   statementDetails.Bank_Account_Credit_Card_Statement_Id = @Credit_card_Statement_Id AND
                                        bankDetails.Is_Deleted = 0 AND 
                                        statementDetails.Is_Deleted = 0 );

IF ( @_l_User_Id_Bank_Owner Is Null Or @User_ID_Searching != @_l_User_Id_Bank_Owner )
BEGIN
    -- Todo.. Implement more comlicated permissions for user's users in the future..
    Return;
END

DECLARE @_l_Statement_Actual_DateTime DATETIME;
--DECLARE @_l_Statement_Value_DateTime DATETIME;

SELECT  @_l_Statement_Actual_DateTime = statementDetails.Statement_Date
FROM    t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails
WHERE   statementDetails.Bank_Account_Credit_Card_Statement_Id = @Credit_card_Statement_Id AND Is_Deleted = 0;

IF (@_l_Statement_Actual_DateTime Is Not Null)
BEGIN 
    SET @_l_Statement_Actual_DateTime = Convert(DATETIME, Convert( VARCHAR, @_l_Statement_Actual_DateTime , 111));
END


SELECT      transactionDetails.* ,
            bankAccount.Bank_Name As Bank_Account_Name , 
            currency.Currency_Symbol, 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name
FROM        t_TLBoard_Bank_Accounts_Transactions transactionDetails
JOIN        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = transactionDetails.Bank_Account_Id
JOIN	    t_TLBoard_Users createdBy On createdBy.[User_Id] = transactionDetails.Record_Created_By_User_Id
LEFT JOIN   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = transactionDetails.Record_Last_Updated_By_User_Id
LEFT JOIN	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
Where       bankAccount.[User_Id] = @_l_User_Id_Bank_Owner AND 
            transactionDetails.Is_Deleted = 0 AND 
            -- Statements that are not connected to a bank account transaction
            transactionDetails.Bank_Account_Credit_Card_Statement_Id Is Null AND
            -- Statements that thier date matches the dates of transaction
            (   (   transactionDetails.Transaction_Actual_DateTime IS NOT NULL AND 
                    Convert(Datetime, Convert(Varchar, transactionDetails.Transaction_Actual_DateTime, 111)) = @_l_Statement_Actual_DateTime  ) OR
                (   transactionDetails.Transaction_Value_DateTime IS NOT NULL AND 
                    Convert(Datetime, Convert(Varchar, transactionDetails.Transaction_Value_DateTime, 111)) = @_l_Statement_Actual_DateTime ) )
            
Order By    transactionDetails.Transaction_Actual_DateTime desc


GO


ALTER Proc [dbo].[p_TLBoard_Get_Bank_Accounts_Search]
@user_Id Int 
As

Select      bankAccount.* , 
            currency.Currency_Symbol, 
            country.Country_English_Name As Branch_Country_Name,
            [Latest_Transaction_Details].Transaction_Actual_DateTime As Latest_Transaction_Actual_DateTime,
            [Latest_Transaction_Details].Transaction_Account_Balance As Latest_Transaction_Account_Balance
From        t_TLBoard_Bank_Accounts bankAccount
Left Join   t_TLBoard_Countries country on country.Country_Id = bankaccount.Branch_Country_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
Left Join ( Select  t.Bank_Account_Id, Max(Bank_Account_Transaction_Id) as Latest_Bank_Account_Transaction_Id
            from    t_TLBoard_Bank_Accounts_Transactions t
            Join    t_TLBoard_Bank_Accounts b2 on t.Bank_Account_Id = b2.Bank_Account_Id
            Join    (   Select  t_TLBoard_Bank_Accounts_Transactions.Bank_Account_Id , Max(Transaction_Actual_DateTime) As Max_Date_Transaction_Per_Bank
                        from    t_TLBoard_Bank_Accounts_Transactions
                        Join    t_TLBoard_Bank_Accounts b on b.Bank_Account_Id = t_TLBoard_Bank_Accounts_Transactions.Bank_Account_Id
                        where   b.[User_Id] = @user_Id
                        Group By t_TLBoard_Bank_Accounts_Transactions.Bank_Account_Id ) m 
                            On m.Bank_Account_Id = t.Bank_Account_Id and m.Max_Date_Transaction_Per_Bank = t.Transaction_Actual_DateTime
            Where b2.[User_Id] = @user_Id And t.Is_Deleted = 0
            Group By t.Bank_Account_Id ) Latest_Transaction
                On Latest_Transaction.Bank_Account_Id = bankAccount.Bank_Account_Id
Left Join t_TLBoard_Bank_Accounts_Transactions [Latest_Transaction_Details] 
    On [Latest_Transaction_Details].Bank_Account_Transaction_Id = [Latest_Transaction].Latest_Bank_Account_Transaction_Id
Where   bankAccount.[User_Id] = @user_Id And (bankAccount.Is_Deleted = 0 Or bankAccount.Is_Deleted Is Null)


GO







