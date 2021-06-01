SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Insert_Credit_Card_Statement]
@User_Id_Bank_Owner Int,
@Bank_Account_Id Int , 
@Credit_Card_Id Int,
@Statement_Date DateTime,
@Total_Amount Decimal(16,2),
@Currency_Id TinyInt,
@Original_File_Name NVarChar(255),
@Azure_Block_Blob_Reference nvarchar(255),
@Bank_Account_Transaction_Id_Connection BigInt,
@Is_Visible_To_Anonymous_Users Bit,
@Is_Available_For_Download_For_Anonymous_Users Bit,
@Is_Visible_To_Followers_Users Bit,
@Is_Available_For_Download_For_Followers_Users Bit,
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements]
      (     [Bank_Account_Id]                               ,
            [Credit_Card_Id]                                ,
            [Statement_Date]                                ,       
            [Total_Amount]                                  ,
            [Currency_Id]                                   ,
            [Original_File_Name]                            ,
            [Azure_Block_Blob_Reference]                    ,
            [Bank_Account_Transaction_Id_Connection]        ,
            [Is_Visible_To_Anonymous_Users]                 ,
            [Is_Available_For_Download_For_Anonymous_Users] ,
            [Is_Visible_To_Followers_Users]                 ,
            [Is_Available_For_Download_For_Followers_Users] ,
            [Record_Created_By_User_Id]                     ,
            [Record_Creation_DateTime_UTC]                  ,
            [Record_Last_Updated_By_User_Id]                ,
            [Record_Last_Updated_DateTime_UTC]  )
     VALUES
        (   @Bank_Account_Id                                , 
            @Credit_Card_Id                                 ,
            @Statement_Date                                 ,
            @Total_Amount                                   ,
            @Currency_Id                                    ,
            @Original_File_Name                             ,
            @Azure_Block_Blob_Reference                     ,
            @Bank_Account_Transaction_Id_Connection         ,
            @Is_Visible_To_Anonymous_Users                  ,
            @Is_Available_For_Download_For_Anonymous_Users  , 
            @Is_Visible_To_Followers_Users                  , 
            @Is_Available_For_Download_For_Followers_Users  , 
            @Creating_User_Id                               ,
            GETUTCDATE()                                    ,
            @Creating_User_Id                               , 
            GETUTCDATE()               
        )

Select @@IDENTITY;

GO
