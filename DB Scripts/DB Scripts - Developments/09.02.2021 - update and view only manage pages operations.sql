Use [DashboardTimeLine];
Go 

/**** Todos i'm still working on 
DONE -- 1) Need more work on permissions / permission types (need to create a regular user for testings)
DONE -- 2) Need to implement add invoice page (should work similar to add expense)
DONE -- 3) Implement add document page
4) Start to implement update pages (For 3 user permissions types -- Administrator(me) Company employee, User) / view details pages (User/Client/Supplier/Expense/Invoice/Document)
5) Implement Application pages: Captcha / exceptions / login tries / Successful login sessions, Currenctly authenticated users/sessions (+ future ability to cancel session)
6) Bank accounts entries 
7) Credit card statements / payments 
8) After all is working, Viewable and updatable  -- Add ability to connect to the entities above (Expenses, Invoices, Documents, Credit card statements ect.. )
*** Credit card statements should also be linkable to expenses/invoices and other documents/ general information and/or future features (like contracts and more information)
*/


--select * from t_TLBoard_Clients

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Client_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Client_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Update_Client_Details]
@Client_Id int, @Company_Name nvarchar(150),
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
@Is_Active Bit, @Updating_User_Id Int
As

Update	[dbo].[t_TLBoard_Clients]
Set		[Company_Name] = @Company_Name , 
		[Website_URL] = @Website_URL , 
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
Where	Client_Id = @Client_Id And Is_Deleted = 0

Go


ALTER Proc [dbo].[p_TLBoard_Get_Client_Details]
@Client_Id Int, 
@User_Id Int
As

Select	client.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Clients client
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = client.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = client.Record_Last_Updated_By_User_Id
Where	client.[Client_Id] = @Client_Id And client.[User_Id] = @User_Id 
		And ( client.Is_Deleted Is Null Or client.Is_Deleted = 0 )  

Go


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_Supplier_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_Supplier_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Update_Supplier_Details]
@Supplier_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt ,
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number NVarChar(50),  
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100), 
@Main_Contact_Phone_Number nvarchar(50),
@Supplier_From_Date DateTime , @Supplier_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Updating_User_Id Int
As

Update	[dbo].[t_TLBoard_Suppliers]
Set		[Company_Name] = @Company_Name , 
		[Website_URL] = @Website_URL , 
		[Country_Id] = @Country_Id , 
		[State_Id] = @State_Id , 
		[City] = @City , 
		[Address] = @Address , 
		[ZipCode] = @ZipCode , 
		[Default_Currency_Id] = @Default_Currency_Id ,
		[Telephone] = @Telephone ,
		[Mobile_Phone] = @Mobile_Phone , 
		[Supplier_Type_Id] = @Supplier_Type_Id, 
		[Supplier_Tax_Reference_Number] = @Supplier_Tax_Reference_Number, 
		[Main_Contact_FullName] = @Main_Contact_FullName, 
		[Main_Contact_Email_Address] = @Main_Contact_Email_Address , 
		[Main_Contact_Phone_Number] = @Main_Contact_Phone_Number,
		[Supplier_From_Date] = @Supplier_From_Date, 
		[Supplier_To_Date] = @Supplier_To_Date, 
		[First_Contract_Date] = @First_Contract_Date,
		[First_Contract_Signed_With_Contact_Full_Name] = @First_Contract_Signed_With_Contact_Full_Name ,  
		[First_Contract_Signed_In_Location_Description] = @First_Contract_Signed_In_Location_Description,
		Is_Active = @Is_Active, 
		Record_Last_Updated_By_User_Id = @Updating_User_Id , 
		Record_Last_Updated_DateTime_UTC = GETUTCDATE() 
Where	Supplier_Id = @Supplier_Id And Is_Deleted = 0

Go

ALTER Proc [dbo].[p_TLBoard_Get_Supplier_Details]
@Supplier_Id Int, 
@User_Id_Searching_For_Supplier_Details Int
As

Select	supplier.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Suppliers supplier
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = supplier.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = supplier.Record_Last_Updated_By_User_Id
Where	supplier.[Supplier_Id] = @Supplier_Id
		And ( supplier.Is_Deleted Is Null Or supplier.Is_Deleted = 0 )  

Go

--select * from t_TLBoard_Suppliers