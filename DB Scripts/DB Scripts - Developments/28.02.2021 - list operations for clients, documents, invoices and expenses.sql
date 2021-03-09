use [DashboardTimeLine];

Go

ALTER Proc [dbo].[p_TLBoard_Get_Clients_Search]
@User_Id Int,
@Filter_By_Type SmallInt,
@Filter_By_Country SmallInt , 
@Filter_By_State SmallInt , 
@Filter_By_City_Or_Address_Or_ZipCode NVarChar(50) , 
@Filter_By_CompanyName_Or_Person_Fullname NVarChar(50)
As

Select	Client_Id,[User_Id], Company_Name, Website_URL, client.Country_Id, State_Id, City, 
		Mobile_Phone, Client_Type_Id, 
		Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number, 
		client.Is_Active , Is_Deleted, country.Country_English_Name As Country_Name
From	t_TLBoard_Clients client
Join	t_TLBoard_Countries country On country.Country_Id = client.Country_Id
Where	[User_Id] = @User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 ) And 
		(@Filter_By_Type Is Null Or Client_Type_Id = @Filter_By_Type ) And 
		(@Filter_By_Country Is Null Or client.Country_Id = @Filter_By_Country ) And 
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

ALTER Proc [dbo].[p_TLBoard_Get_Suppliers_Search]
@User_Id Int,
@Filter_By_Type SmallInt,
@Filter_By_Country SmallInt , 
@Filter_By_State SmallInt , 
@Filter_By_City_Or_Address_Or_ZipCode NVarChar(50) , 
@Filter_By_CompanyName_Or_Person_Fullname NVarChar(50)
As

Select	Supplier_Id,[User_Id], Company_Name, Website_URL, supplier.Country_Id, State_Id, City, 
		Mobile_Phone, Supplier_Type_Id, 
		Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number, 
		supplier.Is_Active , Is_Deleted
From	t_TLBoard_Suppliers supplier
Join	t_TLBoard_Countries country On country.Country_Id = supplier.Country_Id
Where	[User_Id] = @User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 ) And 
		(@Filter_By_Type Is Null Or Supplier_Type_Id = @Filter_By_Type ) And 
		(@Filter_By_Country Is Null Or supplier.Country_Id = @Filter_By_Country ) And 
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

-- select * From t_TLBoard_Clients where Company_Name like '%dum%'
-- select * From t_TLBoard_Suppliers where Company_Name like '%dum%'
-- List expenses, invoices, documents .. all procedures are unimplemented! 

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Expenses_Search'  ))
Begin
	Drop Proc [p_TLBoard_Get_Expenses_Search]
End

Go

CREATE Proc [dbo].[p_TLBoard_Get_Expenses_Search]
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

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Invoices_Search'  ))
Begin
	Drop Proc [p_TLBoard_Get_Invoices_Search]
End

Go

CREATE Proc [dbo].[p_TLBoard_Get_Invoices_Search]
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

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_General_Documents_Search'  ))
Begin
	Drop Proc [p_TLBoard_Get_General_Documents_Search]
End

Go

CREATE Proc [dbo].[p_TLBoard_Get_General_Documents_Search]
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

--Select * From t_TLBoard_Invoices
--Select * From t_TLBoard_General_Documents



