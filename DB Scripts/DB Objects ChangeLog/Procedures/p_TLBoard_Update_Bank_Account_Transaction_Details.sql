SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
