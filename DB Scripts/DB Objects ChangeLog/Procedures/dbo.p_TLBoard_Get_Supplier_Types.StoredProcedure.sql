SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Supplier_Types]
As

Select	[Supplier_Type_Id] , 
		[Type_Name] , 
		[Type_Code] , 
		[Description]
From	t_TLBoard_Supplier_Types

GO
