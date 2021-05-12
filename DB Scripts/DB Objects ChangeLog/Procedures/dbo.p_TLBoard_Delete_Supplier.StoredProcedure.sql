SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Delete_Supplier]
@Supplier_Id Int, 
@Record_Deleted_By_User_Id int
As

UPDATE	[dbo].[t_TLBoard_Suppliers]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Deleted_DateTime_UTC = GETUTCDATE()
WHERE	Supplier_Id = @Supplier_Id And [User_Id] = @Record_Deleted_By_User_Id And (Is_Deleted Is null Or Is_Deleted = 0)

GO
