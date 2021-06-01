SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Credit_Cards_Search]
@User_Id Int , @Bank_Account_Id Int 
As

Select  creditCard.* ,
        bankAccount.Bank_Name as Bank_Account_Name
From    t_TLBoard_Credit_Cards creditCard
Join    t_TLBoard_Bank_Accounts bankAccount On creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id
Where   creditCard.[User_Id] = @User_Id And 
        (creditCard.Is_Deleted = 0 Or creditCard.Is_Deleted Is Null) And 
        (@Bank_Account_Id Is Null Or creditCard.Bank_Account_Id = @Bank_Account_Id)

GO
