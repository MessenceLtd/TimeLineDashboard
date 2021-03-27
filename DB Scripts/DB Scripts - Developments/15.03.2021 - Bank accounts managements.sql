Use [DashboardTimeLine]; 

Go

/* Todo: 
1) p_TLBoard_Get_Bank_Account_Transaction_Details
2) Insert_New_Bank_Account_Transaction_Details
3) Update_Bank_Account_Transaction_Details
4) Get_Bank_Account_Transactions_By_Bank_Account_User_Id
5) Create_Bank_Account_Transaction_Details_From_Data_Row
*/

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Bank_Account_Transaction_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Bank_Account_Transaction_Details]
End

Go

Create Proc p_TLBoard_Get_Bank_Account_Transaction_Details
@Bank_Account_Transaction_Record_Id Int, 
@User_Id_Bank_Account_Transaction_Owner Int, 
@User_Id_Searching_For_Bank_Account_Transaction_Details Int 
As

Select  transactionDetails.* 
From	t_TLBoard_Bank_Accounts_Transactions transactionDetails
Join	t_TLBoard_Bank_Accounts bankAccountDetails On bankAccountDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
Where	transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Record_Id And
		bankAccountDetails.[User_Id] = @User_Id_Bank_Account_Transaction_Owner And 
		bankAccountDetails.Is_Active = 1 And
		( transactionDetails.Is_Deleted Is Null Or transactionDetails.Is_Deleted = 0 )

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Bank_Account_Transaction_Details'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Bank_Account_Transaction_Details]
End

Go

Create Proc p_TLBoard_Insert_Bank_Account_Transaction_Details
@Bank_Account_Id int, 
@Transaction_Account_Balance Decimal(16,2),
@Transaction_Actual_DateTime DateTime,
@Positive_Amount_Entered Decimal(16,2), 
@Negative_Amount_Paid Decimal(16,2), 
@Transaction_Value_DateTime DateTime,
@Reference_Number NVarchar(40),
@Transaction_Bank_Description NVarchar(40),
@Transaction_Bank_Inner_Reference_Code NVarchar(15), 
@Is_Visible_To_Anonymous_Users bit,
@Is_Visible_To_Followers_Users bit,
@Creating_User_Id Int
As


INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Transactions]
           (Bank_Account_Id, 
			Transaction_Account_Balance,
			Transaction_Actual_DateTime,
			Positive_Amount_Entered, 
			Negative_Amount_Paid, 
			Transaction_Value_DateTime,
			Reference_Number,
			Transaction_Bank_Description,
			Transaction_Bank_Inner_Reference_Code, 
			Is_Visible_To_Anonymous_Users,
			Is_Visible_To_Followers_Users,
			Record_Created_By_User_Id,
			Record_Creation_DateTime_UTC,
			Record_Last_Updated_By_User_Id,
			Record_Last_Updated_DateTime_UTC )
     VALUES
           (@Bank_Account_Id, 
			@Transaction_Account_Balance,
			@Transaction_Actual_DateTime,
			@Positive_Amount_Entered, 
			@Negative_Amount_Paid, 
			@Transaction_Value_DateTime,
			@Reference_Number,
			@Transaction_Bank_Description,
			@Transaction_Bank_Inner_Reference_Code, 
			@Is_Visible_To_Anonymous_Users,
			@Is_Visible_To_Followers_Users,
			@Creating_User_Id,
			GETUTCDATE(),
			@Creating_User_Id,
			GETUTCDATE() )


Select @@IDENTITY;

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Bank_Account_Transaction_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Bank_Account_Transaction_Details]
End

Go

Create Proc p_TLBoard_Update_Bank_Account_Transaction_Details
@Bank_Account_Transaction_Id Int,
@Transaction_Account_Balance Decimal(16,2),
@Transaction_Actual_DateTime DateTime,
@Positive_Amount_Entered Decimal(16,2), 
@Negative_Amount_Paid Decimal(16,2), 
@Transaction_Value_DateTime DateTime,
@Reference_Number NVarchar(40),
@Transaction_Bank_Description NVarchar(40),
@Transaction_Bank_Inner_Reference_Code NVarchar(15), 
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
 
