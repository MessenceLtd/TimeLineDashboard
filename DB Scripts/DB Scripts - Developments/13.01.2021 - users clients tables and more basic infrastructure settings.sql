Use [DocumentsManager];


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Insert_Client_Details'  ))
Begin

	Drop Proc p_DocMan_Insert_Client_Details

End

Go

Create Proc p_DocMan_Insert_Client_Details
@User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Client_Type_Id smallint, @Main_Contact_FullName nvarchar(100),
@Main_Contact_Email_Address nvarchar(100), @Main_Contact_Phone_Number nvarchar(50),
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_DocMan_Clients]
           ([User_Id] , [Company_Name] , [Website_URL] , [Country_Id] , 
			[State_Id] , [City] , [Address] , [ZipCode] , [Telephone] ,
			[Mobile_Phone] , [Client_Type_Id] , [Main_Contact_FullName] ,
			[Main_Contact_Email_Address] , [Main_Contact_Phone_Number],
			Record_Created_By_User_Id, Record_Creation_DateTime_UTC, 
			Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC
			)
     VALUES	(
			@User_Id, @Company_Name, 
			@Website_URL, @Country_Id , 
			@State_Id, @City , @Address, 
			@ZipCode, @Telephone, @Mobile_Phone, 
			@Client_Type_Id, @Main_Contact_FullName,
			@Main_Contact_Email_Address, @Main_Contact_Phone_Number,
			@Creating_User_Id, GETUTCDATE(), 
			@Creating_User_Id, GETUTCDATE()
			)

Select @@IDENTITY;


GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Update_Client_Details'  ))
Begin

	Drop Proc p_DocMan_Update_Client_Details

End

Go

Create Proc p_DocMan_Update_Client_Details
@Client_Id Int, @User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Client_Type_Id smallint, @Main_Contact_FullName nvarchar(100),
@Main_Contact_Email_Address nvarchar(100), @Main_Contact_Phone_Number nvarchar(50),
@Updating_User_Id Int
As

UPDATE	[dbo].[t_DocMan_Clients]
SET		[Company_Name] = @Company_Name, 
		[Website_URL] = @Website_URL,
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City,
		[Address] = @Address,
		[ZipCode] = @ZipCode, 
		[Telephone] = @Telephone,
		[Mobile_Phone] = @Mobile_Phone,
		[Client_Type_Id] = @Client_Type_Id,
		[Main_Contact_FullName] = @Main_Contact_FullName,
		[Main_Contact_Email_Address] = @Main_Contact_Email_Address,
		[Main_Contact_Phone_Number] = @Main_Contact_Phone_Number,
		[Record_Last_Updated_By_User_Id] = @Updating_User_Id, 
		[Record_Last_Updated_DateTime_UTC] = GETUTCDATE()
		
WHERE	Client_Id = @Client_Id

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Delete_Client_Details'  ))
Begin

	Drop Proc p_DocMan_Delete_Client_Details

End

Go

Create Proc p_DocMan_Delete_Client_Details
@Client_Id Int, 
@Deleting_User_Id Int
As

UPDATE	[dbo].[t_DocMan_Clients]
SET		Is_Deleted = 1, 
		[Record_Deleted_By_User_Id] = @Deleting_User_Id, 
		[Record_Deleted_DateTime_UTC] = GETUTCDATE()
WHERE	Client_Id = @Client_Id And [User_Id] = @Deleting_User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 )

GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Get_Clients_Search'  ))
Begin

	Drop Proc p_DocMan_Get_Clients_Search

End

Go

Create Proc p_DocMan_Get_Clients_Search
@User_Id Int,
@Search_Criteria NVarChar(50) 
As

Select	Client_Id, Company_Name, Website_URL, Country_Id, State_Id, City , Mobile_Phone, Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number
From	t_DocMan_Clients 
Where	[User_Id] = @User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 ) And 
		(	Company_Name Like '%'+@Search_Criteria+'%' Or
			Website_URL Like '%' + @Search_Criteria + '%' Or
			City Like '%' + @Search_Criteria + '%'  Or
			Main_Contact_FullName Like '%' + @Search_Criteria + '%'
			) 


GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Get_Client_Details'  ))
Begin

	Drop Proc p_DocMan_Get_Client_Details

End

Go

Create Proc p_DocMan_Get_Client_Details
@Client_Id Int, 
@User_Id Int
As

Select	Client.*
From	t_DocMan_Clients client
Where	client.[Client_Id] = @Client_Id And client.[User_Id] = @User_Id 
		And ( client.Is_Deleted Is Null Or client.Is_Deleted = 0 )  


GO

