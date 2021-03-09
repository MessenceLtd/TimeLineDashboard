Use [DashboardTimeLine];
Go 

/**** Todos:: developments fixed on this long script:

1) list + update + view  Expenses
2) list + update + view  Invoices
3) list + update + view  Documents

*/


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Invoice_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Invoice_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Update_Invoice_Details]
@Invoice_Record_Id int, @Client_Id int, 
@Invoice_DateTime datetime, @Currency_Id TinyInt,
@Total_Amount decimal(18,3), @Vat_Percentage decimal(6,2), 
@Total_Without_Vat decimal(18,3), @Total_Vat decimal(18,3), 
@Creation_DateTime datetime,
@Invoiced_Client_On_User_Location_Id int, @Invoiced_Client_To_CompanyName nvarchar(150),
@Invoiced_Client_To_Tax_Reference nvarchar(50), @Invoiced_Client_To_PersonName nvarchar(100),
@Invoiced_Client_To_PhoneNumber nvarchar(50), @Invoiced_Client_To_Country_Id smallint,
@Invoiced_Client_To_State_Id smallint, @Invoiced_Client_To_City nvarchar(100), 
@Invoiced_Client_To_Address nvarchar(120), @Invoiced_Client_To_Zip nvarchar(10),
@Invoiced_Client_To_EmailAddress nvarchar(120), @Invoice_Type_Id tinyint, 
@Invoice_Number nvarchar(30), @Invoice_Reference_Number nvarchar(50), 
@Invoice_Content_Long_Description nvarchar(2000), @User_Description nvarchar(1000),
@User_Comments nvarchar(1000), @Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, @Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, 
@Is_Active bit, @Updating_User_Id int
As

Update	[dbo].[t_TLBoard_Invoices] 
Set
	Client_Id = @Client_Id, 
	Invoice_DateTime = @Invoice_DateTime, 
	Currency_Id = @Currency_Id, 
	Total_Amount = @Total_Amount,
	Vat_Percentage = @Vat_Percentage, 
	Total_Without_Vat = @Total_Without_Vat , 
	Total_Vat = @Total_Vat, 
	Creation_DateTime = @Creation_DateTime,
	Invoiced_Client_On_User_Location_Id = @Invoiced_Client_On_User_Location_Id, 
	Invoiced_Client_To_CompanyName = @Invoiced_Client_To_CompanyName,
	Invoiced_Client_To_Tax_Reference = @Invoiced_Client_To_Tax_Reference, 
	Invoiced_Client_To_PersonName = @Invoiced_Client_To_PersonName, 
	Invoiced_Client_To_PhoneNumber = @Invoiced_Client_To_PhoneNumber, 
	Invoiced_Client_To_Country_Id = @Invoiced_Client_To_Country_Id, 
	Invoiced_Client_To_State_Id = @Invoiced_Client_To_State_Id, 
	Invoiced_Client_To_City = @Invoiced_Client_To_City, 
	Invoiced_Client_To_Address = @Invoiced_Client_To_Address, 
	Invoiced_Client_To_Zip = @Invoiced_Client_To_Zip,
	Invoiced_Client_To_EmailAddress = @Invoiced_Client_To_EmailAddress, 
	Invoice_Type_Id = @Invoice_Type_Id, 
	Invoice_Number = @Invoice_Number, 
	Invoice_Reference_Number = @Invoice_Reference_Number, 
	Invoice_Content_Long_Description = @Invoice_Content_Long_Description, 
	User_Description = @User_Description,
	User_Comments = @User_Comments, 
	Is_Visible_To_Anonymous_Users = @Is_Visible_To_Anonymous_Users,
	Is_Available_For_Download_For_Anonymous_Users = @Is_Available_For_Download_For_Anonymous_Users, 
	Is_Visible_To_Followers_Users = @Is_Visible_To_Followers_Users,
	Is_Available_For_Download_For_Followers_Users = @Is_Available_For_Download_For_Followers_Users, 
	Record_Last_Updated_By_User_Id = @Updating_User_Id, 
	Record_Last_Updated_DateTime_UTC = GETUTCDATE(),
	Is_Active = @Is_Active
