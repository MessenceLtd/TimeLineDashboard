Use [DashboardTimeLine]; 

Go


ALTER Proc [dbo].[p_TLBoard_Insert_Expense_Details]
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
@Azure_Block_Blob_Reference NVarchar(256), @Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, @Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, 
@Record_Created_By_User_Id int,
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
				@Record_Created_By_User_Id, 
                GETUTCDATE(),
                @Is_Active )

Select @@IDENTITY;

Go

ALTER Proc [dbo].[p_TLBoard_Get_Suppliers_List_By_User_Id]
@User_Id Int, @Searching_User_Id Int
As

Select	Supplier_Id, [User_Id], Company_Name As Company_Name, 
        suppliers.Country_Id , suppliers.State_Id,  
        suppliers.City , suppliers.[Address],  
        Default_Currency_Id, Default_Vat_Percentage
From	t_TLBoard_Suppliers suppliers
Where	suppliers.[User_Id] = @User_Id And 
		suppliers.Is_Active = 1 And 
		suppliers.Is_Deleted = 0 


Go

--  Select * From [t_TLBoard_Expenses] 
--  Truncate Table [t_TLBoard_Expenses] 

Go

ALTER Proc [dbo].[p_TLBoard_Insert_Expense_Details]
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
@Azure_Block_Blob_Reference NVarchar(256), @Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, @Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, 
@Record_Created_By_User_Id int,
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
				@Record_Created_By_User_Id, 
                GETUTCDATE(),
                @Record_Created_By_User_Id, 
                GETUTCDATE(),
                @Is_Active )

Select @@IDENTITY;

Go


ALTER Proc [dbo].[p_TLBoard_Get_Expenses_Search]
@User_Id Int,
@Filter_By_Type SmallInt,
@Filter_By_Country SmallInt , 
@Filter_By_State SmallInt , 
@Filter_By_City_Or_Address_Or_ZipCode NVarChar(50) , 
@Filter_By_CompanyName_Or_Person_Fullname NVarChar(50)
As

Select	Expense_Record_Id , expense.[User_Id], 
		Expense_Invoice_DateTime, 
		expense.Supplier_Id,
        expense.Original_File_Name,
        expense.Azure_Block_Blob_Reference,
		Invoice_Number, Invoice_Reference_Number,
		expense.Invoice_Supplier_Company_Details , 
		expense.Invoice_Supplier_Tax_Reference , 
		supplier.Website_URL As Supplier_Website_Url, 
		expense.Invoice_Supplier_Country_Id , 
		country.Country_English_Name As Invoice_Supplier_Country_Name,
		expense.Invoice_Supplier_State_Id, 
		expense.Invoice_Supplier_City, 
		expense.Invoice_Supplier_Contact_FullName, 
		Expense_Type_Id, Expense.Currency_Id, 
		currency.Currency_Symbol, expense.Total_Amount, expense.Total_Without_Vat, 
		expense.Total_Vat, expense.Vat_Percentage,
		expense.Is_Visible_To_Anonymous_Users, expense.Is_Available_For_Download_For_Anonymous_Users,
		expense.Is_Visible_To_Followers_Users, expense.Is_Available_For_Download_For_Followers_Users,
		expense.Is_Active 
