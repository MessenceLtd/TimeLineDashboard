SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Supplier_Details]
@Supplier_Id Int, 
@User_Id_Searching_For_Supplier_Details Int
As

Select	supplier.*
From	t_TLBoard_Suppliers supplier
Where	supplier.[Supplier_Id] = @Supplier_Id
		And ( supplier.Is_Deleted Is Null Or supplier.Is_Deleted = 0 )  


GO
