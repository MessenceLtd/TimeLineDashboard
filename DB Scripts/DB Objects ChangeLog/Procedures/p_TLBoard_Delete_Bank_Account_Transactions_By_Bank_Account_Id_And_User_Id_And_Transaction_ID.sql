SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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

GO