From		t_TLBoard_Expenses expense
Join		t_TLBoard_Suppliers supplier on expense.Supplier_Id = supplier.Supplier_Id
Left Join	t_TLBoard_Countries country On country.Country_Id = expense.Invoice_Supplier_Country_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = expense.Currency_Id
Where	expense.[User_Id] = @User_Id And ( expense.Is_Deleted Is Null Or expense.Is_Deleted = 0 ) And 
		(@Filter_By_Type Is Null Or Expense_Type_Id = @Filter_By_Type ) And 
		(@Filter_By_Country Is Null Or expense.Invoice_Supplier_Country_Id = @Filter_By_Country ) And 
		(@Filter_By_State Is Null Or State_Id = @Filter_By_State ) And 
		(@Filter_By_City_Or_Address_Or_ZipCode Is Null Or Len(@Filter_By_City_Or_Address_Or_ZipCode) = 0 
			Or City Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' 
			Or Address Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%'
			Or ZipCode Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' ) And 
		(@Filter_By_CompanyName_Or_Person_Fullname Is Null Or Len(@Filter_By_CompanyName_Or_Person_Fullname) = 0
			Or Company_Name Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or Website_URL Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%'
			Or Main_Contact_FullName Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' ) 

Go


ALTER Proc [dbo].[p_TLBoard_Get_General_Documents_Search]
@User_Id Int,
@Filter_By_Type SmallInt,
@Filter_By_Country SmallInt , 
@Filter_By_State SmallInt , 
@Filter_By_City_Or_Address_Or_ZipCode NVarChar(50) , 
@Filter_By_CompanyName_Or_Person_Fullname NVarChar(50)
As

Select	document.General_Document_Id , 
		document.[User_Id], 
		document.Title, document.[Description] , 
        document.Original_File_Name,
        document.Azure_Block_Blob_Reference,
		document.General_Document_Type ,
		document.Document_Creation_DateTime, 
		document.Sent_By_Entity_Name , 
		document.Sent_By_Entity_Country_Id ,
		country.Country_English_Name As Sent_By_Entity_Country_Name,
		document.Sent_By_Entity_State_Id ,
		document.Sent_By_Entity_City, 
		document.Sent_By_Entity_Email_Address, 
		document.Recieved_Document_DateTime, 
		document.Is_Visible_To_Anonymous_Users, document.Is_Available_For_Download_For_Anonymous_Users,
		document.Is_Visible_To_Followers_Users, document.Is_Available_For_Download_For_Followers_Users,
		document.Is_Active 
From		t_TLBoard_General_Documents document
Left Join	t_TLBoard_Countries country On country.Country_Id = document.Sent_By_Entity_Country_Id
Where	document.[User_Id] = @User_Id And ( document.Is_Deleted Is Null Or document.Is_Deleted = 0 ) And 
		(@Filter_By_Type Is Null Or General_Document_Type = @Filter_By_Type ) And 
		(@Filter_By_Country Is Null Or document.Sent_By_Entity_Country_Id = @Filter_By_Country ) And 
		(@Filter_By_State Is Null Or document.Sent_By_Entity_State_Id = @Filter_By_State ) And 
		(@Filter_By_City_Or_Address_Or_ZipCode Is Null Or Len(@Filter_By_City_Or_Address_Or_ZipCode) = 0 
			Or [Sent_By_Entity_City] Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' 
			Or [Sent_By_Entity_Address] Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%'
			Or [Sent_By_Entity_ZipCode] Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' ) And 
		(@Filter_By_CompanyName_Or_Person_Fullname Is Null Or Len(@Filter_By_CompanyName_Or_Person_Fullname) = 0
			Or document.Title Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or document.Description Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or Sent_By_Entity_Name Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or Sent_By_Entity_Email_Address Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' ) 

Go


ALTER Proc [dbo].[p_TLBoard_Get_Invoices_Search]
@User_Id Int,
@Filter_By_Type SmallInt,
@Filter_By_Country SmallInt , 
@Filter_By_State SmallInt , 
@Filter_By_City_Or_Address_Or_ZipCode NVarChar(50) , 
@Filter_By_CompanyName_Or_Person_Fullname NVarChar(50)
As

Select	Invoice_Record_Id , Invoice.[User_Id], 
		Invoice_DateTime, 
		Invoice.Client_Id,
        Invoice.Original_File_Name,
        Invoice.Azure_Block_Blob_Reference,
		Invoice_Number, Invoice_Reference_Number,
		Invoice.Invoiced_Client_To_CompanyName , 
		Invoice.Invoiced_Client_To_Tax_Reference , 
		client.Website_URL As Supplier_Website_Url, 
		Invoice.Invoiced_Client_To_Country_Id , 
		country.Country_English_Name As Invoiced_Client_To_Country_Name,
		Invoice.Invoiced_Client_To_State_Id, 
		Invoice.Invoiced_Client_To_City, 
		Invoice.Invoiced_Client_To_PersonName, 
		Invoice_Type_Id, Invoice.Currency_Id, 
		currency.Currency_Symbol, Invoice.Total_Amount, Invoice.Total_Without_Vat, 
		Invoice.Total_Vat, Invoice.Vat_Percentage,
		Invoice.Is_Visible_To_Anonymous_Users, Invoice.Is_Available_For_Download_For_Anonymous_Users,
		Invoice.Is_Visible_To_Followers_Users, Invoice.Is_Available_For_Download_For_Followers_Users,
		Invoice.Is_Active 
From		t_TLBoard_Invoices Invoice
Join		t_TLBoard_Clients client on Invoice.Client_Id = client.Client_Id
Left Join	t_TLBoard_Countries country On country.Country_Id = Invoice.Invoiced_Client_To_Country_Id
Left Join	t_TLBoard_Currencies currency On currency.Currency_Id = Invoice.Currency_Id
Where	Invoice.[User_Id] = @User_Id And ( Invoice.Is_Deleted Is Null Or Invoice.Is_Deleted = 0 ) And 
		(@Filter_By_Type Is Null Or Invoice_Type_Id = @Filter_By_Type ) And 
		(@Filter_By_Country Is Null Or Invoice.Invoiced_Client_To_Country_Id = @Filter_By_Country ) And 
		(@Filter_By_State Is Null Or State_Id = @Filter_By_State ) And 
		(@Filter_By_City_Or_Address_Or_ZipCode Is Null Or Len(@Filter_By_City_Or_Address_Or_ZipCode) = 0 
			Or City Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' 
			Or Address Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%'
			Or ZipCode Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' ) And 
		(@Filter_By_CompanyName_Or_Person_Fullname Is Null Or Len(@Filter_By_CompanyName_Or_Person_Fullname) = 0
			Or Company_Name Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or Website_URL Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%'
			Or Main_Contact_FullName Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' ) 

Go

ALTER Proc [dbo].[p_TLBoard_Update_Expense_Details]
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
@Original_File_Name NVarChar(256),
@Azure_Block_Blob_Reference NVarChar(256),
@File_Uploaded Bit,
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

If (@File_Uploaded Is Not Null And @File_Uploaded = 1)
Begin
    
    Update	[dbo].[t_TLBoard_Expenses] 
    Set     Original_File_Name = @Original_File_Name , Azure_Block_Blob_Reference = @Azure_Block_Blob_Reference
    Where   Expense_Record_Id = @Expense_Record_Id And [User_Id] = @Updating_User_Id And Is_Deleted = 0

End

Go


ALTER Proc [dbo].[p_TLBoard_Insert_Client_Details]
@User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt, @Default_Vat_Percentage Decimal(6,2),
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
           ([User_Id] , [Company_Name] , [Website_URL], [Country_Id] , 
			[State_Id] , [City] , [Address] , [ZipCode] , 
            [Default_Currency_Id] , [Default_Vat_Percentage], 
            [Telephone] ,[Mobile_Phone] , 
            [Client_Type_Id], [Client_Tax_Reference_Number] , 
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
			@State_Id, @City , @Address, @ZipCode, 
            @Default_Currency_Id , @Default_Vat_Percentage, 
            @Telephone, @Mobile_Phone, 
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

ALTER Proc [dbo].[p_TLBoard_Update_Client_Details]
@Client_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), 
@Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt, @Default_Vat_Percentage Decimal(6,2),
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
        [Default_Vat_Percentage] = @Default_Vat_Percentage, 
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

Go


ALTER Proc [dbo].[p_TLBoard_Insert_Invoice_Details]
@User_Id int, @Client_Id int, 
@Invoice_DateTime datetime, @Currency_Id tinyint,
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
@User_Comments nvarchar(1000), @Original_File_Name nvarchar(255),
@Azure_Block_Blob_Reference nvarchar(255), @Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, @Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, 
@Record_Created_By_User_Id int, @Is_Active bit
As

INSERT INTO [dbo].[t_TLBoard_Invoices] (
				[User_Id], [Client_Id], 
				[Invoice_DateTime], [Currency_Id],
				[Total_Amount], [Vat_Percentage],
				[Total_Without_Vat],[Total_Vat],
				[Creation_DateTime], 
				[Invoiced_Client_On_User_Location_Id], [Invoiced_Client_To_CompanyName],
				[Invoiced_Client_To_Tax_Reference], [Invoiced_Client_To_PersonName],
				[Invoiced_Client_To_PhoneNumber], [Invoiced_Client_To_Country_Id],
				[Invoiced_Client_To_State_Id],[Invoiced_Client_To_City],
				[Invoiced_Client_To_Address], [Invoiced_Client_To_Zip],
				[Invoiced_Client_To_EmailAddress], [Invoice_Number], 
				[Invoice_Reference_Number], [Invoice_Type_Id],
				[Invoice_Content_Long_Description], [User_Description],
				[User_Comments], [Original_File_Name],
				[Azure_Block_Blob_Reference], [Is_Visible_To_Anonymous_Users],
				[Is_Available_For_Download_For_Anonymous_Users], [Is_Visible_To_Followers_Users],
				[Is_Available_For_Download_For_Followers_Users],[Record_Created_By_User_Id],
				[Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id],
				[Record_Last_Updated_DateTime_UTC], [Is_Active] )
     VALUES (	@User_Id, @Client_Id , 
				@Invoice_DateTime , @Currency_Id ,
				@Total_Amount, @Vat_Percentage, 
				@Total_Without_Vat , @Total_Vat , 
				@Creation_DateTime , 
				@Invoiced_Client_On_User_Location_Id, @Invoiced_Client_To_CompanyName,
				@Invoiced_Client_To_Tax_Reference, @Invoiced_Client_To_PersonName ,
				@Invoiced_Client_To_PhoneNumber, @Invoiced_Client_To_Country_Id,
				@Invoiced_Client_To_State_Id, @Invoiced_Client_To_City, 
				@Invoiced_Client_To_Address, @Invoiced_Client_To_Zip,
				@Invoiced_Client_To_EmailAddress, @Invoice_Number,
				@Invoice_Reference_Number, @Invoice_Type_Id, 
				@Invoice_Content_Long_Description, @User_Description,
				@User_Comments, @Original_File_Name,
				@Azure_Block_Blob_Reference, @Is_Visible_To_Anonymous_Users,
				@Is_Available_For_Download_For_Anonymous_Users, @Is_Visible_To_Followers_Users,
				@Is_Available_For_Download_For_Followers_Users, 
                @Record_Created_By_User_Id,
				GETUTCDATE(), 
                @Record_Created_By_User_Id,
				GETUTCDATE() , @Is_Active )

Select @@IDENTITY;

Go

--delete from t_TLBoard_Clients

Go

-- Changed invoices types 
--Invoice_Type_Id	Invoice_Type_Name	Description	Record_Created_By_User_Id	Record_Creation_DateTime_UTC	Record_Last_Updated_By_User_Id	Record_Last_Updated_DateTime_UTC	Is_Active	Is_Visible	Sort_Order
--1	Tax Invoice	General Tax Invoice	1	2021-02-01 18:56:20.137	1	2021-02-01 18:56:20.137	1	1	1
--3	Receipt Tax Invoice	tax invoice + reciept payment	1	2021-05-20 23:32:00.000	1	2021-05-20 23:32:00.000	1	1	2
--5	Receipt	Receipt for payment on 1 or more invoices	1	2021-05-20 23:32:00.000	1	2021-05-20 23:32:00.000	1	1	3
--6	Credit	Credit Invoice	1	2021-05-20 23:32:00.000	1	2021-05-20 23:32:00.000	1	1	4

-- Autocomplete of invoice upload needs more work with autonumbers extractions, short cuts and prevent duplications 

Go

Alter Proc [dbo].[p_TLBoard_Get_Invoice_Next_Invoice_Number_Based_On_Invoice_Type]
@User_Id Int, 
@Invoice_Type_Id TinyInt 
As

Declare @Next_Invoice_Number Int; 

Set @Next_Invoice_Number =  (   Select  Max(Invoice_Number) Max_Invoice_Number
                                From    t_TLBoard_Invoices
                                Where   [User_Id] = @User_Id And Invoice_Type_Id = @Invoice_Type_Id );

-- The next invoice number based on the invoice type might be null (because there are no invoices for him of that type)

If (@Next_Invoice_Number Is Not Null)
Begin
    Set @Next_Invoice_Number = @Next_Invoice_Number + 1;
End 
--Else
--Begin 
--    -- ToDo -- Use the default starting values for the invoice type that the user selected in his profile
--End

Select @Next_Invoice_Number;

Go

-- Procedures to add: 
-- p_TLBoard_Get_Credit_Cards_Search
-- p_TLBoard_Get_Credit_Card_Details
-- p_TLBoard_Insert_Credit_Card_Details
-- p_TLBoard_Update_Credit_Card_Details

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Credit_Cards_Search'  ))
Begin
	Drop Proc [p_TLBoard_Get_Credit_Cards_Search]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Credit_Cards_Search]
@User_Id Int , @Bank_Account_Id Int 
As

Select  creditCard.* ,
        bankAccount.Bank_Name as Bank_Account_Name
From    t_TLBoard_Credit_Cards creditCard
Join    t_TLBoard_Bank_Accounts bankAccount On creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id
Where   creditCard.[User_Id] = @User_Id And 
        (creditCard.Is_Deleted = 0 Or creditCard.Is_Deleted Is Null) And 
        (@Bank_Account_Id Is Null Or creditCard.Bank_Account_Id = @Bank_Account_Id)

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Credit_Card_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Credit_Card_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Credit_Card_Details]
@Credit_Card_Id Int, 
@User_Id_Owner Int, 
@User_Id_Searching_For_Credit_Card Int
As 

Select	creditCard.* , 
        bankAccount.Bank_Name as Bank_Account_Name ,
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Credit_Cards creditCard
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = creditCard.Record_Created_By_User_Id
Left Join t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = creditCard.Record_Last_Updated_By_User_Id
Join    t_TLBoard_Bank_Accounts bankAccount On creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id
Where	creditCard.[Credit_Card_Id] = @Credit_Card_Id And creditCard.[User_Id] = @User_Id_Owner 
		And ( creditCard.Is_Deleted Is Null Or creditCard.Is_Deleted = 0 )  

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Credit_Card_Details'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Credit_Card_Details]
End

Go

Create Proc p_TLBoard_Insert_Credit_Card_Details
@Bank_Account_Id Int, 
@User_Id_Owner Int, 
@Card_Name NVarChar(40), 
@Four_Ending_Digits NVarChar(4),
@Expiration_Date SmallDateTime, 
@Is_Active Bit,
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Credit_Cards]
           ([Bank_Account_Id]
           ,[User_Id]
           ,[Card_Name]
           ,[Four_Ending_Digits]
           ,[Expiration_Date]
           ,[Is_Active]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC] )
     VALUES
           (@Bank_Account_Id
           ,@User_Id_Owner
           ,@Card_Name
           ,@Four_Ending_Digits
           ,@Expiration_Date
           ,@Is_Active
           ,@Creating_User_Id
           ,GETUTCDATE()
           ,@Creating_User_Id
           ,GETUTCDATE() )

Select @@IDENTITY

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Credit_Card_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Credit_Card_Details]
End

Go

Create Proc p_TLBoard_Update_Credit_Card_Details
@Credit_Card_Id Int, 
@Bank_Account_Id Int, 
@Card_Name NVarChar(40), 
@Four_Ending_Digits NVarChar(4),
@Expiration_Date SmallDateTime, 
@Is_Active Bit,
@Updating_User_Id Int
As

UPDATE  [dbo].[t_TLBoard_Credit_Cards]
SET     [Bank_Account_Id] = @Bank_Account_Id , 
        [Card_Name] = @Card_Name ,
        [Four_Ending_Digits] = @Four_Ending_Digits , 
        [Expiration_Date] = @Expiration_Date , 
        [Is_Active] = @Is_Active , 
        [Record_Last_Updated_By_User_Id] = @Updating_User_Id ,
        [Record_Last_Updated_DateTime_UTC] = GetUTCDate() 
WHERE   Credit_Card_Id = @Credit_Card_Id And [User_Id] = @Updating_User_Id

GO

-- Select * From [t_TLBoard_Credit_Cards]
--truncate table t_TLBoard_Credit_Cards

Go

/******************************************************/
/***********  Credit Card Statements     **************/
/******************************************************/

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Credit_Card_Statements_List'  ))
Begin
	Drop Proc [p_TLBoard_Get_Credit_Card_Statements_List]
End

Go

Create Proc p_TLBoard_Get_Credit_Card_Statements_List
@User_ID_Bank_Owner Int, 
@Bank_Account_Id Int, 
@User_ID_Searching Int
As

Select      CCStatement.* ,
            bankAccount.Bank_Name as Bank_Account_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatement.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatement.Record_Last_Updated_By_User_Id
Where       bankAccount.[User_Id]       = @User_ID_Bank_Owner And
            @User_ID_Searching          = @User_ID_Bank_Owner And
            ( @Bank_Account_Id Is Null Or @Bank_Account_Id <= 0 Or bankAccount.Bank_Account_Id = @Bank_Account_Id )

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Credit_Card_Statement_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Credit_Card_Statement_Details]
End

