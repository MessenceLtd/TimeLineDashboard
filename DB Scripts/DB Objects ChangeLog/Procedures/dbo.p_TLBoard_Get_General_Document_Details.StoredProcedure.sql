SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_General_Document_Details]
@General_Document_Id Int, 
@User_Id_Document_Owner Int, 
@User_Id_Searching_For_Document_Details Int
As 

Select	documents.*,
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_General_Documents documents
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = documents.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = documents.Record_Last_Updated_By_User_Id
Where	documents.[General_Document_Id] = @General_Document_Id And 
		documents.[User_Id] = @User_Id_Document_Owner  And ( documents.Is_Deleted = 0 ) 

GO
