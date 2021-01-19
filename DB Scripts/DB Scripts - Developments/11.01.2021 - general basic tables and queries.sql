

If (Not Exists ( Select Id From sysobjects where xtype = 'U' and [name] = 't_DocMan_Users' ))
Begin

	CREATE TABLE [dbo].[t_DocMan_Users](
		[User_Id] [int] IDENTITY(1,1) NOT NULL,
		[Username] [varchar](50) NULL,
		[EncryptedPassword] [varchar](120) NULL,
		[EncryptionRandomSalt] [varchar](50) NULL,
		[First_Name] [nvarchar](60) NULL,
		[Middle_Name] [nvarchar](60) NULL,
		[Last_Name] [nvarchar](60) NULL,
		[User_Email] [varchar](100) NULL,
		[Country_Id] [smallint] NULL,
		[State_Id] [smallint] NULL,
		[City] [nvarchar](80) NULL,
		[Address] [nvarchar](120) NULL,
		[ZipCode] [varchar](10) NULL,
		[Mobile_Phone] [varchar](20) NULL,
		[Additional_Phone_Number] [varchar](20) NULL,
		[Record_Creation_DateTime_UTC] [datetime] NULL,
		[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
		[Record_Last_Updated_By_User_Id] [int] NULL,
	 CONSTRAINT [PK_t_DocMan_Users] PRIMARY KEY CLUSTERED 
	(
		[User_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

End

GO

If (Not Exists ( Select Id From sysobjects where xtype = 'U' and [name] = 't_DocMan_Invoices' ))
Begin

	CREATE TABLE [dbo].[t_DocMan_Invoices] (
		[Invoice_Record_Id] [int] IDENTITY(1,1) NOT NULL,
		[User_Id] [int] NULL,
		[Client_Id] [int] NULL,
		[Currency_Id] [int] NULL,
		[Total_Without_Vat] [decimal](18, 3) NULL,
		[Total_Vat] [decimal](18, 3) NULL,
		[Vat_Percentage] [decimal](6, 2) NULL,
		[Total_Amount] [decimal](18, 3) NULL,
		[Creation_DateTime] [datetime] NULL,
		[Creation_DateTime_UTC] [datetime] NULL,
		[Invoiced_On_User_Location_Id] [int] NULL,
		[Invoiced_To_CompanyName] [nvarchar](150) NULL,
		[Invoiced_To_PhoneNumber] [nvarchar](50) NULL,
		[Invoiced_To_Address] [nvarchar](50) NULL,
		[Invoice_Number] [int] NULL,
		[Invoice_Reference_Number] [nvarchar](50) NULL,
		[Invoice_Type_Id] [tinyint] NULL,
		[Record_Created_By_User_Id] [int] NULL,
		[Record_Creation_DateTime_UTC] [datetime] NULL,
		[Record_Last_Updated_By_User_Id] [int] NULL,
		[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
		[User_Description] [nvarchar](500) NULL,
		[User_Comments] [nvarchar](500) NULL,
		[Original_File_Name] [nvarchar](255) NULL,
		[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
	 CONSTRAINT [PK_tbl_Invoices] PRIMARY KEY CLUSTERED 
	(
		[Invoice_Record_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

End


GO

If (Not Exists ( Select Id From sysobjects where xtype = 'U' and [name] = 't_DocMan_Expenses' ))
Begin

	CREATE TABLE [dbo].[t_DocMan_Expenses](
		[Expense_Record_Id] [int] IDENTITY(1,1) NOT NULL,
		[User_Id] [int] NULL,
		[Supplier_Id] [int] NULL,
		[Currency_Id] [int] NULL,
		[Total_Without_Vat] [decimal](18, 3) NULL,
		[Total_Vat] [decimal](18, 3) NULL,
		[Vat_Percentage] [decimal](6, 2) NULL,
		[Total_Amount] [decimal](18, 3) NULL,
		[Creation_DateTime] [datetime] NULL,
		[Creation_DateTime_UTC] [datetime] NULL,
		[Invoiced_On_User_Location_Id] [int] NULL,
		[Invoiced_To_CompanyName] [nvarchar](150) NULL,
		[Invoiced_To_PersonName] [nvarchar](100) NULL,
		[Invoiced_To_PhoneNumber] [nvarchar](50) NULL,
		[Invoiced_To_Address] [nvarchar](50) NULL,
		[Invoice_Number] [int] NULL,
		[Invoice_Reference_Number] [nvarchar](50) NULL,
		[Invoice_Type_Id] [tinyint] NULL,
		[Record_Created_By_User_Id] [int] NULL,
		[Record_Creation_DateTime_UTC] [datetime] NULL,
		[Record_Last_Updated_By_User_Id] [int] NULL,
		[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
		[User_Description] [nvarchar](500) NULL,
		[User_Comments] [nvarchar](500) NULL,
		[Original_File_Name] [nvarchar](255) NULL,
		[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
	 CONSTRAINT [PK_t_DocMan_Expenses] PRIMARY KEY CLUSTERED 
	(
		[Expense_Record_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

End

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Insert_User_Details'  ))
Begin
	Drop Proc s_DocMan_Insert_User_Details
End

Go

Create Proc s_DocMan_Insert_User_Details
@Username varchar(50), 
@EncryptedPassword varchar(120), 
@EncryptionRandomSalt varchar(50),
@First_Name nvarchar(60), 
@Middle_Name nvarchar(60),
@Last_Name nvarchar(60),
@User_Email varchar(100),
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

INSERT INTO [dbo].[t_DocMan_Users]
    ([Username]
    ,[EncryptedPassword]
    ,[EncryptionRandomSalt]
    ,[First_Name]
    ,[Middle_Name]
    ,[Last_Name]
    ,[User_Email]
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
	@EncryptedPassword, 
	@EncryptionRandomSalt,
	@First_Name, 
	@Middle_Name,
	@Last_Name,
    @User_Email,
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

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Get_User_Details'  ))
Begin
	Drop Proc s_DocMan_Get_User_Details
End

Go

Create Proc s_DocMan_Get_User_Details
@User_Id Int
As

Select	[Username]							,
		[First_Name]						,
		[Middle_Name]						,
		[Last_Name]							,
		[User_Email]						,
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
From	[dbo].[t_DocMan_Users]
Where	[User_Id] = @User_Id

GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Update_User_Details_Administrative_Side'  ))
Begin
	
	Drop Proc s_DocMan_Update_User_Details_Administrative_Side;

End

Go

Create Proc s_DocMan_Update_User_Details_Administrative_Side
@User_Id Int								, 
@Username varchar(50)						, 
@EncryptedPassword varchar(120)				, 
@EncryptionRandomSalt varchar(120)			, 
@First_Name varchar(120)					, 
@Middle_Name nvarchar(60)					, 
@Last_Name nvarchar(60)						, 
@User_Email varchar(100)					, 
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

UPDATE	[dbo].[t_DocMan_Users]
SET		[Username] = @Username,
		[EncryptedPassword] = @EncryptedPassword,
		[EncryptionRandomSalt] = @EncryptionRandomSalt,
		[First_Name] = @First_Name ,
		[Middle_Name] = @Middle_Name ,
		[Last_Name] = @Last_Name ,
		[User_Email] = @User_Email , 
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

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Delete_User_By_Id_Administrative_Side'  ))
Begin
	
	Drop Proc s_DocMan_Delete_User_By_Id_Administrative_Side;

End

Go

Create Proc s_DocMan_Delete_User_By_Id_Administrative_Side
@User_Id_To_Delete Int			,
@Delete_Reason NVarChar(500)	,	
@Deleted_By_User_Id Int			 
As

Update	t_DocMan_Users 
Set		Is_Deleted = 1 , Deleted_By_User_Id = @Deleted_By_User_Id , 
		Deleted_DateTime_UTC = GETUTCDATE() , Delete_Reason = @Delete_Reason
Where	[User_Id] = @User_Id_To_Delete And ( Is_Deleted is Null Or Is_Deleted = 0 )

Go


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Get_Users_Search'  ))
Begin
	
	Drop Proc s_DocMan_Get_Users_Search;

End

Go

Create Proc s_DocMan_Get_Users_Search
@Search_Criteria NVarChar(50)
As

Select	[Username]							,
		[First_Name]						,
		[Middle_Name]						,
		[Last_Name]							,
		[User_Email]						,
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
From	t_DocMan_Users 
Where	Len( @Search_Criteria ) > 0 
		And (	[First_Name] = @Search_Criteria		Or 
				[Middle_Name] = @Search_Criteria	Or 
				[Last_Name] = @Search_Criteria		Or 
				[User_Email] = @Search_Criteria		Or 
				[City] = @Search_Criteria			Or 
				[ZipCode] = @Search_Criteria		)

Go

--delete From CountriesFromWiki Where len( countrycode ) = 0

--Insert Into t_DocMan_Countries (Country_Code , Country_English_Name)
--Select countrycode,  countryname from CountriesFromWiki order by countryname asc

-- drop table CountriesFromWiki

If (Not Exists ( Select id From sysobjects where xtype = 'U' and name = 't_DocMan_Continents'  ))
Begin
	
	CREATE TABLE [dbo].[t_DocMan_Continents](
		[Continent_Id] [tinyint] NOT NULL,
		[Name] [nvarchar](50) NULL,
	 CONSTRAINT [PK_t_DocMan_Continents] PRIMARY KEY CLUSTERED 
	(
		[Continent_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
	
End

Go

If ( (Select Count(*) From t_DocMan_Continents) != 7)
Begin

	Insert Into t_DocMan_Continents ( Continent_Id, Name )
	Values (1 , 'Africa')

	Insert Into t_DocMan_Continents ( Continent_Id, Name )
	Values (2, 'Antarctica')

	Insert Into t_DocMan_Continents ( Continent_Id, Name )
	Values (3, 'Asia')

	Insert Into t_DocMan_Continents ( Continent_Id, Name )
	Values (4, 'Australia')

	Insert Into t_DocMan_Continents ( Continent_Id, Name )
	Values (5, 'Europe')

	Insert Into t_DocMan_Continents ( Continent_Id, Name )
	Values (6, 'North America')

	Insert Into t_DocMan_Continents ( Continent_Id, Name )
	Values (7, 'South America')

End

--Africa
--Antarctica
--Asia
--Australia
--Europe
--North America
--South America

--------------------

If (Not Exists ( Select id From sysobjects where xtype = 'U' and name = 't_DocMan_Countries'  ))
Begin

	CREATE TABLE [dbo].[t_DocMan_Countries](
		[Country_Id] [smallint] NOT NULL,
		[Country_Code] [varchar](10) NOT NULL,
		[Country_English_Name] [nvarchar](80) NOT NULL,
		[Country_Native_Name] [nvarchar](80) NULL,
		[Continent_Id] [tinyint] NULL,
	 CONSTRAINT [PK_t_DocMan_Countries] PRIMARY KEY CLUSTERED 
	(
		[Country_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

End

GO

If ( ( Select Count(*) From t_DocMan_Countries ) != 231 )
Begin
	
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (1, N'AF', N'Afghanistan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (2, N'AX', N'Åland Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (3, N'AL', N'Albania', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (4, N'DZ', N'Algeria', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (5, N'AS', N'American Samoa', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (6, N'AD', N'Andorra', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (7, N'AO', N'Anla', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (8, N'AI', N'Anguilla', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (9, N'AQ', N'Antarctica', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (10, N'AG', N'Antigua and Barbuda', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (11, N'AR', N'Argentina', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (12, N'AM', N'Armenia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (13, N'AW', N'Aruba', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (14, N'AU', N'Australia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (15, N'AT', N'Austria', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (16, N'AZ', N'Azerbaijan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (17, N'BS', N'Bahamas', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (18, N'BH', N'Bahrain', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (19, N'BD', N'Bangladesh', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (20, N'BB', N'Barbados', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (21, N'BY', N'Belarus', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (22, N'BE', N'Belgium', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (23, N'BZ', N'Belize', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (24, N'BJ', N'Benin', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (25, N'BM', N'Bermuda', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (26, N'BT', N'Bhutan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (27, N'BO', N'Bolivia (Plurinational State of)', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (28, N'BQ', N'Bonaire, Sint Eustatius and Saba', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (29, N'BA', N'Bosnia and Herzevina', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (30, N'BW', N'Botswana', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (31, N'BV', N'Bouvet Island', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (32, N'BR', N'Brazil', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (33, N'IO', N'British Indian Ocean Territory', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (34, N'BN', N'Brunei Darussalam', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (35, N'BG', N'Bulgaria', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (36, N'BF', N'Burkina Faso', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (37, N'BI', N'Burundi', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (38, N'CV', N'Cabo Verde', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (39, N'KH', N'Cambodia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (40, N'CM', N'Cameroon', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (41, N'CA', N'Canada', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (42, N'KY', N'Cayman Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (43, N'CF', N'Central African Republic', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (44, N'TD', N'Chad', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (45, N'CL', N'Chile', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (46, N'CN', N'China', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (47, N'CX', N'Christmas Island', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (48, N'CC', N'Cocos (Keeling) Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (49, N'CO', N'Colombia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (50, N'KM', N'Comoros', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (51, N'CG', N'Con', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (52, N'CD', N'Con, Democratic Republic of the', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (53, N'CK', N'Cook Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (54, N'CR', N'Costa Rica', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (55, N'CI', N'Côte d''Ivoire', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (56, N'HR', N'Croatia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (57, N'CU', N'Cuba', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (58, N'CW', N'Curaçao', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (59, N'CY', N'Cyprus', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (60, N'CZ', N'Czechia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (61, N'DK', N'Denmark', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (62, N'DJ', N'Djibouti', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (63, N'DM', N'Dominica', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (64, N'DO', N'Dominican Republic', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (65, N'EC', N'Ecuador', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (66, N'EG', N'Egypt', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (67, N'SV', N'El Salvador', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (68, N'GQ', N'Equatorial Guinea', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (69, N'ER', N'Eritrea', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (70, N'EE', N'Estonia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (71, N'SZ', N'Eswatini', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (72, N'ET', N'Ethiopia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (73, N'FK', N'Falkland Islands (Malvinas)', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (74, N'FO', N'Faroe Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (75, N'FJ', N'Fiji', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (76, N'FI', N'Finland', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (77, N'FR', N'France', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (78, N'GF', N'French Guiana', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (79, N'PF', N'French Polynesia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (80, N'TF', N'French Southern Territories', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (81, N'GA', N'Gabon', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (82, N'GM', N'Gambia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (83, N'GE', N'Georgia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (84, N'DE', N'Germany', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (85, N'GH', N'Ghana', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (86, N'GI', N'Gibraltar', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (87, N'GR', N'Greece', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (88, N'GL', N'Greenland', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (89, N'GD', N'Grenada', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (90, N'GP', N'Guadeloupe', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (91, N'GU', N'Guam', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (92, N'GT', N'Guatemala', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (93, N'GG', N'Guernsey', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (94, N'GN', N'Guinea', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (95, N'GW', N'Guinea-Bissau', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (96, N'GY', N'Guyana', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (97, N'HT', N'Haiti', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (98, N'HM', N'Heard Island and McDonald Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (99, N'HN', N'Honduras', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (100, N'HK', N'Hong Kong', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (101, N'HU', N'Hungary', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (102, N'IS', N'Iceland', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (103, N'IN', N'India', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (104, N'ID', N'Indonesia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (105, N'IR', N'Iran (Islamic Republic of)', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (106, N'IQ', N'Iraq', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (107, N'IE', N'Ireland', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (108, N'IM', N'Isle of Man', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (109, N'IL', N'Israel', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (110, N'IT', N'Italy', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (111, N'JM', N'Jamaica', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (112, N'JP', N'Japan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (113, N'JE', N'Jersey', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (114, N'JO', N'Jordan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (115, N'KZ', N'Kazakhstan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (116, N'KE', N'Kenya', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (117, N'KI', N'Kiribati', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (118, N'KP', N'Korea (Democratic People''s Republic of)', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (119, N'KR', N'Korea, Republic of', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (120, N'KW', N'Kuwait', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (121, N'KG', N'Kyrgyzstan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (122, N'LA', N'Lao People''s Democratic Republic', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (123, N'LV', N'Latvia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (124, N'LB', N'Lebanon', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (125, N'LS', N'Lesotho', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (126, N'LR', N'Liberia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (127, N'LY', N'Libya', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (128, N'LI', N'Liechtenstein', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (129, N'LT', N'Lithuania', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (130, N'LU', N'Luxembourg', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (131, N'MO', N'Macao', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (132, N'MG', N'Madagascar', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (133, N'MW', N'Malawi', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (134, N'MY', N'Malaysia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (135, N'MV', N'Maldives', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (136, N'ML', N'Mali', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (137, N'MT', N'Malta', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (138, N'MH', N'Marshall Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (139, N'MQ', N'Martinique', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (140, N'MR', N'Mauritania', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (141, N'MU', N'Mauritius', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (142, N'MX', N'Mexico', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (143, N'FM', N'Micronesia (Federated States of)', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (144, N'MD', N'Moldova, Republic of', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (145, N'MC', N'Monaco', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (146, N'MN', N'Monlia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (147, N'ME', N'Montenegro', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (148, N'MS', N'Montserrat', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (149, N'MA', N'Morocco', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (150, N'MZ', N'Mozambique', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (151, N'MM', N'Myanmar', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (152, N'NA', N'Namibia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (153, N'NR', N'Nauru', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (154, N'NP', N'Nepal', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (155, N'NL', N'Netherlands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (156, N'NC', N'New Caledonia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (157, N'NZ', N'New Zealand', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (158, N'NI', N'Nicaragua', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (159, N'NE', N'Niger', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (160, N'NG', N'Nigeria', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (161, N'NU', N'Niue', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (162, N'NF', N'Norfolk Island', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (163, N'MK', N'North Macedonia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (164, N'MP', N'Northern Mariana Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (165, N'NO', N'Norway', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (166, N'OM', N'Oman', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (167, N'PK', N'Pakistan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (168, N'PW', N'Palau', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (169, N'PS', N'Palestine, State of', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (170, N'PA', N'Panama', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (171, N'PG', N'Papua New Guinea', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (172, N'PY', N'Paraguay', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (173, N'PE', N'Peru', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (174, N'PH', N'Philippines', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (175, N'PN', N'Pitcairn', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (176, N'PL', N'Poland', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (177, N'PT', N'Portugal', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (178, N'PR', N'Puerto Rico', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (179, N'QA', N'Qatar', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (180, N'RE', N'Réunion', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (181, N'RO', N'Romania', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (182, N'RU', N'Russian Federation', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (183, N'RW', N'Rwanda', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (184, N'BL', N'Saint Barthélemy', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (185, N'SH', N'Saint Helena, Ascension and Tristan da Cunha', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (186, N'KN', N'Saint Kitts and Nevis', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (187, N'LC', N'Saint Lucia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (188, N'MF', N'Saint Martin (French part)', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (189, N'PM', N'Saint Pierre and Miquelon', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (190, N'SM', N'San Marino', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (191, N'ST', N'Sao Tome and Principe', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (192, N'SA', N'Saudi Arabia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (193, N'SN', N'Senegal', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (194, N'RS', N'Serbia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (195, N'SC', N'Seychelles', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (196, N'SL', N'Sierra Leone', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (197, N'SG', N'Singapore', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (198, N'SX', N'Sint Maarten (Dutch part)', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (199, N'SK', N'Slovakia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (200, N'SI', N'Slovenia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (201, N'SB', N'Solomon Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (202, N'SO', N'Somalia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (203, N'GS', N'South Georgia and the South Sandwich Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (204, N'SS', N'South Sudan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (205, N'ES', N'Spain', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (206, N'LK', N'Sri Lanka', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (207, N'SD', N'Sudan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (208, N'SR', N'Suriname', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (209, N'SJ', N'Svalbard and Jan Mayen', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (210, N'SE', N'Sweden', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (211, N'CH', N'Switzerland', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (212, N'SY', N'Syrian Arab Republic', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (213, N'TW', N'Taiwan, Province of China', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (214, N'TJ', N'Tajikistan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (215, N'TZ', N'Tanzania, United Republic of', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (216, N'TH', N'Thailand', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (217, N'TL', N'Timor-Leste', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (218, N'TG', N'To', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (219, N'TK', N'Tokelau', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (220, N'TO', N'Tonga', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (221, N'TT', N'Trinidad and Toba', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (222, N'TN', N'Tunisia', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (223, N'TR', N'Turkey', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (224, N'TM', N'Turkmenistan', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (225, N'TC', N'Turks and Caicos Islands', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (226, N'TV', N'Tuvalu', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (227, N'UG', N'Uganda', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (228, N'UA', N'Ukraine', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (229, N'AE', N'United Arab Emirates', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (230, N'GB', N'United Kingdom of Great Britain and Northern Ireland', NULL, NULL);
	INSERT [dbo].[t_DocMan_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id]) VALUES (231, N'EH', N'Western Sahara', NULL, NULL);

End

Go

