If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id'  ))
Begin
	Drop Proc [p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id]
End

Go
 
Create Proc p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id
@Page_Number Int, 
@Rows_Per_Page Int,
@Bank_Account_Id Int, 
@User_Id_Bank_Account_Owner Int, 
@User_Id_Searching_For_Bank_Account_Transactions Int, 
@Total_Records Int OutPut
As

Set @Total_Records  = (
	Select	Count(transactionDetails.Bank_Account_Transaction_Id) 
	From	t_TLBoard_Bank_Accounts_Transactions transactionDetails
	Join	t_TLBoard_Bank_Accounts bankAccountDetails On bankAccountDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
	Where	transactionDetails.Bank_Account_Id = @Bank_Account_Id And
			bankAccountDetails.[User_Id] = @User_Id_Bank_Account_Owner And 
			bankAccountDetails.Is_Active = 1 And
			( transactionDetails.Is_Deleted Is Null Or transactionDetails.Is_Deleted = 0 ) );

Select	transactionDetails.* 
From	t_TLBoard_Bank_Accounts_Transactions transactionDetails
Join	t_TLBoard_Bank_Accounts bankAccountDetails On bankAccountDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
Where	transactionDetails.Bank_Account_Id = @Bank_Account_Id And
		bankAccountDetails.[User_Id] = @User_Id_Bank_Account_Owner And 
		bankAccountDetails.Is_Active = 1 And
		( transactionDetails.Is_Deleted Is Null Or transactionDetails.Is_Deleted = 0 )
Order By transactionDetails.Transaction_Actual_DateTime desc , transactionDetails.Bank_Account_Transaction_Id desc
OFFSET ((@Page_Number - 1) * @Rows_Per_Page) ROWS
FETCH NEXT @Rows_Per_Page ROWS ONLY;

Go

--Declare @TotalRecords Int;
--Exec p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id 1, 25,1,1,1, @TotalRecords OutPut

--Select @TotalRecords;


--select * From t_TLBoard_Bank_Accounts
--select * from t_TLBoard_Users
--delete from temp_MyBankTransactions
--delete from t_TLBoard_Bank_Accounts_Transactions
--delete from temp_MyBankTransactions where [Transaction_Actual_DateTime] is null
--select * from [t_TLBoard_Bank_Accounts_Transactions]

--INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Transactions]
--           ([Bank_Account_Id]
--           ,[Transaction_Account_Balance]
--           ,[Transaction_Actual_DateTime]
--           ,[Positive_Amount_Entered]
--           ,[Negative_Amount_Paid]
--           ,[Transaction_Value_DateTime]
--           ,[Reference_Number]
--           ,[Transaction_Bank_Description]
--           ,[Transaction_Bank_Inner_Reference_Code]
--           ,[Transaction_User_Description]
--           ,[Transaction_User_Comments]
--           ,[Is_Visible_To_Anonymous_Users]
--           ,[Is_Visible_To_Followers_Users]
--           ,[Is_Credit_Card_Statement_Transaction]
--           ,[Record_Created_By_User_Id]
--           ,[Record_Creation_DateTime_UTC]
--           ,[Record_Last_Updated_By_User_Id]
--           ,[Record_Last_Updated_DateTime_UTC]
--           ,[Is_Deleted]
--           ,[Record_Deleted_By_User_Id]
--           ,[Record_Deleted_DateTime_UTC])
     
--	 Select 
--		1 As Bankid,
--		Transaction_Account_Balance, 
--		Transaction_Actual_DateTime, 
--		Positive_Amount_Entered, 
--		Negative_Amount_Paid, 
--		Transaction_Value_DateTime, 
--		Reference_Number, 
--		Transaction_Bank_Description, 
--		Transaction_Bank_Inner_Reference_Code,
--		'' As UserDesc, 
--		'' As UserComments, 
--		0, 
--		0, 
--		0, 
--		1,
--		GetUtcDate(),
--		1,
--		GetUtcDate(),
--		0,null,null
--	 From	temp_MyBankTransactions
--	 Order by Recid


