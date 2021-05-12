SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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


GO
