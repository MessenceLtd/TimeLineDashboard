SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[p_TLBoard_Get_Expense_Latest_Expense_By_Supplier_Id_And_Expense_DateTime]
@Supplier_Id Int, @Expense_DateTime DateTime, @Searching_User_Id Int
As

Select		Top 1 expenses.* 
From		t_TLBoard_Expenses expenses
Where		expenses.Supplier_Id = @Supplier_Id And expenses.Expense_Invoice_DateTime <= @Expense_DateTime
Order By	expenses.Expense_Invoice_DateTime desc  

GO
