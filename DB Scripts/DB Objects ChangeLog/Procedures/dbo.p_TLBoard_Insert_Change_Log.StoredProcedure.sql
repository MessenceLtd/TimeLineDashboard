SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [p_TLBoard_Insert_Change_Log]
@Table_Name varchar(100), @PK_Param NVarChar(500) , @Updating_User_Id Int , @Change_Description NVarChar(Max)
As

    INSERT INTO [dbo].[t_TLBoard_Change_Logs]
           ([Table_Name]
           ,[PK]
           ,[Timestamp]
           ,[Updating_User_Id]
           ,[Change_Description])
     VALUES
           (@Table_Name
           ,@PK_Param
           ,GETUTCDATE()
           ,@Updating_User_Id
           ,@Change_Description)

GO
