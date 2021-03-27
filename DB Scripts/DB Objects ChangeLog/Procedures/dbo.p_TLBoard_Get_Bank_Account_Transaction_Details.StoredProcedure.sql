SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Bank_Account_Transaction_Details]
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

GO
