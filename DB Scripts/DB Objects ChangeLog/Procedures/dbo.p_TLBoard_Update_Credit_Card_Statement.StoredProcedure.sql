SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Credit_Card_Statement]
@Bank_Account_Credit_Card_Statement_Id Int ,
@Credit_Card_Id Int ,
@Statement_Date DateTime,
@Total_Amount Decimal(16,2),
@Currency_Id TinyInt,
@Original_File_Name NVarChar(255),
@Azure_Block_Blob_Reference NVarChar(255),
@File_Uploaded Bit,
@Bank_Account_Transaction_Id_Connection BigInt,
@Is_Visible_To_Anonymous_Users Bit,
@Is_Available_For_Download_For_Anonymous_Users Bit,
@Is_Visible_To_Followers_Users Bit,
@Is_Available_For_Download_For_Followers_Users Bit,
@Updating_User_Id Int
As

Declare @_l_Bank_Account_Credit_Card_Statement_Id Int; 

Set @_l_Bank_Account_Credit_Card_Statement_Id = 
    (   
        Select  Bank_Account_Credit_Card_Statement_Id 
        From    [t_TLBoard_Bank_Accounts_Credit_Cards_Statements] CCStatement
        Join    t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
        Join    t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
        Where   CCStatement.Bank_Account_Credit_Card_Statement_Id = @Bank_Account_Credit_Card_Statement_Id And
                bankAccount.[User_Id] = @Updating_User_Id
    );


UPDATE  [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements]
   SET  [Credit_Card_Id] = @Credit_Card_Id                                                  ,
        [Statement_Date] = @Statement_Date                                                  ,
        [Total_Amount] = @Total_Amount                                                      , 
        [Currency_Id] = @Currency_Id                                                        ,
        [Bank_Account_Transaction_Id_Connection] = @Bank_Account_Transaction_Id_Connection  ,
        [Is_Visible_To_Anonymous_Users] = @Is_Visible_To_Anonymous_Users                    , 
        [Is_Available_For_Download_For_Anonymous_Users] = @Is_Available_For_Download_For_Anonymous_Users ,
        [Is_Visible_To_Followers_Users] = @Is_Visible_To_Followers_Users,
        [Is_Available_For_Download_For_Followers_Users] = @Is_Available_For_Download_For_Followers_Users ,
        [Record_Last_Updated_By_User_Id] = @Updating_User_Id    ,
        [Record_Last_Updated_DateTime_UTC] = GetUTCDate()
WHERE   Bank_Account_Credit_Card_Statement_Id = @_l_Bank_Account_Credit_Card_Statement_Id

If ( @File_Uploaded Is Not Null And @File_Uploaded = 1 )
Begin
    
    Update	[dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements] 
    Set     Original_File_Name = @Original_File_Name , Azure_Block_Blob_Reference = @Azure_Block_Blob_Reference
    Where   Bank_Account_Credit_Card_Statement_Id = @_l_Bank_Account_Credit_Card_Statement_Id And Is_Deleted = 0

End

GO
