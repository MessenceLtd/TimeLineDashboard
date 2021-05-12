SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc p_TLBoard_Get_Bank_Accounts_Search
@user_Id Int 
As

Select      bankAccount.* , 
            currency.Currency_Symbol, 
            country.Country_English_Name As Branch_Country_Name,
            [Latest_Transaction_Details].Transaction_Actual_DateTime As Latest_Transaction_Actual_DateTime,
            [Latest_Transaction_Details].Transaction_Account_Balance As Latest_Transaction_Account_Balance
From        t_TLBoard_Bank_Accounts bankAccount
Left Join   t_TLBoard_Countries country on country.Country_Id = bankaccount.Branch_Country_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = bankAccount.Currency_Id
Left Join ( Select  t.Bank_Account_Id, Max(Bank_Account_Transaction_Id) as Latest_Bank_Account_Transaction_Id
            from    t_TLBoard_Bank_Accounts_Transactions t
            Join    t_TLBoard_Bank_Accounts b2 on t.Bank_Account_Id = b2.Bank_Account_Id
            Join    (   Select  t_TLBoard_Bank_Accounts_Transactions.Bank_Account_Id , Max(Transaction_Actual_DateTime) As Max_Date_Transaction_Per_Bank
                        from    t_TLBoard_Bank_Accounts_Transactions
                        Join    t_TLBoard_Bank_Accounts b on b.Bank_Account_Id = t_TLBoard_Bank_Accounts_Transactions.Bank_Account_Id
                        where   b.[User_Id] = @user_Id
                        Group By t_TLBoard_Bank_Accounts_Transactions.Bank_Account_Id ) m 
                            On m.Bank_Account_Id = t.Bank_Account_Id and m.Max_Date_Transaction_Per_Bank = t.Transaction_Actual_DateTime
            Where b2.[User_Id] = @user_Id
            Group By t.Bank_Account_Id ) Latest_Transaction
                On Latest_Transaction.Bank_Account_Id = bankAccount.Bank_Account_Id
Left Join t_TLBoard_Bank_Accounts_Transactions [Latest_Transaction_Details] 
    On [Latest_Transaction_Details].Bank_Account_Transaction_Id = [Latest_Transaction].Latest_Bank_Account_Transaction_Id
Where   bankAccount.[User_Id] = @user_Id And (bankAccount.Is_Deleted = 0 Or bankAccount.Is_Deleted Is Null)

GO
