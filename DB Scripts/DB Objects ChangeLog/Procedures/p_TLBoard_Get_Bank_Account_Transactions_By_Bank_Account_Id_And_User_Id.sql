SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
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

GO
