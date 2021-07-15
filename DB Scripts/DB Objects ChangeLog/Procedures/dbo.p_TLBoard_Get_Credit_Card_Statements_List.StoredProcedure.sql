SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Credit_Card_Statements_List]
@User_ID_Bank_Owner Int, 
@Bank_Account_Id Int, 
@User_ID_Searching Int
As

Select      CCStatement.* ,
            bankAccount.Bank_Name As Bank_Account_Name , 
            currency.Currency_Symbol, 
            creditCard.Card_Name As Credit_Card_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name ,
            statementTotalPurchases.Total_Transactions As Total_Purchases
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatement.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatement.Record_Last_Updated_By_User_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
Left Join   (   Select      ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id, 
                            Count(ccTransaction.Credit_Card_Statement_Transaction_Id) As Total_Transactions
                From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions ccTransaction
                Join        t_TLBoard_Bank_Accounts_Credit_Cards_Statements ccTransactionStatement 
                            ON ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id = ccTransaction.Bank_Account_Credit_Card_Statement_Id
                Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = ccTransactionStatement.Bank_Account_Id  
                Where       bankAccount.[User_Id] = @User_ID_Bank_Owner And ccTransaction.Is_Deleted = 0
                Group By    ccTransactionStatement.Bank_Account_Credit_Card_Statement_Id 
            )   statementTotalPurchases On statementTotalPurchases.Bank_Account_Credit_Card_Statement_Id = CCStatement.Bank_Account_Credit_Card_Statement_Id
Where       bankAccount.[User_Id]       = @User_ID_Bank_Owner And
            @User_ID_Searching          = @User_ID_Bank_Owner And
            ( @Bank_Account_Id Is Null Or @Bank_Account_Id <= 0 Or bankAccount.Bank_Account_Id = @Bank_Account_Id )
Order By    CCStatement.Statement_Date desc

GO
