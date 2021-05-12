SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Supplier_Details]
@Supplier_Id Int, 
@User_Id_Searching_For_Supplier_Details Int
As

Select	supplier.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Suppliers supplier
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = supplier.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = supplier.Record_Last_Updated_By_User_Id
Where	supplier.[Supplier_Id] = @Supplier_Id
		And ( supplier.Is_Deleted Is Null Or supplier.Is_Deleted = 0 )  

GO
