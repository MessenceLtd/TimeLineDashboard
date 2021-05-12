SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Bank_Account_Transaction_Details]
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

GO