--select * from t_TLBoard_Bank_Accounts
--GO

--Update t_TLBoard_Bank_Accounts_Transactions set Is_Deleted = 0
--Update t_TLBoard_Bank_Accounts set Is_Active = 1 Where Bank_Account_Id = 1

--
---- Left over things todo:
/* Tasks for March 2021
1) SQL Paging support for bank account transactions retrival
2) SQL Query builder for returning bank transactions by ID Array 
3) Test Insert / Update process
3.5) Add support with ajax session expiration (Because there might be a chance whole page has been timed out since user started working on it )
3.8) Show warning if user is paging out without saving changes ( + allow saving and paging to next page on same confirmation)
4) The most complicated.. Test excel import data with a given template. 
The insert from template/excel will be done with closedxml library 
it should be smart enough to detect if records are in descending order or ascending 
it should be able to deal with multiply date formats (?) 
Try to also support import data from CSV. 
5) Create a page to manage the actual bank account transactions with Edit/View 
6) Add a place in the bank account transactions to attach documents/expense/invoices and other documentation
7) Create a page to view all users bankaccounts and to add new bank account (and edit/view it with manage page) 

*/

-- starting from SQL Paging support for bank account transactions retrival
-- 15.03.2021 00:00 finished today working on the sql paging but.. Having a serious headache with rendering the paging 
-- Starting to feel i need a gridview solution instead of manually rendering the pager.. Need to sleep it over
-- Or just show all the damn pages in one stack with simple rendering.. 
-- I dont think people who will use it will get to +50 pages anyways  
Go

-- 16.03.2021 ~00:00 -- 
/*
original todos
<%--Todo For tommorow --%>
<%--implement paging with Previous, 1 , 2 ... 10  Next 
if There are more than 10 pages ( more than 250 total rows)
Show:
Previous 1 ...(... =button for -10 pages) 
Bleh... Just thinking about it makes me wanna drop repeater solution for grid solution--%>
-----------
Actually implemented the all pages 

*/

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transactions_IDs'  ))
Begin
	Drop Proc [p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transactions_IDs]
End

Go

Create Proc p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transactions_IDs
@Bank_Account_Id Int, 
@Transcations_IDs_Array Varchar(1000), 
@User_Id_Searching_For_Bank_Account_Transactions Int 
As

Declare @_l_BankAccount_Transactions_IDs Table ( Bank_Account_Transaction_ID Int );

Insert Into @_l_BankAccount_Transactions_IDs
SELECT Convert(int, value) FROM STRING_SPLIT( @Transcations_IDs_Array , ',' ) Order By value

Select	transactionDetails.* 
From	t_TLBoard_Bank_Accounts_Transactions transactionDetails
Join	t_TLBoard_Bank_Accounts bankAccountDetails On bankAccountDetails.Bank_Account_Id = transactionDetails.Bank_Account_Id
Where	transactionDetails.Bank_Account_Id = @Bank_Account_Id And
		transactionDetails.Bank_Account_Transaction_Id In ( Select Bank_Account_Transaction_ID From @_l_BankAccount_Transactions_IDs ) And
		bankAccountDetails.[User_Id] = @User_Id_Searching_For_Bank_Account_Transactions And 
		bankAccountDetails.Is_Active = 1 And
		( transactionDetails.Is_Deleted Is Null Or transactionDetails.Is_Deleted = 0 )
Order By transactionDetails.Transaction_Actual_DateTime desc , transactionDetails.Bank_Account_Transaction_Id desc

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Delete_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transaction_ID'  ))
Begin
	Drop Proc [p_TLBoard_Delete_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transaction_ID]
End

Go

Create Proc p_TLBoard_Delete_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transaction_ID
@Bank_Account_Id Int, 
@Bank_Account_Transaction_ID Int, 
@Updating_User_Id Int 
As

