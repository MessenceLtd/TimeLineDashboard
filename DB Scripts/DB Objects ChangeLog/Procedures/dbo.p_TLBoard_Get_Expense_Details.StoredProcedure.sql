SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Expense_Details]
@Expense_Record_Id Int, 
@User_Id_Expense_Owner Int, 
@User_Id_Searching_For_Expense_Details Int
As 

Select	expense.*
From	t_TLBoard_Expenses expense
Where	expense.[Expense_Record_Id] = @Expense_Record_Id
		And ( expense.Is_Deleted Is Null Or expense.Is_Deleted = 0 )  

GO
