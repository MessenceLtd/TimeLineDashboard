SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Insert_Bank_Account_Transaction_Details]
@Bank_Account_Id int, 
@Transaction_Account_Balance Decimal(16,2),
@Transaction_Actual_DateTime DateTime,
@Positive_Amount_Entered Decimal(16,2), 
@Negative_Amount_Paid Decimal(16,2), 
@Transaction_Value_DateTime DateTime,
@Reference_Number NVarchar(40),
@Transaction_Bank_Description NVarchar(40),
@Transaction_Bank_Inner_Reference_Code NVarchar(15), 
@Is_Visible_To_Anonymous_Users bit,
@Is_Visible_To_Followers_Users bit,
@Creating_User_Id Int
As


INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Transactions]
           (Bank_Account_Id, 
			Transaction_Account_Balance,
			Transaction_Actual_DateTime,
			Positive_Amount_Entered, 
			Negative_Amount_Paid, 
			Transaction_Value_DateTime,
			Reference_Number,
			Transaction_Bank_Description,
			Transaction_Bank_Inner_Reference_Code, 
			Is_Visible_To_Anonymous_Users,
			Is_Visible_To_Followers_Users,
			Record_Created_By_User_Id,
			Record_Creation_DateTime_UTC,
			Record_Last_Updated_By_User_Id,
			Record_Last_Updated_DateTime_UTC )
     VALUES
           (@Bank_Account_Id, 
			@Transaction_Account_Balance,
			@Transaction_Actual_DateTime,
			@Positive_Amount_Entered, 
			@Negative_Amount_Paid, 
			@Transaction_Value_DateTime,
			@Reference_Number,
			@Transaction_Bank_Description,
			@Transaction_Bank_Inner_Reference_Code, 
			@Is_Visible_To_Anonymous_Users,
			@Is_Visible_To_Followers_Users,
			@Creating_User_Id,
			GETUTCDATE(),
			@Creating_User_Id,
			GETUTCDATE() )


Select @@IDENTITY;

GO
