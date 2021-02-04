Use [DashboardTimeLine];
Go

Alter Proc p_TLBoard_Get_Users_Are_There_Any_Users
As

-- Return a boolean indication if there is any user in the database to prevent first time administrator usage
Declare @Are_There_Any_Users Bit;
Set @Are_There_Any_Users = 0;

If (Exists(Select Top 1 User_Id From t_TLBoard_Users Order by User_Id asc))
Begin
	Set @Are_There_Any_Users = 1;
End

Select @Are_There_Any_Users as Are_There_Any_Users;

Go

Alter Proc p_TLBoard_Get_User_Details_By_Username_For_Authentication
@Username_For_Authentication NVarChar(50)
As

Select	* 
From	t_TLBoard_Users
Where	Username = @Username_For_Authentication And Is_Active = 1 And Is_Deleted = 0

Go

If (Not Exists(select * from sysobjects where name = 't_TLBoard_App_Permission_Types' and xtype = 'u' and type ='u'))
Begin

	CREATE TABLE [dbo].[t_TLBoard_App_Permission_Types](
		[App_Permission_Type_Id] [tinyint] NOT NULL,
		[App_Permission_Type_Name] [nvarchar](50) NOT NULL,
		[App_Permission_Type_Code] [varchar](50) NOT NULL,
		[App_Permission_Type_Description] [nvarchar](500) NULL,
	 CONSTRAINT [PK_t_TLBoard_App_Permission_Types] PRIMARY KEY CLUSTERED 
	(
		[App_Permission_Type_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

End 

Go

Alter Proc p_TLBoard_Get_App_Permission_Types
As

Select	* 
From	t_TLBoard_App_Permission_Types

Go

--Update t_TLBoard_Users Set App_Permission_Type_Id = 1 Where User_Id = 1 

ALTER Proc [dbo].[p_TLBoard_Get_Users_Administration_List]
@User_Id_Authorized_Employee_Searching_Users Int
As

Select	users.[User_Id],  
		users.Email, 
		users.First_Name, 
		users.Middle_Name , 
		users.Last_Name, 
		users.Username, 
		users.App_Permission_Type_Id
From	t_TLBoard_Users users
Where	users.Is_Active = 1 and users.Is_Deleted = 0

Go

ALTER Proc [dbo].[p_TLBoard_Get_Users_Search]
@Search_Criteria NVarChar(50)
As

Select	[Username]							,
		[App_Permission_Type_Id]			,
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

--Select * from [t_TLBoard_App_Permission_Types]
--Insert Into [t_TLBoard_App_Permission_Types] (App_Permission_Type_Id , App_Permission_Type_Name, App_Permission_Type_Code ,App_Permission_Type_Description)
--Values (1 , 'Application Administrator' , 'Application_Administrator', 'The application administrator, creator and main maintainer.' );

--select * from t_TLBoard_Users
--Truncate table t_TLBoard_Users

ALTER Proc [dbo].[p_TLBoard_Insert_User_Details_Administrative_Registration_Process]
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

--Select * from t_TLBoard_Users


ALTER Proc [dbo].[p_TLBoard_Get_User_Details]
@User_Id Int
As

Select	[User_Id]							,
		[Username]							,
		[Encrypted_Password]				,
		[Encryption_Random_Salt]			,
		[App_Permission_Type_Id]			,
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

--Truncate Table t_TLBoard_Users
--Select * From t_TLBoard_Users

-- Todo tasks.. 
-- 
/*

1) Need more work on permissions / permission types (need to create a regular user for testings)
2) Need to implement add invoice page (should work similar to add expense)
3) Implement add document page
4) Start to implement update pages (For 3 user permissions types -- Administrator(me) Company employee, User) / view details pages (User/Client/Supplier/Expense/Invoice/Document)
5) Implement Application pages: Captcha / exceptions / login tries / Successful login sessions, Currenctly authenticated users/sessions (+ future ability to cancel session)
6) Bank accounts entries 
7) Credit card statements / payments 
8) After all is working, Viewable and updatable  -- Add ability to connect to the entities above (Expenses, Invoices, Documents, Credit card statements ect.. )
*** Credit card statements should also be linkable to expenses/invoices and other documents/ general information and/or future features (like contracts and more information)

*/