Go

Create Proc p_TLBoard_Get_Credit_Card_Statement_Details
@Bank_Account_Credit_Card_Statement_Id Int, 
@User_ID_Bank_Owner Int, 
@User_ID_Searching Int
As

Select      CCStatement.* ,
            bankAccount.[User_Id] As Bank_Account_Owner_User_Id, 
            bankAccount.Bank_Name as Bank_Account_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = CCStatement.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = CCStatement.Record_Last_Updated_By_User_Id
Where       CCStatement.Bank_Account_Credit_Card_Statement_Id = @Bank_Account_Credit_Card_Statement_Id And
            creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id And
            bankAccount.[User_Id] = @User_ID_Bank_Owner And
            @User_ID_Searching = @User_ID_Bank_Owner


Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Credit_Card_Statement'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Credit_Card_Statement]
End

Go

Create Proc p_TLBoard_Insert_Credit_Card_Statement
@User_Id_Bank_Owner Int,
@Bank_Account_Id Int , 
@Credit_Card_Id Int,
@Statement_Date DateTime,
@Total_Amount Decimal(16,2),
@Currency_Id TinyInt,
@Original_File_Name NVarChar(255),
@Azure_Block_Blob_Reference nvarchar(255),
@Bank_Account_Transaction_Id_Connection BigInt,
@Is_Visible_To_Anonymous_Users Bit,
@Is_Available_For_Download_For_Anonymous_Users Bit,
@Is_Visible_To_Followers_Users Bit,
@Is_Available_For_Download_For_Followers_Users Bit,
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements]
      (     [Bank_Account_Id]                               ,
            [Credit_Card_Id]                                ,
            [Statement_Date]                                ,       
            [Total_Amount]                                  ,
            [Currency_Id]                                   ,
            [Original_File_Name]                            ,
            [Azure_Block_Blob_Reference]                    ,
            [Bank_Account_Transaction_Id_Connection]        ,
            [Is_Visible_To_Anonymous_Users]                 ,
            [Is_Available_For_Download_For_Anonymous_Users] ,
            [Is_Visible_To_Followers_Users]                 ,
            [Is_Available_For_Download_For_Followers_Users] ,
            [Record_Created_By_User_Id]                     ,
            [Record_Creation_DateTime_UTC]                  ,
            [Record_Last_Updated_By_User_Id]                ,
            [Record_Last_Updated_DateTime_UTC]  )
     VALUES
        (   @Bank_Account_Id                                , 
            @Credit_Card_Id                                 ,
            @Statement_Date                                 ,
            @Total_Amount                                   ,
            @Currency_Id                                    ,
            @Original_File_Name                             ,
            @Azure_Block_Blob_Reference                     ,
            @Bank_Account_Transaction_Id_Connection         ,
            @Is_Visible_To_Anonymous_Users                  ,
            @Is_Available_For_Download_For_Anonymous_Users  , 
            @Is_Visible_To_Followers_Users                  , 
            @Is_Available_For_Download_For_Followers_Users  , 
            @Creating_User_Id                               ,
            GETUTCDATE()                                    ,
            @Creating_User_Id                               , 
            GETUTCDATE()               
        )