Update	t_TLBoard_Bank_Accounts_Transactions
Set		Is_Deleted = 1
from	[t_TLBoard_Bank_Accounts_Transactions] transactionDetails
		inner join t_TLBoard_Bank_Accounts bankAccountDetails on
			transactionDetails.Bank_Account_Id = bankAccountDetails.Bank_Account_Id
WHERE	transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_ID and 
		transactionDetails.Bank_Account_Id = @Bank_Account_Id And
		bankAccountDetails.[User_Id] = @Updating_User_Id And 
		bankAccountDetails.Is_Active = 1 And
		( transactionDetails.Is_Deleted Is Null Or transactionDetails.Is_Deleted = 0 )

Go

----------------------

/*

Left Over Assignments 
-- Show error message if user navigates away without saving. 
-- Show edited rows with different css class
-- Reset the navigation warning after successfull save
-- Try to show error records with CssClass that were not saved successfully
-- Build the transaction Details page (manage_BankAccountTransaction.aspx)

*/

----------------------

----------------------
/*  21.03.2021

-- Hide deleted rows
-- Show edited rows with different css class
-- Try to show error records with CssClass that were not saved successfully
-- Process only edited rows / New rows
-- Build the transaction Details page (manage_BankAccountTransaction.aspx)

Done: Hide deleted rows
Done: Show edited rows with different css class
Done: Process only edited rows / New rows

This is Hard! -- Try to show error records with CssClass that were not saved successfully! 
Done: Try to show error records with CssClass that were not saved successfully

+ tried a sanity test with entering values for the last month. 

-----------------------------------
Next Todos : 

-- Build the add bank account page
-- Build the manage/view/edit bank account page 
-- Build the list bank account page 
-- Add a button in the list bank account page to view the transactions
-- Build the transaction Details page (manage_BankAccountTransaction.aspx)
-- Try to add excel integration that will import the excel (+ Show the template of the excel's transactions so use will be able to upload/sync transactions from excel ) 
-- Excel integration should be done with the ClosedXML library 

*/

Go


--Declare @Total_Records Int;
--Exec p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id 1, 25, 1, 1, 1 , @Total_Records OutPut 
--Select @Total_Records

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Bank_Accounts_Search'  ))
Begin
	Drop Proc [p_TLBoard_Get_Bank_Accounts_Search]
End

Go

Create Proc p_TLBoard_Get_Bank_Accounts_Search
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
            Where b2.[User_Id] = @user_Id
            Group By t.Bank_Account_Id ) Latest_Transaction
                On Latest_Transaction.Bank_Account_Id = bankAccount.Bank_Account_Id
Left Join t_TLBoard_Bank_Accounts_Transactions [Latest_Transaction_Details] 
    On [Latest_Transaction_Details].Bank_Account_Transaction_Id = [Latest_Transaction].Latest_Bank_Account_Transaction_Id
Where   bankAccount.[User_Id] = @user_Id And (bankAccount.Is_Deleted = 0 Or bankAccount.Is_Deleted Is Null)

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Bank_Account_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Bank_Account_Details]
End

Go

Create Proc p_TLBoard_Get_Bank_Account_Details
@Bank_Account_Id Int , @User_Id Int
As

Select  bankAccount.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From    t_TLBoard_Bank_Accounts bankAccount
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = bankAccount.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = bankAccount.Record_Last_Updated_By_User_Id
Where   bankAccount.Bank_Account_Id = @Bank_Account_Id And 
        bankAccount.[User_Id] = @user_Id And 
        (bankAccount.Is_Deleted = 0 Or bankAccount.Is_Deleted Is Null)

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Bank_Account_Details'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Bank_Account_Details]
End

Go

