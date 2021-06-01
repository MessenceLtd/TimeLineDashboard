SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Credit_Card_Statement_Transactions_List]
@Bank_Account_Credit_Card_Statement_Id Int, 
@User_ID_Bank_Owner Int, 
@User_ID_Searching Int
As

Select      statementTransactions.* ,
            bankAccount.[User_Id] As Bank_Account_Owner_User_Id, 
            bankAccount.Bank_Name as Bank_Account_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
Join        t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions statementTransactions 
                On statementTransactions.Bank_Account_Credit_Card_Statement_Id = CCStatement.Bank_Account_Credit_Card_Statement_Id
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = statementTransactions.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = statementTransactions.Record_Last_Updated_By_User_Id
Where       CCStatement.Bank_Account_Credit_Card_Statement_Id = @Bank_Account_Credit_Card_Statement_Id And
            creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id And
            bankAccount.[User_Id] = @User_ID_Bank_Owner And
            @User_ID_Searching = @User_ID_Bank_Owner And
            statementTransactions.Is_Deleted = 0

GO
