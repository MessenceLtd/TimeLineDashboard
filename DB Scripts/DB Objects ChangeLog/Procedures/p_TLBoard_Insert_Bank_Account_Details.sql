SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc p_TLBoard_Insert_Bank_Account_Details
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
@Creating_User_Id                               int
As

INSERT INTO [dbo].[t_TLBoard_Bank_Accounts]
           ([User_Id]
           ,[Bank_Name]
           ,[Bank_Number]
           ,[Branch_Name]
           ,[Branch_Number]
           ,[Account_Number]
           ,[Account_Name]
           ,[IBAN]
           ,[Currency_Id]
           ,[Opened_Account_DateTime]
           ,[Branch_Country_Id]
           ,[Branch_State_Id]
           ,[Branch_City]
           ,[Branch_Address_Description]
           ,[Branch_ZipCode]
           ,[Branch_Phone]
           ,[Branch_Main_Email_Address]
           ,[Branch_Main_Contact]
           ,[Main_Contact_Phone_Number]
           ,[Account_Active_From_Date]
           ,[Account_Active_To_Date]
           ,[Is_Visible_To_Anonymous_Users]
           ,[Is_Available_For_Download_For_Anonymous_Users]
           ,[Is_Visible_To_Followers_Users]
           ,[Is_Available_For_Download_For_Followers_Users]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           ,[Is_Active]
           ,[Is_Deleted])
     VALUES
           (@Creating_User_Id, 
            @Bank_Name, 
            @Bank_Number,
            @Branch_Name, 
            @Branch_Number, 
            @Account_Number, 
            @Account_Name,
            @IBAN, 
            @Currency_Id,
            @Opened_Account_DateTime, 
            @Branch_Country_Id,
            @Branch_State_Id,
            @Branch_City,
            @Branch_Address_Description,
            @Branch_ZipCode,
            @Branch_Phone, 
            @Branch_Main_Email_Address,
            @Branch_Main_Contact,
            @Main_Contact_Phone_Number,
            @Account_Active_From_Date,
            @Account_Active_To_Date,
            @Is_Visible_To_Anonymous_Users,
            @Is_Available_For_Download_For_Anonymous_Users ,
            @Is_Visible_To_Followers_Users ,
            @Is_Available_For_Download_For_Followers_Users ,
            @Creating_User_Id,
            GETUTCDATE(),
            @Creating_User_Id,
            GETUTCDATE(),
            @Is_Active, 
            0 )

Select @@IDENTITY;

GO