Create Proc p_TLBoard_Insert_Bank_Account_Details
@Bank_Name                                      nvarchar(40),
@Bank_Number                                    nvarchar(10),
@Branch_Name                                    nvarchar(40),
@Branch_Number                                  nvarchar(50),
@Account_Number                                 nvarchar(50),
@Account_Name                                   nvarchar(50),
@IBAN                                           nvarchar(50),
@Currency_Id                                    TinyInt,
@Opened_Account_DateTime                        DateTime,
@Branch_Country_Id                              Smallint,
@Branch_State_Id                                Smallint,
@Branch_City                                    NVarChar(100),
@Branch_Address_Description                     nvarchar(255),
@Branch_ZipCode                                 nvarchar(20),
@Branch_Phone                                   nvarchar(50),
@Branch_Main_Email_Address                      nvarchar(100),
@Branch_Main_Contact                            nvarchar(100),
@Main_Contact_Phone_Number                      nvarchar(50),
@Account_Active_From_Date                       datetime,
@Account_Active_To_Date                         datetime,
@Is_Visible_To_Anonymous_Users                  bit,
@Is_Available_For_Download_For_Anonymous_Users  bit,
@Is_Visible_To_Followers_Users                  bit,
@Is_Available_For_Download_For_Followers_Users  bit,
@Is_Active                                      bit,
@Creating_User_Id                               int
As

INSERT INTO [dbo].[t_TLBoard_Bank_Accounts]
           ([User_Id]
           ,[Bank_Name]
           ,[Bank_Number]
           ,[Branch_Name]
           ,[Branch_Number]
           ,[Account_Number]
           ,[Account_Name]
           ,[IBAN]
           ,[Currency_Id]
           ,[Opened_Account_DateTime]
           ,[Branch_Country_Id]
           ,[Branch_State_Id]
           ,[Branch_City]
           ,[Branch_Address_Description]
           ,[Branch_ZipCode]
           ,[Branch_Phone]
           ,[Branch_Main_Email_Address]
           ,[Branch_Main_Contact]
           ,[Main_Contact_Phone_Number]
           ,[Account_Active_From_Date]
           ,[Account_Active_To_Date]
           ,[Is_Visible_To_Anonymous_Users]
           ,[Is_Available_For_Download_For_Anonymous_Users]
           ,[Is_Visible_To_Followers_Users]
           ,[Is_Available_For_Download_For_Followers_Users]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           ,[Is_Active]
           ,[Is_Deleted])
     VALUES
           (@Creating_User_Id, 
            @Bank_Name, 
            @Bank_Number,
            @Branch_Name, 
            @Branch_Number, 
            @Account_Number, 
            @Account_Name,
            @IBAN, 
            @Currency_Id,
            @Opened_Account_DateTime, 
            @Branch_Country_Id,
            @Branch_State_Id,
            @Branch_City,
            @Branch_Address_Description,
            @Branch_ZipCode,
            @Branch_Phone, 
            @Branch_Main_Email_Address,
            @Branch_Main_Contact,
            @Main_Contact_Phone_Number,
            @Account_Active_From_Date,
            @Account_Active_To_Date,
            @Is_Visible_To_Anonymous_Users,
            @Is_Available_For_Download_For_Anonymous_Users ,
            @Is_Visible_To_Followers_Users ,
            @Is_Available_For_Download_For_Followers_Users ,
            @Creating_User_Id,
            GETUTCDATE(),
            @Creating_User_Id,
            GETUTCDATE(),
            @Is_Active, 
            0 )

Select @@IDENTITY;

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Bank_Account_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Bank_Account_Details]
End

Go

