SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[p_TLBoard_Delete_User_By_Id_Administrative_Side]
@User_Id_To_Delete Int			,
@Delete_Reason NVarChar(500)	,	
@Deleted_By_User_Id Int			 
As

Update	t_TLBoard_Users 
Set		Is_Deleted = 1 , Deleted_By_User_Id = @Deleted_By_User_Id , 
		Deleted_DateTime_UTC = GETUTCDATE() , Delete_Reason = @Delete_Reason
Where	[User_Id] = @User_Id_To_Delete And ( Is_Deleted is Null Or Is_Deleted = 0 )

GO
