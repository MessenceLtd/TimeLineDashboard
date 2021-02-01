Use [DashboardTimeLine]; 

Go


ALTER Proc [dbo].[p_TLBoard_Get_Client_Details]
@Client_Id Int, 
@User_Id Int
As

Select	Client.*
From	t_TLBoard_Clients client
Where	client.[Client_Id] = @Client_Id And client.[User_Id] = @User_Id 
		And ( client.Is_Deleted Is Null Or client.Is_Deleted = 0 )  

Go

ALTER Proc [dbo].[p_TLBoard_Insert_Client_Details]
@User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Client_Type_Id smallint, @Client_Tax_Reference_Number NVarChar(50),  
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100), 
@Main_Contact_Phone_Number nvarchar(50),
@Client_From_Date DateTime , @Client_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Clients]
           ([User_Id] , [Company_Name] , [Website_URL] , [Country_Id] , 
			[State_Id] , [City] , [Address] , [ZipCode] , [Telephone] ,
			[Mobile_Phone] , [Client_Type_Id], [Client_Tax_Reference_Number] , 
			[Main_Contact_FullName] , [Main_Contact_Email_Address] , [Main_Contact_Phone_Number],
			[Client_From_Date], [Client_To_Date], [First_Contract_Date],
			[First_Contract_Signed_With_Contact_Full_Name],  
			[First_Contract_Signed_In_Location_Description], 
			Is_Active, Record_Created_By_User_Id, Record_Creation_DateTime_UTC, 
			Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC
			)
     VALUES	(
			@User_Id, @Company_Name, 
			@Website_URL, @Country_Id , 
			@State_Id, @City , @Address, 
			@ZipCode, @Telephone, @Mobile_Phone, 
			@Client_Type_Id, @Client_Tax_Reference_Number,
			@Main_Contact_FullName, @Main_Contact_Email_Address, 
			@Main_Contact_Phone_Number,
			@Client_From_Date, @Client_To_Date, @First_Contract_Date,
			@First_Contract_Signed_With_Contact_Full_Name, 
			@First_Contract_Signed_In_Location_Description,
			@Is_Active,
			@Creating_User_Id, GETUTCDATE(), 
			@Creating_User_Id, GETUTCDATE()
			);

Select @@IDENTITY;

Go


ALTER Proc [dbo].[p_TLBoard_Get_Clients_Search]
@Search_Criteria NVarChar(50) ,
@User_Id Int
As

Select	Client_Id,[User_Id], Company_Name, Website_URL, Country_Id, State_Id, City, 
		Mobile_Phone, Client_Type_Id, 
		Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number, 
		Is_Active , Is_Deleted
From	t_TLBoard_Clients 
Where	[User_Id] = @User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 ) And 
		(	Company_Name Like '%'+@Search_Criteria+'%' Or
			Website_URL Like '%' + @Search_Criteria + '%' Or
			City Like '%' + @Search_Criteria + '%'  Or
			Main_Contact_FullName Like '%' + @Search_Criteria + '%'
			) 

Go


ALTER Proc [dbo].[p_TLBoard_Insert_Supplier_Details]
@User_Id int, @Company_Name nvarchar(100),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40), 
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number nvarchar(20),
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100),
@Main_Contact_Phone_Number nvarchar(50), 
@Client_From_Date DateTime , @Client_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Record_Created_By_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Suppliers]
           ([User_Id] , [Company_Name], [Website_URL], 
		   [Country_Id], [State_Id], [City], [Address], [ZipCode]
           ,[Telephone]
           ,[Mobile_Phone]
           ,[Supplier_Type_Id]
           ,[Supplier_Tax_Reference_Number]
           ,[Main_Contact_FullName]
           ,[Main_Contact_Email_Address]
           ,[Main_Contact_Phone_Number]
		   ,[Supplier_From_Date], [Supplier_To_Date], [First_Contract_Date]
		   ,[First_Contract_Signed_With_Contact_Full_Name]  
		   ,[First_Contract_Signed_In_Location_Description] 
		   ,Is_Active
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           )
     VALUES
           (@User_Id , @Company_Name, @Website_URL, @Country_Id, @State_Id, @City,
            @Address, @ZipCode, @Telephone, 
			@Mobile_Phone, @Supplier_Type_Id, @Supplier_Tax_Reference_Number,
			@Main_Contact_FullName, @Main_Contact_Email_Address, 
			@Main_Contact_Phone_Number, 
			@Client_From_Date, @Client_To_Date, @First_Contract_Date,
			@First_Contract_Signed_With_Contact_Full_Name, 
			@First_Contract_Signed_In_Location_Description,
			@Is_Active,
			@Record_Created_By_User_Id, 
			GETUTCDATE(), 
			@Record_Created_By_User_Id,
			GETUTCDATE()
           )

Select @@IDENTITY;

Go

Alter Proc [dbo].[p_TLBoard_Get_Suppliers_Search]
@Search_Criteria NVarChar(50) ,
@User_Id Int
As

Select	Supplier_Id,[User_Id], Company_Name, Website_URL, Country_Id, State_Id, City, 
		Mobile_Phone, Supplier_Type_Id, 
		Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number, 
		Is_Active , Is_Deleted
From	t_TLBoard_Suppliers 
Where	[User_Id] = @User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 ) And 
		(	Company_Name Like '%'+@Search_Criteria+'%' Or
			Website_URL Like '%' + @Search_Criteria + '%' Or
			City Like '%' + @Search_Criteria + '%'  Or
			Main_Contact_FullName Like '%' + @Search_Criteria + '%'
			) 


Go


Alter Proc [dbo].[p_TLBoard_Get_Supplier_Details]
@Supplier_Id Int, 
@User_Id Int
As

Select	supplier.*
From	t_TLBoard_Suppliers supplier
Where	supplier.[Supplier_Id] = @Supplier_Id And supplier.[User_Id] = @User_Id 
		And ( supplier.Is_Deleted Is Null Or supplier.Is_Deleted = 0 )  

Go



-- Select * From t_TLBoard_Clients  
--Select * From t_TLBoard_Suppliers 
-- Update t_TLBoard_Clients set Is_Deleted = 0;