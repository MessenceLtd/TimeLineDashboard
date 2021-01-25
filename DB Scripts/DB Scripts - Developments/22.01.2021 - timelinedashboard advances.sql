Use [DashboardTimeLine];


If ( Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_States' ) )
Begin

	Drop Proc p_TLBoard_Get_States;

End

Go

Create Proc p_TLBoard_Get_States
As

Select		State_Id, State_Code , State_Name, Country_Id
From		t_TLBoard_States
Order By	Country_Id, State_Name

Go


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_User_Details_Administrative_Registration_Process'  ))
Begin

	Drop Proc p_TLBoard_Insert_User_Details_Administrative_Registration_Process;

End

Go

Create Proc [dbo].[p_TLBoard_Insert_User_Details_Administrative_Registration_Process]
@Username varchar(50), 
@Encrypted_Password varchar(120), 
@Encryption_Random_Salt varchar(50),
@First_Name nvarchar(60), 
@Middle_Name nvarchar(60),
@Last_Name nvarchar(60),
@Email varchar(100),
@Country_Id smallint,
@State_Id smallint,
@City nvarchar(80), 
@Address nvarchar(120),
@ZipCode varchar(10), 
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
    ,[First_Name]
    ,[Middle_Name]
    ,[Last_Name]
    ,[Email]
    ,[Country_Id]
    ,[State_Id]
    ,[City]
    ,[Address]
    ,[ZipCode]
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
	@First_Name, 
	@Middle_Name,
	@Last_Name,
    @Email,
	@Country_Id, 
	@State_Id,
	@City,
	@Address,
	@ZipCode,
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


Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_User_Details'  ))
Begin

	Drop Proc p_TLBoard_Get_User_Details;

End

Go

Create Proc [dbo].[p_TLBoard_Get_User_Details]
@User_Id Int
As

Select	[User_Id]							,
		[Username]							,
		[Encrypted_Password]				,
		[Encryption_Random_Salt]			,
		[First_Name]						,
		[Middle_Name]						,
		[Last_Name]							,
		[Email]								,
		[Country_Id]						,
		[State_Id]							,
		[City]								,
		[Address]							,
		[ZipCode]							,
		[Mobile_Phone]						,
		[Additional_Phone_Number]			,
		[Birth_Date]						,
		[Gender]							,
		[Registration_DateTime_UTC]			,
		[Record_Creation_DateTime_UTC]		,
		[Record_Created_By_User_Id]			,
		[Record_Last_Updated_DateTime_UTC]	,
		[Record_Last_Updated_By_User_Id]	,
		[Is_Deleted]						,
		[Is_Active]
From	[dbo].[t_TLBoard_Users]
Where	[User_Id] = @User_Id

Go

--Select * from t_TLBoard_Users