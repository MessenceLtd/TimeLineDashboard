SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transactions_IDs]
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

GO
