SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Expense_Latest_Expense_By_Supplier_Id]
@Supplier_Id Int, @Searching_User_Id Int
As

Select		Top 1 expenses.* 
From		t_TLBoard_Expenses expenses
Where		expenses.Supplier_Id = @Supplier_Id
Order By	expenses.Expense_Invoice_DateTime desc

GO
