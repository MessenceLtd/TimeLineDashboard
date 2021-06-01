SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Credit_Card_Statement_Transaction]
@Credit_Card_Statement_Transaction_Id BigInt ,
@Transaction_Date DateTime ,
@Business_Name NVarChar(50),
@Transaction_Amount Decimal(10,2),
@Transaction_Amount_Currency_Id TinyInt,
@Transaction_Actual_Payment_Amount Decimal(10,2),
@Description NVarChar(80),
@Has_Been_Actually_Charged_In_Statement Bit,
@Total_Charged_In_Statement Decimal(10,2),
@User_Description NVarChar(300),
@User_Comments NVarChar(300),
@Is_Visible Bit,
@Updating_User_Id Int
As

Update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
Set     Transaction_Date = @Transaction_Date, 
        Business_Name = @Business_Name, 
        Transaction_Amount = @Transaction_Amount,
        Transaction_Amount_Currency_Id = @Transaction_Amount_Currency_Id, 
        Transaction_Actual_Payment_Amount = @Transaction_Actual_Payment_Amount, 
        [Description] = @Description, 
        Has_Been_Actually_Charged_In_Statement = @Has_Been_Actually_Charged_In_Statement, 
        Total_Charged_In_Statement = @Total_Charged_In_Statement, 
        User_Description = @User_Description,
        User_Comments = @User_Comments,
        Is_Visible = @Is_Visible,
        Record_Last_Updated_By_User_Id = @Updating_User_Id,
        Record_Last_Updated_DateTime_UTC = GETUTCDATE()
Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And Is_Deleted = 0 

GO