Select @@IDENTITY;

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Credit_Card_Statement'  ))
Begin
	Drop Proc [p_TLBoard_Update_Credit_Card_Statement]
End

Go

Create Proc p_TLBoard_Update_Credit_Card_Statement
@Bank_Account_Credit_Card_Statement_Id Int ,
@Credit_Card_Id Int ,
@Statement_Date DateTime,
@Total_Amount Decimal(16,2),
@Currency_Id TinyInt,
@Original_File_Name NVarChar(255),
@Azure_Block_Blob_Reference NVarChar(255),
@File_Uploaded Bit,
@Bank_Account_Transaction_Id_Connection BigInt,
@Is_Visible_To_Anonymous_Users Bit,
@Is_Available_For_Download_For_Anonymous_Users Bit,
@Is_Visible_To_Followers_Users Bit,
@Is_Available_For_Download_For_Followers_Users Bit,
@Updating_User_Id Int
As

Declare @_l_Bank_Account_Credit_Card_Statement_Id Int; 

Set @_l_Bank_Account_Credit_Card_Statement_Id = 
    (   
        Select  Bank_Account_Credit_Card_Statement_Id 
        From    [t_TLBoard_Bank_Accounts_Credit_Cards_Statements] CCStatement
        Join    t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
        Join    t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
        Where   CCStatement.Bank_Account_Credit_Card_Statement_Id = @Bank_Account_Credit_Card_Statement_Id And
                bankAccount.[User_Id] = @Updating_User_Id
    );


