SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc p_TLBoard_Update_Bank_Account_Details
@Bank_Account_Id                                Int,
@Bank_Name                                      nvarchar(40),
@Bank_Number                                    nvarchar(10),
@Branch_Name                                    nvarchar(40),
@Branch_Number                                  nvarchar(50),
@Account_Number                                 nvarchar(50),
@Account_Name                                   nvarchar(50),
@IBAN                                           nvarchar(50),
@Currency_Id                                    TinyInt,
@Opened_Account_DateTime                        DateTime,
@Branch_Country_Id                              Smallint,
@Branch_State_Id                                Smallint,
@Branch_City                                    NVarChar(100),
@Branch_Address_Description                     nvarchar(255),
@Branch_ZipCode                                 nvarchar(20),
@Branch_Phone                                   nvarchar(50),
@Branch_Main_Email_Address                      nvarchar(100),
@Branch_Main_Contact                            nvarchar(100),
@Main_Contact_Phone_Number                      nvarchar(50),
@Account_Active_From_Date                       datetime,
@Account_Active_To_Date                         datetime,
@Is_Visible_To_Anonymous_Users                  bit,
@Is_Available_For_Download_For_Anonymous_Users  bit,
@Is_Visible_To_Followers_Users                  bit,
@Is_Available_For_Download_For_Followers_Users  bit,
@Is_Active                                      bit,
@Updating_User_Id                               int
As

UPDATE  [dbo].[t_TLBoard_Bank_Accounts]
SET     [Bank_Name]     = @Bank_Name    ,
        [Bank_Number]   = @Bank_Number  ,
        [Branch_Name]   = @Branch_Name  ,
        [Branch_Number] = @Branch_Number, 
        [Account_Number] = @Account_Number, 
        [Account_Name] = @Account_Name,
        [IBAN] = @IBAN,
        [Currency_Id] = @Currency_Id, 
        [Opened_Account_DateTime] = @Opened_Account_DateTime,
        [Branch_Country_Id] = @Branch_Country_Id, 
        [Branch_State_Id] = @Branch_State_Id, 
        [Branch_City] = @Branch_City,
        [Branch_Address_Description] = @Branch_Address_Description,
        [Branch_ZipCode] = @Branch_ZipCode,
        [Branch_Phone] = @Branch_Phone, 
        [Branch_Main_Email_Address] = @Branch_Main_Email_Address , 
        [Branch_Main_Contact] = @Branch_Main_Contact , 
        [Main_Contact_Phone_Number] = @Main_Contact_Phone_Number , 
        [Account_Active_From_Date] = @Account_Active_From_Date,
        [Account_Active_To_Date] = @Account_Active_To_Date, 
        [Is_Visible_To_Anonymous_Users] = @Is_Visible_To_Anonymous_Users,
        [Is_Available_For_Download_For_Anonymous_Users] = @Is_Available_For_Download_For_Anonymous_Users,
        [Is_Visible_To_Followers_Users] = @Is_Visible_To_Followers_Users,
        [Is_Available_For_Download_For_Followers_Users] = @Is_Available_For_Download_For_Followers_Users,
        [Record_Last_Updated_By_User_Id] = @Updating_User_Id,
        [Record_Last_Updated_DateTime_UTC] = GetUtcDate(),
        [Is_Active] = @Is_Active
WHERE   Bank_Account_Id = @Bank_Account_Id And User_Id = @Updating_User_Id And (Is_Deleted = 0 Or Is_Deleted Is Null)

GO
