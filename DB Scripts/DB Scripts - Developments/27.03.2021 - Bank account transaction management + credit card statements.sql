Use [DashboardTimeLine]; 

Go


/* Todo: 

1) Bank account transaction management (Add documents/invoices/expense)
2) Bank account transaction credit card statement
3) Connect documents/invoices/expense to credit cart statement transactions

*/

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Bank_Account_Transaction_Full_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Bank_Account_Transaction_Full_Details]
End

Go

CREATE Proc [dbo].[p_TLBoard_Update_Bank_Account_Transaction_Full_Details]
@Bank_Account_Transaction_Id Int,
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

Go

ALTER Proc [dbo].[p_TLBoard_Get_Bank_Account_Transaction_Details]
@Bank_Account_Transaction_Record_Id Int, 
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

Go

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------  ABILITY TO Search/Connect with documents/expenses/invoices ect  ------- 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

/* Todo: 
    
    1) Enable to search / filter manually system documents/invoices/expenses
    2) Enable to select few of them and click "Connect" / "Save" and they will apear as connected documents
    3) Enable to remove / hide connected documents/expenses/invoices
    4) Show documents suggestions for the transaction

*/

Go










