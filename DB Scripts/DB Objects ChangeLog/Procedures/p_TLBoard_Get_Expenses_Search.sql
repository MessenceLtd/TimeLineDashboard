SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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


GO
