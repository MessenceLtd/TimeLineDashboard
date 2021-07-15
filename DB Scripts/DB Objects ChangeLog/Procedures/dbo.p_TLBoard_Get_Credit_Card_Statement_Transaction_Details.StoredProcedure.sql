SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Credit_Card_Statement_Transaction_Details]
@User_Id_Bank_Owner Int,
@Credit_Card_Statement_Transaction_Id BigInt,
@Searching_User_Id Int
AS


Select      CCStatementTransaction.* ,
            bankAccount.Bank_Account_Id As Bank_Account_Id , 
            bankAccount.Bank_Name As Bank_Account_Name , 
            currency.Currency_Symbol As Bank_Currency_Symbol, 
            TransactionCurrency.Currency_Symbol As Payment_Currency ,
            creditCard.Credit_Card_Id As Credit_Card_Id , 
            creditCard.Card_Name As Credit_Card_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions CCStatementTransaction
Join        t_TLBoard_Bank_Accounts_Credit_Cards_Statements statementDetails 
            ON statementDetails.Bank_Account_Credit_Card_Statement_Id = CCStatementTransaction.Bank_Account_Credit_Card_Statement_Id
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = statementDetails.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = statementDetails.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatementTransaction.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatementTransaction.Record_Last_Updated_By_User_Id
Left Join	t_TLBoard_Currencies TransactionCurrency On TransactionCurrency.Currency_Id = CCStatementTransaction.Transaction_Amount_Currency_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
Where       CCStatementTransaction.Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And
            bankAccount.[User_Id]       = @User_ID_Bank_Owner And
            @Searching_User_Id          = @User_ID_Bank_Owner 


GO
