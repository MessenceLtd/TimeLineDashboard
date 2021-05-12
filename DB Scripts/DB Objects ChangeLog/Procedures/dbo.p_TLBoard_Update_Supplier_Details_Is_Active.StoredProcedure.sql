SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Supplier_Details_Is_Active]
@Supplier_Id Int, 
@Is_Active Bit, 
@Active_Last_Updated_Comments NVarChar(500), 
@Record_Updated_By_User_Id int
As

UPDATE	[dbo].[t_TLBoard_Suppliers]
SET		[Is_Active] = @Is_Active, 
		[Active_Last_Updated_Comments] = @Active_Last_Updated_Comments,
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()
WHERE Supplier_Id = @Supplier_Id And [User_Id] = @Record_Updated_By_User_Id

GO