Where Invoice_Record_Id = @Invoice_Record_Id And [User_Id] = @Updating_User_Id And Is_Deleted = 0

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Expense_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Expense_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Update_Expense_Details]
@Expense_Record_Id int,										
@Supplier_Id Int, 
@Expense_Invoice_DateTime DateTime,
@Currency_Id TinyInt, 
@Total_Amount Decimal(18,3), 
@Vat_Percentage Decimal(6,2),
@Total_Without_Vat Decimal(18,3), 
@Total_Vat Decimal(18,3), 
@Invoiced_Client_On_User_Location_Id int,
@Invoiced_Client_To_CompanyName NVarChar(150), 
@Invoiced_Client_To_Tax_Reference NVarchar(100),
@Invoiced_Client_To_PersonName NVarchar(100),
@Invoiced_Client_To_PhoneNumber NVarChar(50), 
@Invoiced_Client_To_Country_Id SmallInt, 
@Invoiced_Client_To_State_Id SmallInt, 
@Invoiced_Client_To_City NVarChar(100), 
@Invoiced_Client_To_Address NVarChar(120), 
@Invoiced_Client_To_Zip NVarChar(10), 
@Invoiced_Client_To_EmailAddress NVarChar(120),
@Expense_Type_Id TinyInt, 
@Invoice_Number NVarChar(30), 
@Invoice_Reference_Number NVarChar(50),
@Invoice_Supplier_Company_Details NVarChar(120), 
@Invoice_Supplier_Tax_Reference NVarChar(50), 
@Invoice_Supplier_Country_Id SmallInt,
@Invoice_Supplier_State_Id SmallInt, 
@Invoice_Supplier_City NVarChar(100),
@Invoice_Supplier_Address_Description NVarChar(255),
@Invoice_Supplier_ZipCode NVarChar(10),
@Invoice_Supplier_WebAddress NVarChar(120), 
@Invoice_Supplier_Phone_Number NVarChar(50),
@Invoice_Supplier_Contact_FullName NVarChar(80), 
@Invoice_Content_Long_Description NVarChar(2000),
@User_Description NVarChar(1000), 
@User_Comments NVarChar(1000), 
@Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, 
@Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, 
@Updating_User_Id Int,
@Is_Active bit
As

Update	[dbo].[t_TLBoard_Expenses] 
Set
	Supplier_Id = @Supplier_Id , 
	Expense_Invoice_DateTime = @Expense_Invoice_DateTime ,
	Currency_Id = @Currency_Id, 
	Total_Amount = @Total_Amount, 
	Vat_Percentage = @Vat_Percentage,
	Total_Without_Vat = @Total_Without_Vat, 
	Total_Vat = @Total_Vat, 
	Invoiced_Client_On_User_Location_Id = @Invoiced_Client_On_User_Location_Id,
	Invoiced_Client_To_CompanyName = @Invoiced_Client_To_CompanyName, 
	Invoiced_Client_To_Tax_Reference = @Invoiced_Client_To_Tax_Reference,
	Invoiced_Client_To_PersonName = @Invoiced_Client_To_PersonName,
	Invoiced_Client_To_PhoneNumber = @Invoiced_Client_To_PhoneNumber, 
	Invoiced_Client_To_Country_Id = @Invoiced_Client_To_Country_Id,
	Invoiced_Client_To_State_Id = @Invoiced_Client_To_State_Id,
	Invoiced_Client_To_City = @Invoiced_Client_To_City,
	Invoiced_Client_To_Address = @Invoiced_Client_To_Address,
	Invoiced_Client_To_Zip = @Invoiced_Client_To_Zip, 
	Invoiced_Client_To_EmailAddress = @Invoiced_Client_To_EmailAddress,
	Expense_Type_Id = @Expense_Type_Id, 
	Invoice_Number = @Invoice_Number, 
	Invoice_Reference_Number = @Invoice_Reference_Number,
	Invoice_Supplier_Company_Details = @Invoice_Supplier_Company_Details, 
	Invoice_Supplier_Tax_Reference = @Invoice_Supplier_Tax_Reference, 
	Invoice_Supplier_Country_Id = @Invoice_Supplier_Country_Id,
	Invoice_Supplier_State_Id = @Invoice_Supplier_State_Id, 
	Invoice_Supplier_City = @Invoice_Supplier_City,
	Invoice_Supplier_Address_Description = @Invoice_Supplier_Address_Description,
	Invoice_Supplier_ZipCode = @Invoice_Supplier_ZipCode,
	Invoice_Supplier_WebAddress = @Invoice_Supplier_WebAddress, 
	Invoice_Supplier_Phone_Number = @Invoice_Supplier_Phone_Number,
	Invoice_Supplier_Contact_FullName = @Invoice_Supplier_Contact_FullName, 
	Invoice_Content_Long_Description = @Invoice_Content_Long_Description,
	User_Description = @User_Description, 
	User_Comments = @User_Comments, 
	Is_Visible_To_Anonymous_Users = @Is_Visible_To_Anonymous_Users,
	Is_Available_For_Download_For_Anonymous_Users = @Is_Available_For_Download_For_Anonymous_Users, 
	Is_Visible_To_Followers_Users = @Is_Visible_To_Followers_Users,
	Is_Available_For_Download_For_Followers_Users = @Is_Available_For_Download_For_Followers_Users, 
	Record_Last_Updated_By_User_Id = @Updating_User_Id, 
	Record_Last_Updated_DateTime_UTC = GETUTCDATE(),
	Is_Active = @Is_Active
