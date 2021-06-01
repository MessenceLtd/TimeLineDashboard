SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Credit_Card_Details]
@Credit_Card_Id Int, 
@Bank_Account_Id Int, 
@Card_Name NVarChar(40), 
@Four_Ending_Digits NVarChar(4),
@Expiration_Date SmallDateTime, 
@Is_Active Bit,
@Updating_User_Id Int
As

UPDATE  [dbo].[t_TLBoard_Credit_Cards]
SET     [Bank_Account_Id] = @Bank_Account_Id , 
        [Card_Name] = @Card_Name ,
        [Four_Ending_Digits] = @Four_Ending_Digits , 
        [Expiration_Date] = @Expiration_Date , 
        [Is_Active] = @Is_Active , 
        [Record_Last_Updated_By_User_Id] = @Updating_User_Id ,
        [Record_Last_Updated_DateTime_UTC] = GetUTCDate() 
WHERE   Credit_Card_Id = @Credit_Card_Id And [User_Id] = @Updating_User_Id

GO