Create Proc p_TLBoard_Update_Bank_Account_Details
@Bank_Account_Id                                Int,
@Bank_Name                                      nvarchar(40),
@Bank_Number                                    nvarchar(10),
@Branch_Name                                    nvarchar(40),
@Branch_Number                                  nvarchar(50),
@Account_Number                                 nvarchar(50),
@Account_Name                                   nvarchar(50),
@IBAN                                           nvarchar(50),
@Currency_Id                                    TinyInt,
@Opened_Account_DateTime                        DateTime,
@Branch_Country_Id                              Smallint,
@Branch_State_Id                                Smallint,
@Branch_City                                    NVarChar(100),
@Branch_Address_Description                     nvarchar(255),
@Branch_ZipCode                                 nvarchar(20),
@Branch_Phone                                   nvarchar(50),
@Branch_Main_Email_Address                      nvarchar(100),
@Branch_Main_Contact                            nvarchar(100),
@Main_Contact_Phone_Number                      nvarchar(50),
@Account_Active_From_Date                       datetime,
@Account_Active_To_Date                         datetime,
@Is_Visible_To_Anonymous_Users                  bit,
@Is_Available_For_Download_For_Anonymous_Users  bit,
@Is_Visible_To_Followers_Users                  bit,
@Is_Available_For_Download_For_Followers_Users  bit,
@Is_Active                                      bit,
@Updating_User_Id                               int
As

UPDATE  [dbo].[t_TLBoard_Bank_Accounts]
SET     [Bank_Name]     = @Bank_Name    ,
        [Bank_Number]   = @Bank_Number  ,
        [Branch_Name]   = @Branch_Name  ,
        [Branch_Number] = @Branch_Number, 
        [Account_Number] = @Account_Number, 
        [Account_Name] = @Account_Name,
        [IBAN] = @IBAN,
        [Currency_Id] = @Currency_Id, 
        [Opened_Account_DateTime] = @Opened_Account_DateTime,
        [Branch_Country_Id] = @Branch_Country_Id, 
        [Branch_State_Id] = @Branch_State_Id, 
        [Branch_City] = @Branch_City,
        [Branch_Address_Description] = @Branch_Address_Description,
        [Branch_ZipCode] = @Branch_ZipCode,
        [Branch_Phone] = @Branch_Phone, 
        [Branch_Main_Email_Address] = @Branch_Main_Email_Address , 
        [Branch_Main_Contact] = @Branch_Main_Contact , 
        [Main_Contact_Phone_Number] = @Main_Contact_Phone_Number , 
        [Account_Active_From_Date] = @Account_Active_From_Date,
        [Account_Active_To_Date] = @Account_Active_To_Date, 
        [Is_Visible_To_Anonymous_Users] = @Is_Visible_To_Anonymous_Users,
        [Is_Available_For_Download_For_Anonymous_Users] = @Is_Available_For_Download_For_Anonymous_Users,
        [Is_Visible_To_Followers_Users] = @Is_Visible_To_Followers_Users,
        [Is_Available_For_Download_For_Followers_Users] = @Is_Available_For_Download_For_Followers_Users,
        [Record_Last_Updated_By_User_Id] = @Updating_User_Id,
        [Record_Last_Updated_DateTime_UTC] = GetUtcDate(),
        [Is_Active] = @Is_Active
WHERE   Bank_Account_Id = @Bank_Account_Id And User_Id = @Updating_User_Id And (Is_Deleted = 0 Or Is_Deleted Is Null)

GO

--update t_TLBoard_Bank_Accounts set Is_Deleted = 0

--update t_TLBoard_Bank_Accounts set 
--        [Is_Visible_To_Anonymous_Users] = 0,
--        [Is_Available_For_Download_For_Anonymous_Users] = 0,
--        [Is_Visible_To_Followers_Users] = 0,
--        [Is_Available_For_Download_For_Followers_Users] = 0
--exec p_TLBoard_Get_Bank_Account_Details 1 ,1 
--select * from t_TLBoard_Bank_Accounts
--update t_TLBoard_Bank_Accounts set 
--    [Record_Created_By_User_Id] = 1,
--    [Record_Creation_DateTime_UTC] = GETUTCDATE(),
--    [Record_Last_Updated_By_User_Id] = 1,
--    [Record_Last_Updated_DateTime_UTC] = GETUTCDATE()
--select * from t_TLBoard_Users