Where Expense_Record_Id = @Expense_Record_Id And [User_Id] = @Updating_User_Id And Is_Deleted = 0

Go


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Expense_Details'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Expense_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Insert_Expense_Details]
@User_Id int, @Supplier_Id Int, @Expense_Invoice_DateTime DateTime,
@Currency_Id TinyInt, @Total_Amount Decimal(18,3), @Vat_Percentage Decimal(6,2),
@Total_Without_Vat Decimal(18,3), @Total_Vat Decimal(18,3), @Invoiced_Client_On_User_Location_Id int,
@Invoiced_Client_To_CompanyName NVarChar(150), @Invoiced_Client_To_Tax_Reference nvarchar(50),
@Invoiced_Client_To_PersonName NVarchar(100), @Invoiced_Client_To_PhoneNumber NVarChar(50), 
@Invoiced_Client_To_Country_Id SmallInt, @Invoiced_Client_To_State_Id SmallInt, @Invoiced_Client_To_City NVarChar(100), 
@Invoiced_Client_To_Address NVarChar(120), @Invoiced_Client_To_Zip NVarChar(10), @Invoiced_Client_To_EmailAddress NVarChar(120),
@Expense_Type_Id TinyInt, @Invoice_Number NVarChar(30), @Invoice_Reference_Number NVarChar(50),
@Invoice_Supplier_Company_Details NVarChar(120), 
@Invoice_Supplier_Tax_Reference NVarChar(50), @Invoice_Supplier_Country_Id SmallInt,
@Invoice_Supplier_State_Id SmallInt, @Invoice_Supplier_City NVarChar(100),
@Invoice_Supplier_Address_Description NVarChar(255),
@Invoice_Supplier_ZipCode NVarChar(10),
@Invoice_Supplier_WebAddress NVarChar(120), @Invoice_Supplier_Phone_Number NVarChar(50),
@Invoice_Supplier_Contact_FullName NVarChar(80), @Invoice_Content_Long_Description NVarChar(2000),
@User_Description NVarChar(1000), @User_Comments NVarChar(1000), @Original_File_Name nvarchar(255),
@Azure_Block_Blob_Reference NVarchar(255), @Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, @Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, @Record_Created_By_User_Id int,
@Record_Creation_DateTime_UTC DateTime,
@Record_Last_Updated_By_User_Id Int,
@Record_Last_Updated_DateTime_UTC DateTime,
@Is_Active bit
As

