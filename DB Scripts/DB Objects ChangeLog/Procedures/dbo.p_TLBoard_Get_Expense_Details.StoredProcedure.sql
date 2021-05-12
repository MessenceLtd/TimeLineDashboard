SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Expense_Details]
@Expense_Record_Id Int, 
@User_Id_Expense_Owner Int, 
@User_Id_Searching_For_Expense_Details Int
As 

Select	expense.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Expenses expense
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = expense.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = expense.Record_Last_Updated_By_User_Id
Where	expense.[Expense_Record_Id] = @Expense_Record_Id And expense.[User_Id] = @User_Id_Expense_Owner 
		And ( expense.Is_Deleted Is Null Or expense.Is_Deleted = 0 )  

GO
