SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Suppliers_List_By_User_Id]
@User_Id Int, @Searching_User_Id Int
As

Select	Supplier_Id, [User_Id], Company_Name As Company_Name, Default_Currency_Id, Default_Vat_Percentage
From	t_TLBoard_Suppliers suppliers
Where	suppliers.[User_Id] = @User_Id And 
		suppliers.Is_Active = 1 And 
		suppliers.Is_Deleted = 0 

GO