INSERT INTO [dbo].[t_TLBoard_Expenses]
			   ([User_Id]
			   ,[Supplier_Id]
			   ,[Expense_Invoice_DateTime]
			   ,[Currency_Id]
			   ,[Total_Amount]
			   ,[Vat_Percentage]
			   ,[Total_Without_Vat]
			   ,[Total_Vat]
			   ,[Invoiced_Client_On_User_Location_Id]
			   ,[Invoiced_Client_To_CompanyName]
			   ,[Invoiced_Client_To_Tax_Reference]
			   ,[Invoiced_Client_To_PersonName]
			   ,[Invoiced_Client_To_PhoneNumber]
			   ,[Invoiced_Client_To_Country_Id]
			   ,[Invoiced_Client_To_State_Id]
			   ,[Invoiced_Client_To_City]
			   ,[Invoiced_Client_To_Address]
			   ,[Invoiced_Client_To_Zip]
			   ,[Invoiced_Client_To_EmailAddress]
			   ,[Expense_Type_Id]
			   ,[Invoice_Number]
			   ,[Invoice_Reference_Number]
			   ,[Invoice_Supplier_Company_Details]
			   ,[Invoice_Supplier_Tax_Reference]
			   ,[Invoice_Supplier_Country_Id]
			   ,[Invoice_Supplier_State_Id]
			   ,[Invoice_Supplier_City]
			   ,[Invoice_Supplier_Address_Description]
			   ,[Invoice_Supplier_ZipCode]
			   ,[Invoice_Supplier_WebAddress]
			   ,[Invoice_Supplier_Phone_Number]
			   ,[Invoice_Supplier_Contact_FullName]
			   ,[Invoice_Content_Long_Description]
			   ,[User_Description]
			   ,[User_Comments]
			   ,[Original_File_Name]
			   ,[Azure_Block_Blob_Reference]
			   ,[Is_Visible_To_Anonymous_Users]
			   ,[Is_Available_For_Download_For_Anonymous_Users]
			   ,[Is_Visible_To_Followers_Users]
			   ,[Is_Available_For_Download_For_Followers_Users]
			   ,[Record_Created_By_User_Id]
			   ,[Record_Creation_DateTime_UTC]
			   ,[Record_Last_Updated_By_User_Id]
			   ,[Record_Last_Updated_DateTime_UTC]
			   ,[Is_Active]
			   )
     VALUES	(	@User_Id , @Supplier_Id , @Expense_Invoice_DateTime ,
				@Currency_Id, @Total_Amount, @Vat_Percentage,
				@Total_Without_Vat, @Total_Vat, @Invoiced_Client_On_User_Location_Id,
				@Invoiced_Client_To_CompanyName, 
				@Invoiced_Client_To_Tax_Reference,
				@Invoiced_Client_To_PersonName,
				@Invoiced_Client_To_PhoneNumber, 
				@Invoiced_Client_To_Country_Id,
				@Invoiced_Client_To_State_Id,
			    @Invoiced_Client_To_City,
				@Invoiced_Client_To_Address,
				@Invoiced_Client_To_Zip, 
				@Invoiced_Client_To_EmailAddress,
				@Expense_Type_Id, @Invoice_Number, @Invoice_Reference_Number,
				@Invoice_Supplier_Company_Details, 
				@Invoice_Supplier_Tax_Reference, @Invoice_Supplier_Country_Id,
				@Invoice_Supplier_State_Id, @Invoice_Supplier_City,
				@Invoice_Supplier_Address_Description,
				@Invoice_Supplier_ZipCode,
				@Invoice_Supplier_WebAddress, @Invoice_Supplier_Phone_Number,
				@Invoice_Supplier_Contact_FullName, @Invoice_Content_Long_Description,
				@User_Description, @User_Comments, @Original_File_Name,
				@Azure_Block_Blob_Reference, @Is_Visible_To_Anonymous_Users,
				@Is_Available_For_Download_For_Anonymous_Users, @Is_Visible_To_Followers_Users,
				@Is_Available_For_Download_For_Followers_Users, 
				@Record_Created_By_User_Id, @Record_Creation_DateTime_UTC,
				@Record_Last_Updated_By_User_Id, @Record_Last_Updated_DateTime_UTC , @Is_Active )

Select @@IDENTITY;

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Expense_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Expense_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Expense_Details]
@Expense_Record_Id Int, 
@User_Id_Expense_Owner Int, 
@User_Id_Searching_For_Expense_Details Int
As 

Select	expense.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Expenses expense
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = expense.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = expense.Record_Last_Updated_By_User_Id
Where	expense.[Expense_Record_Id] = @Expense_Record_Id And expense.[User_Id] = @User_Id_Expense_Owner 
		And ( expense.Is_Deleted Is Null Or expense.Is_Deleted = 0 )  

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Invoice_Latest_Invoice_By_Client_Id'  ))
Begin
	Drop Proc [p_TLBoard_Get_Invoice_Latest_Invoice_By_Client_Id]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Invoice_Latest_Invoice_By_Client_Id]
@Client_Id Int, @Searching_User_Id Int
As

Select		Top 1 Invoices.* 
From		t_TLBoard_Invoices Invoices
Where		Invoices.Client_Id = @Client_Id
Order By	Invoices.Invoice_DateTime desc

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Invoice_Latest_Invoice_By_Client_Id_And_Invoice_DateTime'  ))
Begin
	Drop Proc [p_TLBoard_Get_Invoice_Latest_Invoice_By_Client_Id_And_Invoice_DateTime]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Invoice_Latest_Invoice_By_Client_Id_And_Invoice_DateTime]
