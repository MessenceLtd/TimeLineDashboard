SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Invoice_Details_File_Change]
@Invoice_Record_Id Int						,
@User_Description nvarchar(500)				,
@User_Comments nvarchar(500)				,	 
@Original_File_Name nvarchar(255)			,
@Azure_Block_Blob_Reference nvarchar(255)	,
@Updating_User_Id int
As

UPDATE	[dbo].[t_TLBoard_Invoices] 
SET		[User_Id] = @Updating_User_Id									,
		[User_Description] = @User_Description							,
		[User_Comments] = @User_Comments								,
		[Original_File_Name] = @User_Comments							,
		[Azure_Block_Blob_Reference] = @Azure_Block_Blob_Reference		,
		[Record_Last_Updated_By_User_Id] = @Updating_User_Id			,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()				
WHERE	[Invoice_Record_Id] = @Invoice_Record_Id

GO