UPDATE  [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements]
   SET  [Credit_Card_Id] = @Credit_Card_Id                                                  ,
        [Statement_Date] = @Statement_Date                                                  ,
        [Total_Amount] = @Total_Amount                                                      , 
        [Currency_Id] = @Currency_Id                                                        ,
        [Bank_Account_Transaction_Id_Connection] = @Bank_Account_Transaction_Id_Connection  ,
        [Is_Visible_To_Anonymous_Users] = @Is_Visible_To_Anonymous_Users                    , 
        [Is_Available_For_Download_For_Anonymous_Users] = @Is_Available_For_Download_For_Anonymous_Users ,
        [Is_Visible_To_Followers_Users] = @Is_Visible_To_Followers_Users,
        [Is_Available_For_Download_For_Followers_Users] = @Is_Available_For_Download_For_Followers_Users ,
        [Record_Last_Updated_By_User_Id] = @Updating_User_Id    ,
        [Record_Last_Updated_DateTime_UTC] = GetUTCDate()
WHERE   Bank_Account_Credit_Card_Statement_Id = @_l_Bank_Account_Credit_Card_Statement_Id

If ( @File_Uploaded Is Not Null And @File_Uploaded = 1 )
Begin
    
    Update	[dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements] 
    Set     Original_File_Name = @Original_File_Name , Azure_Block_Blob_Reference = @Azure_Block_Blob_Reference
    Where   Bank_Account_Credit_Card_Statement_Id = @_l_Bank_Account_Credit_Card_Statement_Id And Is_Deleted = 0