@Client_Id Int, @Invoice_DateTime DateTime, @Searching_User_Id Int
As

Select		Top 1 Invoices.* 
From		t_TLBoard_Invoices Invoices
Where		Invoices.Client_Id = @Client_Id And Invoices.Invoice_DateTime <= @Invoice_DateTime
Order By	Invoices.Invoice_DateTime desc  

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Client_Details'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Client_Details]
End

Go

CREATE Proc [dbo].[p_TLBoard_Insert_Client_Details]
@User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Default_Currency_Id TinyInt, @Country_Id smallint,
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
           ([User_Id] , [Company_Name] , [Website_URL], [Default_Currency_Id] , [Country_Id] , 
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
			@Website_URL, @Default_Currency_Id, @Country_Id , 
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

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Client_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Client_Details]
End

Go

CREATE Proc [dbo].[p_TLBoard_Update_Client_Details]
@Client_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Default_Currency_Id TinyInt, @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Client_Type_Id smallint, @Client_Tax_Reference_Number NVarChar(50),  
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100), 
@Main_Contact_Phone_Number nvarchar(50),
@Client_From_Date DateTime , @Client_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Updating_User_Id Int
As

Update	[dbo].[t_TLBoard_Clients]
Set		[Company_Name] = @Company_Name , 
		[Website_URL] = @Website_URL , 
		[Default_Currency_Id] = @Default_Currency_Id, 
		[Country_Id] = @Country_Id , 
		[State_Id] = @State_Id , 
		[City] = @City , 
		[Address] = @Address , 
		[ZipCode] = @ZipCode , 
		[Telephone] = @Telephone ,
		[Mobile_Phone] = @Mobile_Phone , 
		[Client_Type_Id] = @Client_Type_Id, 
		[Client_Tax_Reference_Number] = @Client_Tax_Reference_Number, 
		[Main_Contact_FullName] = @Main_Contact_FullName, 
		[Main_Contact_Email_Address] = @Main_Contact_Email_Address , 
		[Main_Contact_Phone_Number] = @Main_Contact_Phone_Number,
		[Client_From_Date] = @Client_From_Date, 
		[Client_To_Date] = @Client_To_Date, 
		[First_Contract_Date] = @First_Contract_Date,
		[First_Contract_Signed_With_Contact_Full_Name] = @First_Contract_Signed_With_Contact_Full_Name ,  
		[First_Contract_Signed_In_Location_Description] = @First_Contract_Signed_In_Location_Description,
		Is_Active = @Is_Active, 
		Record_Last_Updated_By_User_Id = @Updating_User_Id , 
		Record_Last_Updated_DateTime_UTC = GETUTCDATE() 
Where	Client_Id = @Client_Id And Is_Deleted = 0 And [User_Id] = @Updating_User_Id

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Invoice_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Invoice_Details]
End

Go

CREATE Proc [dbo].[p_TLBoard_Get_Invoice_Details]
@Invoice_Record_Id Int, 
@User_Id_Invoice_Owner Int, 
@User_Id_Searching_For_Invoice_Details Int
As 

Select	invoice.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Invoices invoice
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = invoice.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = invoice.Record_Last_Updated_By_User_Id
Where	invoice.[Invoice_Record_Id] = @Invoice_Record_Id And invoice.Is_Deleted = 0 
		And invoice.[User_Id] = @User_Id_Invoice_Owner


Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_General_Document_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_General_Document_Details]
End

Go

