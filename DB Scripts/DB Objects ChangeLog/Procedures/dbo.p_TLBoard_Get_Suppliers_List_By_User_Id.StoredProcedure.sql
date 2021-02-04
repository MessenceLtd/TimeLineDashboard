SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * From t_TLBoard_Clients
--select * From t_TLBoard_Suppliers

--Select * From t_TLBoard_Expenses
--Select * From t_TLBoard_Invoices

-- dummy fillup expenses page
-- dummy fillup invoice page
-- dummy fillup document page 


CREATE Proc [p_TLBoard_Get_Suppliers_List_By_User_Id]
@User_Id Int, @Searching_User_Id Int
As

Select	Supplier_Id, [User_Id], Company_Name + ' (' + suppliers.City + ')' As Company_Name
From	t_TLBoard_Suppliers suppliers
Where	suppliers.[User_Id] = @User_Id And 
		suppliers.Is_Active = 1 And 
		suppliers.Is_Deleted = 0 

GO
