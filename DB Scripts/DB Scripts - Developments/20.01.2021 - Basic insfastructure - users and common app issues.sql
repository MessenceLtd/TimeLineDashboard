Use [DashboardTimeLine];
Go


ALTER Proc [dbo].[p_TLBoard_Get_Users_Search]
@Search_Criteria NVarChar(50)
As

Select	[Username]							,
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
		[Record_Creation_DateTime_UTC]		,
		[Record_Last_Updated_DateTime_UTC]	,
		[Record_Last_Updated_By_User_Id]
From	t_TLBoard_Users 
Where	Len( @Search_Criteria ) > 0 
		And (	[First_Name] = @Search_Criteria		Or 
				[Middle_Name] = @Search_Criteria	Or 
				[Last_Name] = @Search_Criteria		Or 
				[Email] = @Search_Criteria		Or 
				[City] = @Search_Criteria			Or 
				[ZipCode] = @Search_Criteria		)

Go


ALTER Proc [dbo].[p_TLBoard_Get_User_Details]
@User_Id Int
As

Select	[Username]							,
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
		[Record_Creation_DateTime_UTC]		,
		[Record_Last_Updated_DateTime_UTC]	,
		[Record_Last_Updated_By_User_Id]
From	[dbo].[t_TLBoard_Users]
Where	[User_Id] = @User_Id

Go

ALTER Proc [dbo].[p_TLBoard_Insert_User_Details]
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
@Record_Creation_DateTime_UTC datetime,
@Record_Last_Updated_DateTime_UTC datetime,
@Record_Last_Updated_By_User_Id int
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
    ,[Record_Creation_DateTime_UTC]
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
	@Record_Creation_DateTime_UTC,
	@Record_Last_Updated_DateTime_UTC,
	@Record_Last_Updated_By_User_Id )

Select @@Identity;

Go

ALTER Proc [dbo].[p_TLBoard_Update_User_Details_Administrative_Side]
@User_Id Int								, 
@Username varchar(50)						, 
@Encrypted_Password varchar(120)			, 
@Encryption_Random_Salt varchar(120)		, 
@First_Name varchar(120)					, 
@Middle_Name nvarchar(60)					, 
@Last_Name nvarchar(60)						, 
@Email varchar(100)							, 
@Country_Id SmallInt						,
@State_Id SmallInt							,
@City nvarchar(80)							,
@Address nvarchar(120)						,
@ZipCode nvarchar(10)						,
@Mobile_Phone varchar(20)					,
@Additional_Phone_Number varchar(20)		,
@Record_Last_Updated_DateTime_UTC DateTime	,
@Record_Last_Updated_By_User_Id	Int			
As

UPDATE	[dbo].[t_TLBoard_Users]
SET		[Username] = @Username,
		[Encrypted_Password] = @Encrypted_Password,
		[Encryption_Random_Salt] = @Encryption_Random_Salt,
		[First_Name] = @First_Name ,
		[Middle_Name] = @Middle_Name ,
		[Last_Name] = @Last_Name ,
		[Email] = @Email , 
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City,
		[Address] = @Address,
		[ZipCode] = @ZipCode,
		[Mobile_Phone] = @Mobile_Phone,
		[Additional_Phone_Number] = @Additional_Phone_Number,
		[Record_Last_Updated_DateTime_UTC] = @Record_Last_Updated_DateTime_UTC, 
		[Record_Last_Updated_By_User_Id] = @Record_Last_Updated_By_User_Id
WHERE	[User_Id] = @User_Id


Go





