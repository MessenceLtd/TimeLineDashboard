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