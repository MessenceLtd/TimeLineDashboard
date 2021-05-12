SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_User_Details_Set_New_Password]
@User_Id                        Int				, 
@Encrypted_Password             varchar(120)	, 
@Encryption_Random_Salt         varchar(120)	,
@Updating_User_Id               Int             
As

Update  [t_TLBoard_Users]
Set     Encrypted_Password      = @Encrypted_Password , 
        Encryption_Random_Salt  = @Encryption_Random_Salt
Where   [User_Id] = @User_Id And (Is_Deleted = 0 Or Is_Deleted Is Null )

GO
