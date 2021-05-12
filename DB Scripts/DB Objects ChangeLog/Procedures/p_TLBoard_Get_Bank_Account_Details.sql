SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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

GO