CREATE Proc [dbo].[p_TLBoard_Update_General_Document_Details]
@General_Document_Id int, @General_Document_Type SmallInt, @Title nvarchar(200),
@Description nvarchar(1500), @Document_Creation_DateTime datetime,
@Sent_By_Entity_Name nvarchar(100), @Sent_By_Entity_Country_Id smallint,
@Sent_By_Entity_State_Id smallint, @Sent_By_Entity_City nvarchar(100),
@Sent_By_Entity_Address nvarchar(150), @Sent_By_Entity_ZipCode nvarchar(20),
@Sent_By_Entity_DateTime datetime, @Sent_By_Entity_Email_Address nvarchar(100),
@Sent_To_Entity_Name nvarchar(100), @Sent_To_Entity_Country_Id smallint,
@Sent_To_Entity_State_Id smallint, @Sent_To_Entity_City nvarchar(100),
@Sent_To_Entity_Address nvarchar(150), @Sent_To_Entity_ZipCode nvarchar(20),
@Sent_To_Entity_Email_Address nvarchar(150), @Recieved_Document_DateTime datetime,
@Recieved_In_Country_Id smallint, @Recieved_In_State_Id smallint,
@Recieved_In_City nvarchar(100), @Recieved_In_Address nvarchar(150),
@Recieved_In_ZipCode nvarchar(20), @Recieved_In_Email_Address nvarchar(100),
@User_Comments nvarchar(500), @Recieved_By_User_Id int, @Recieved_DateTime datetime,
@Is_Visible_To_Anonymous_Users bit, @Is_Available_For_Download_For_Anonymous_Users bit,
@Is_Visible_To_Followers_Users bit, @Is_Available_For_Download_For_Followers_Users bit,
@Is_Active bit, @Updating_User_Id Int
As

Update	[dbo].[t_TLBoard_General_Documents]
Set		General_Document_Type = @General_Document_Type, 
		Title = @Title,
		Description = @Description, 
		Document_Creation_DateTime = @Document_Creation_DateTime, 
		Sent_By_Entity_Name = @Sent_By_Entity_Name, 
		Sent_By_Entity_Country_Id = @Sent_By_Entity_Country_Id, 
		Sent_By_Entity_State_Id = @Sent_By_Entity_State_Id, 
		Sent_By_Entity_City = @Sent_By_Entity_City, 
		Sent_By_Entity_Address = @Sent_By_Entity_Address, 
		Sent_By_Entity_ZipCode = @Sent_By_Entity_ZipCode,
		Sent_By_Entity_DateTime = @Sent_By_Entity_DateTime, 
		Sent_By_Entity_Email_Address = @Sent_By_Entity_Email_Address, 
		Sent_To_Entity_Name = @Sent_To_Entity_Name, 
		Sent_To_Entity_Country_Id = @Sent_To_Entity_Country_Id, 
		Sent_To_Entity_State_Id = @Sent_To_Entity_State_Id, 
		Sent_To_Entity_City = @Sent_To_Entity_City, 
		Sent_To_Entity_Address = @Sent_To_Entity_Address, 
		Sent_To_Entity_ZipCode = @Sent_To_Entity_ZipCode, 
		Sent_To_Entity_Email_Address = @Sent_To_Entity_Email_Address, 
		Recieved_Document_DateTime = @Recieved_Document_DateTime, 
		Recieved_In_Country_Id = @Recieved_In_Country_Id, 
		Recieved_In_State_Id = @Recieved_In_State_Id, 
		Recieved_In_City = @Recieved_In_City, 
		Recieved_In_Address = @Recieved_In_Address, 
		Recieved_In_ZipCode = @Recieved_In_ZipCode,
		Recieved_In_Email_Address = @Recieved_In_Email_Address, 
		User_Comments = @User_Comments, 
		Recieved_By_User_Id = @Recieved_By_User_Id, 
		Recieved_DateTime = @Recieved_DateTime, 
		Is_Visible_To_Anonymous_Users = @Is_Visible_To_Anonymous_Users,
		Is_Available_For_Download_For_Anonymous_Users = @Is_Available_For_Download_For_Anonymous_Users,
		Is_Visible_To_Followers_Users = @Is_Visible_To_Followers_Users, 
		Is_Available_For_Download_For_Followers_Users = @Is_Available_For_Download_For_Followers_Users, 
		Is_Active = @Is_Active
Where General_Document_Id = @General_Document_Id And [User_Id] = @Updating_User_Id And Is_Deleted = 0

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_General_Document_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_General_Document_Details]
End

Go

CREATE Proc [dbo].[p_TLBoard_Get_General_Document_Details]
@General_Document_Id Int, 
@User_Id_Document_Owner Int, 
@User_Id_Searching_For_Document_Details Int
As 

Select	documents.*,
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_General_Documents documents
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = documents.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = documents.Record_Last_Updated_By_User_Id
Where	documents.[General_Document_Id] = @General_Document_Id And 
		documents.[User_Id] = @User_Id_Document_Owner  And ( documents.Is_Deleted = 0 ) 

Go


--select * from t_TLBoard_Expenses
--select * from t_TLBoard_Invoices
--select * from t_TLBoard_General_Documents



