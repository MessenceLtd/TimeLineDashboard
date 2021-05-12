SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Delete_Client_Details]
@Client_Id Int, 
@Deleting_User_Id Int
As

UPDATE	[dbo].[t_TLBoard_Clients]
SET		Is_Deleted = 1, 
		[Record_Deleted_By_User_Id] = @Deleting_User_Id, 
		[Record_Deleted_DateTime_UTC] = GETUTCDATE()
WHERE	Client_Id = @Client_Id And [User_Id] = @Deleting_User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 )

GO