/*  21.03.2021
-----------------------------------
Next Todos : 

DONE*: -- Build the add bank account page
DONE*: -- Build the manage/view/edit bank account page 
-- Build the list bank account page 
-- Add a button in the list bank account page to view the transactions
-- Build the transaction Details page (manage_BankAccountTransaction.aspx)
-- Try to add excel integration that will import the excel (+ Show the template of the excel's transactions so use will be able to upload/sync transactions from excel ) 
-- Excel integration should be done with the ClosedXML library 
* Without too much QA.. 
Tommorow TODO: 
-- Build the list bank account page 
-- Add a button in the list bank account page to view the transactions
-- Build the transaction Details page (manage_BankAccountTransaction.aspx)

*/


Go

--Select  [transaction].Bank_Account_Id,
--        --Max([transaction].Transaction_Actual_DateTime) As Latest_Transaction_Actual_DateTime
--        Max([transaction].Bank_Account_Transaction_Id) As Latest_Bank_Account_Transaction_Id
--From    t_TLBoard_Bank_Accounts_Transactions [transaction]
--Join    t_TLBoard_Bank_Accounts transactionBank 
--    On transactionBank.Bank_Account_Id = [transaction].Bank_Account_Id
--Where   transactionBank.[User_Id] = 1 And [transaction].Is_Deleted = 0
--Group By [transaction].Bank_Account_Id
----Order By [transaction].Transaction_Actual_DateTime Desc, [transaction].Bank_Account_Transaction_Id Desc


--Select  Latest_Transaction_Details.Bank_Account_Id, 
--        Latest_Transaction_Details.Transaction_Actual_DateTime, 
--        Latest_Transaction_Details.Transaction_Account_Balance
--From    t_TLBoard_Bank_Accounts_Transactions Latest_Transaction_Details
--Join ( Select  [transaction].Bank_Account_Id,
--                    --Max([transaction].Transaction_Actual_DateTime) As Latest_Transaction_Actual_DateTime
--                    Max([transaction].Bank_Account_Transaction_Id) As Latest_Bank_Account_Transaction_Id
--            From    t_TLBoard_Bank_Accounts_Transactions [transaction]
--            Join    t_TLBoard_Bank_Accounts transactionBank 
--                On transactionBank.Bank_Account_Id = [transaction].Bank_Account_Id
--            Where   transactionBank.[User_Id] = 1 And [transaction].Is_Deleted = 0
--            Group By [transaction].Bank_Account_Id ) Latest_Bank_Transaction On 
--                Latest_Transaction_Details.Bank_Account_Id = Latest_Bank_Transaction.Bank_Account_Id And 

--Where Latest_Transaction_Details.Bank_Account_Transaction_Id = Latest_Bank_Transaction.Latest_Bank_Account_Transaction_Id 

--delete from t_TLBoard_Bank_Accounts_Transactions where Is_Deleted = 1
--Update t_TLBoard_Bank_Accounts_Transactions set Is_Deleted = 1
--exec p_TLBoard_Get_Bank_Accounts_Search 1 
--Update t_TLBoard_Bank_Accounts_Transactions set Is_Deleted = 0
--select * From t_TLBoard_Bank_Accounts_Transactions order by Bank_Account_Transaction_Id desc

--SELECT      bank.Account_Name, trans.Transaction_Account_Balance
--FROM        t_TLBoard_Bank_Accounts bank
--LEFT JOIN   t_TLBoard_Bank_Accounts_Transactions trans ON trans.Bank_Account_Id = bank.Bank_Account_Id
--AND         trans.Transaction_Actual_DateTime = ( SELECT   MAX (c.Transaction_Actual_DateTime) 
--                                                  FROM     t_TLBoard_Bank_Accounts_Transactions c 
--                                                  WHERE    trans.Bank_Account_Id = c.Bank_Account_Id
--                                                  AND      c.Transaction_Actual_DateTime <= trans.Transaction_Actual_DateTime)
exec p_TLBoard_Get_Bank_Accounts_Search 1 

/*
Status -- From Latest TODO: 
Done: -- Build the list bank account page 
Done: -- Add a button in the list bank account page to view the transactions
Tommorow/Later -- Build the transaction Details page (manage_BankAccountTransaction.aspx)

*/






