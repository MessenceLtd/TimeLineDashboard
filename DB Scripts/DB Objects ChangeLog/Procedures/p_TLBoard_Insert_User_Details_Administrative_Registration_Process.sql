SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Insert_User_Details_Administrative_Registration_Process]
@Username varchar(50), 
@Encrypted_Password varchar(120), 
@Encryption_Random_Salt varchar(50),
@App_Permission_Type_Id TinyInt,
@First_Name nvarchar(60), 
@Middle_Name nvarchar(60),
@Last_Name nvarchar(60),
@Email varchar(100),
@Country_Id smallint,
@State_Id smallint,
@City nvarchar(80), 
@Address nvarchar(120),
@ZipCode varchar(10), 
@Default_Currency_Id TinyInt,
@Mobile_Phone varchar(20), 
@Additional_Phone_Number varchar(20),
@Birth_Date DateTime, 
@Gender TinyInt, 
@Heard_About_Application_From NVarChar(500), 
@Our_Administrative_Side_Notes NVarChar(500),
@Record_Created_By_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Users]
    ([Username]
    ,[Encrypted_Password]
    ,[Encryption_Random_Salt]
	,[App_Permission_Type_Id]
    ,[First_Name]
    ,[Middle_Name]
    ,[Last_Name]
    ,[Email]
    ,[Country_Id]
    ,[State_Id]
    ,[City]
    ,[Address]
    ,[ZipCode]
    ,[Default_Currency_Id]
    ,[Mobile_Phone]
    ,[Additional_Phone_Number]
	,[Birth_Date]
	,[Gender]
	,[Registration_DateTime_UTC]
	,[Heard_About_Application_From]
	,[Our_Administrative_Side_Notes]
    ,[Record_Creation_DateTime_UTC]
	,[Record_Created_By_User_Id]
    ,[Record_Last_Updated_DateTime_UTC]
    ,[Record_Last_Updated_By_User_Id])
VALUES (
	@Username , 
	@Encrypted_Password, 
	@Encryption_Random_Salt,
	@App_Permission_Type_Id, 
	@First_Name, 
	@Middle_Name,
	@Last_Name,
    @Email,
	@Country_Id, 
	@State_Id,
	@City,
	@Address,
	@ZipCode,
    @Default_Currency_Id,
	@Mobile_Phone,
	@Additional_Phone_Number,
	@Birth_Date , 
	@Gender , 
	GETUTCDATE(),
	@Heard_About_Application_From, 
	@Our_Administrative_Side_Notes, 
	GETUTCDATE(),
	@Record_Created_By_User_Id,
	GETUTCDATE(),
	@Record_Created_By_User_Id )


Select @@Identity;

GO