End

GO

/*******************************************************************/
/***********  Credit Card Statements Transactions     **************/
/*******************************************************************/

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Credit_Card_Statement_Transaction'  ))
Begin
	Drop Proc [p_TLBoard_Update_Credit_Card_Statement_Transaction]
End

Go

Create Proc [p_TLBoard_Update_Credit_Card_Statement_Transaction]
@Credit_Card_Statement_Transaction_Id BigInt ,
@Transaction_Date DateTime ,
@Business_Name NVarChar(50),
@Transaction_Amount Decimal(10,2),
@Transaction_Amount_Currency_Id TinyInt,
@Transaction_Actual_Payment_Amount Decimal(10,2),
@Description NVarChar(80),
@Has_Been_Actually_Charged_In_Statement Bit,
@Total_Charged_In_Statement Decimal(10,2),
@User_Description NVarChar(300),
@User_Comments NVarChar(300),
@Is_Visible Bit,
@Updating_User_Id Int
As

Update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
Set     Transaction_Date = @Transaction_Date, 
        Business_Name = @Business_Name, 
        Transaction_Amount = @Transaction_Amount,
        Transaction_Amount_Currency_Id = @Transaction_Amount_Currency_Id, 
        Transaction_Actual_Payment_Amount = @Transaction_Actual_Payment_Amount, 
        [Description] = @Description, 
        Has_Been_Actually_Charged_In_Statement = @Has_Been_Actually_Charged_In_Statement, 
        Total_Charged_In_Statement = @Total_Charged_In_Statement, 
        User_Description = @User_Description,
        User_Comments = @User_Comments,
        Is_Visible = @Is_Visible,
        Record_Last_Updated_By_User_Id = @Updating_User_Id,
        Record_Last_Updated_DateTime_UTC = GETUTCDATE()
Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And Is_Deleted = 0 

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Credit_Card_Statement_Transaction'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Credit_Card_Statement_Transaction]
End

