SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Suppliers_Search]
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

GO
