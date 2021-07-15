SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Insert_Credit_Card_Statement_Transaction]
@Bank_Account_Credit_Card_Statement_Id Int ,
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
@Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, 
@Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, 
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions]
    (
        [Bank_Account_Credit_Card_Statement_Id],
        [Transaction_Date],
        [Business_Name],
        [Transaction_Amount],
        [Transaction_Amount_Currency_Id],
        [Transaction_Actual_Payment_Amount],
        [Description],
        [Has_Been_Actually_Charged_In_Statement],
        [Total_Charged_In_Statement],
        [User_Description],
        [User_Comments],
        [Is_Visible_To_Anonymous_Users],
        [Is_Available_For_Download_For_Anonymous_Users], 
        [Is_Visible_To_Followers_Users],
        [Is_Available_For_Download_For_Followers_Users], 
        [Record_Created_By_User_Id],
        [Record_Creation_DateTime_UTC],
        [Record_Last_Updated_By_User_Id],
        [Record_Last_Updated_DateTime_UTC]
    )
VALUES
    (   @Bank_Account_Credit_Card_Statement_Id,
        @Transaction_Date,
        @Business_Name,
        @Transaction_Amount,
        @Transaction_Amount_Currency_Id,
        @Transaction_Actual_Payment_Amount,
        @Description,
        @Has_Been_Actually_Charged_In_Statement,
        @Total_Charged_In_Statement,
        @User_Description, 
        @User_Comments,
        @Is_Visible_To_Anonymous_Users,
        @Is_Available_For_Download_For_Anonymous_Users, 
        @Is_Visible_To_Followers_Users,
        @Is_Available_For_Download_For_Followers_Users, 
        @Creating_User_Id,
        GETUTCDATE(),
        @Creating_User_Id,
        GETUTCDATE()
    )

Select @@Identity;

GO
