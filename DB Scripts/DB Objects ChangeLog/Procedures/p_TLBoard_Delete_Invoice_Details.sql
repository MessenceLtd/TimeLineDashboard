SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_Invoice_Details]
@Invoice_Record_Id	Int	,
@Deleting_User_Id	Int
As

UPDATE	[dbo].[t_TLBoard_Invoices] 
SET		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()		,
		Is_Deleted = 1											, 
		Record_Deleted_By_User_Id = @Deleting_User_Id			,
		Record_Delete_DateTime_UTC = GetUTCDate()		
WHERE	[Invoice_Record_Id] = @Invoice_Record_Id And ( Is_Deleted Is null Or Is_Deleted = 0 )

GO