Go

Create Proc [p_TLBoard_Insert_Credit_Card_Statement_Transaction]
@Bank_Account_Credit_Card_Statement_Id Int ,
@Transaction_Date DateTime ,
@Business_Name NVarChar(50),
@Transaction_Amount Decimal(10,2),
@Transaction_Amount_Currency_Id TinyInt,
@Transaction_Actual_Payment_Amount Decimal(10,2),
@Description NVarChar(80),
@Has_Been_Actually_Charged_In_Statement Bit,
@Total_Charged_In_Statement Decimal(10,2),
@User_Description NVarChar(300),
@User_Comments NVarChar(300),
@Is_Visible Bit,
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions]
    (
        [Bank_Account_Credit_Card_Statement_Id],
        [Transaction_Date],
        [Business_Name],
        [Transaction_Amount],
        [Transaction_Amount_Currency_Id],
        [Transaction_Actual_Payment_Amount],
        [Description],
        [Has_Been_Actually_Charged_In_Statement],
        [Total_Charged_In_Statement],
        [User_Description],
        [User_Comments],
        [Is_Visible],
        [Record_Created_By_User_Id],
        [Record_Creation_DateTime_UTC],
        [Record_Last_Updated_By_User_Id],
        [Record_Last_Updated_DateTime_UTC]
    )
