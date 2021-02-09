SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_General_Document_Details]
@General_Document_Id Int, 
@User_Id_Document_Owner Int, 
@User_Id_Searching_For_Document_Details Int
As 

Select	documents.*
From	t_TLBoard_General_Documents documents
Where	documents.[General_Document_Id] = @General_Document_Id And 
		documents.[User_Id] = @User_Id_Document_Owner  And ( documents.Is_Deleted = 0 ) 

GO
