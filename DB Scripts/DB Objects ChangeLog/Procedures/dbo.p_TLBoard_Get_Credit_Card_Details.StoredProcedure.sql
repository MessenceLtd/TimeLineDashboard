SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Credit_Card_Details]
@Credit_Card_Id Int, 
@User_Id_Owner Int, 
@User_Id_Searching_For_Credit_Card Int
As 

Select	creditCard.* , 
        bankAccount.Bank_Name as Bank_Account_Name ,
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Credit_Cards creditCard
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = creditCard.Record_Created_By_User_Id
Left Join t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = creditCard.Record_Last_Updated_By_User_Id
Join    t_TLBoard_Bank_Accounts bankAccount On creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id
Where	creditCard.[Credit_Card_Id] = @Credit_Card_Id And creditCard.[User_Id] = @User_Id_Owner 
		And ( creditCard.Is_Deleted Is Null Or creditCard.Is_Deleted = 0 )  

GO
