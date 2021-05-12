SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 

Todo -- Add new tables:
Document Types 
Supplier Types 

*/

CREATE Proc [p_TLBoard_Get_General_Document_Types]
As

Select	General_Document_Type_Id	, 
		Document_Type_Name ,
		Sort_Order	,
		Suggested_By_User_Id, 
		Record_Created_By_User_Id,
		Record_Creation_DateTime_UTC, 
		Record_Last_Updated_By_User_Id, 
		Record_Last_Updated_DateTime_UTC, 
		Is_Active, 
		Is_Visible
From	t_TLBoard_General_Document_Types
Where	Is_Active = 1 

GO
