SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Insert_Credit_Card_Details]
@Bank_Account_Id Int, 
@User_Id_Owner Int, 
@Card_Name NVarChar(40), 
@Four_Ending_Digits NVarChar(4),
@Expiration_Date SmallDateTime, 
@Is_Active Bit,
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Credit_Cards]
           ([Bank_Account_Id]
           ,[User_Id]
           ,[Card_Name]
           ,[Four_Ending_Digits]
           ,[Expiration_Date]
           ,[Is_Active]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC] )
     VALUES
           (@Bank_Account_Id
           ,@User_Id_Owner
           ,@Card_Name
           ,@Four_Ending_Digits
           ,@Expiration_Date
           ,@Is_Active
           ,@Creating_User_Id
           ,GETUTCDATE()
           ,@Creating_User_Id
           ,GETUTCDATE() )

Select @@IDENTITY

GO