VALUES
    (   @Bank_Account_Credit_Card_Statement_Id,
        @Transaction_Date,
        @Business_Name,
        @Transaction_Amount,
        @Transaction_Amount_Currency_Id,
        @Transaction_Actual_Payment_Amount,
        @Description,
        @Has_Been_Actually_Charged_In_Statement,
        @Total_Charged_In_Statement,
        @User_Description, 
        @User_Comments,
        @Is_Visible,
        @Creating_User_Id,
        GETUTCDATE(),
        @Creating_User_Id,
        GETUTCDATE()
    )

Select @@Identity;

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Credit_Card_Statement_Transactions_List'  ))
Begin
	Drop Proc [p_TLBoard_Get_Credit_Card_Statement_Transactions_List]
End

Go

Create Proc p_TLBoard_Get_Credit_Card_Statement_Transactions_List
@Bank_Account_Credit_Card_Statement_Id Int, 
@User_ID_Bank_Owner Int, 
@User_ID_Searching Int
As

Select      statementTransactions.* ,
            bankAccount.[User_Id] As Bank_Account_Owner_User_Id, 
            bankAccount.Bank_Name as Bank_Account_Name , 
		    createdBy.First_Name As Created_By_First_Name, 
            createdBy.Last_Name As Created_By_Last_Name , 
		    lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
            lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From        t_TLBoard_Bank_Accounts_Credit_Cards_Statements CCStatement
Join        t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions statementTransactions 
                On statementTransactions.Bank_Account_Credit_Card_Statement_Id = CCStatement.Bank_Account_Credit_Card_Statement_Id
Join        t_TLBoard_Credit_Cards creditCard On creditCard.Credit_Card_Id = CCStatement.Credit_Card_Id
Join        t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = CCStatement.Bank_Account_Id
Join	    t_TLBoard_Users createdBy On createdBy.[User_Id] = statementTransactions.Record_Created_By_User_Id
Left Join   t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = statementTransactions.Record_Last_Updated_By_User_Id
Where       CCStatement.Bank_Account_Credit_Card_Statement_Id = @Bank_Account_Credit_Card_Statement_Id And
            creditCard.Bank_Account_Id = bankAccount.Bank_Account_Id And
            bankAccount.[User_Id] = @User_ID_Bank_Owner And
            @User_ID_Searching = @User_ID_Bank_Owner And
            statementTransactions.Is_Deleted = 0

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Delete_Credit_Card_Statement_Transaction'  ))
Begin
	Drop Proc [p_TLBoard_Delete_Credit_Card_Statement_Transaction]
End

Go

Create Proc [p_TLBoard_Delete_Credit_Card_Statement_Transaction]
@Credit_Card_Statement_Transaction_Id BigInt,
@Deleting_User_Id Int
As

Update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
Set     Is_Deleted = 1, 
        Record_Deleted_By_User_Id = @Deleting_User_Id, 
        Record_Deleted_DateTime_UTC = GETUTCDATE(),
        Record_Last_Updated_By_User_Id = @Deleting_User_Id,
        Record_Last_Updated_DateTime_UTC = GETUTCDATE()
Where   Credit_Card_Statement_Transaction_Id = @Credit_Card_Statement_Transaction_Id And Is_Deleted = 0 

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id'  ))
Begin
	Drop Proc [p_TLBoard_Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id]
End

Go

Create Proc [p_TLBoard_Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id]
@Bank_Account_Credit_Card_Statement_Id Int,
@Deleting_User_Id Int
As

Update  t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions
Set     Is_Deleted = 1, 
        Record_Deleted_By_User_Id = @Deleting_User_Id, 
        Record_Deleted_DateTime_UTC = GETUTCDATE(),
        Record_Last_Updated_By_User_Id = @Deleting_User_Id,
        Record_Last_Updated_DateTime_UTC = GETUTCDATE()
Where   Bank_Account_Credit_Card_Statement_Id = @Bank_Account_Credit_Card_Statement_Id And Is_Deleted = 0 

Go

--Truncate table t_TLBoard_Bank_Accounts_Credit_Cards_Statements

--Select * From t_TLBoard_Bank_Accounts_Credit_Cards_Statements








