﻿Use [DashboardTimeLine];
Go

--Select * From t_TLBoard_Users
--select * from t_TLBoard_Currencies
--select * from t_TLBoard_Expenses
-- New fields for expense invoice
--Invoiced_Client_To_Country_Id
--Invoiced_Client_To_State_Id
--Invoiced_Client_To_City
--Invoiced_Client_To_Zip
--Invoiced_Client_To_EmailAddress

ALTER Proc [dbo].[p_TLBoard_Insert_Expense_Details]
@User_Id int, @Supplier_Id Int, @Expense_Invoice_DateTime DateTime,
@Currency_Id TinyInt, @Total_Amount Decimal(18,3), @Vat_Percentage Decimal(6,2),
@Total_Without_Vat Decimal(18,3), @Total_Vat Decimal(18,3), @Invoiced_Client_On_User_Location_Id int,
@Invoiced_Client_To_CompanyName NVarChar(150), @Invoiced_Client_To_PersonName NVarchar(100),
@Invoiced_Client_To_PhoneNumber NVarChar(50), 
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
				@Invoiced_Client_To_CompanyName, @Invoiced_Client_To_PersonName,
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

-- Should begin testing inserting expenses.. 
/*
@Invoiced_Client_To_Address
Invoice_Content_Long_Description
Is_Visible_To_Followers_Users
Invoice_Supplier_Country_Id (spRecord_Created_By_User_Id)
Select * From t_TLBoard_Expenses -- Successfull insert  1	1	1	2019-07-23 15:26:08.000
Column 'Invoiced_To_Address' does not belong to table Table.
Column 'Invoice_Type_Id' does not belong to table Table.
Column 'Invoice_Supplier_State_Id' does not belong to table Table.

replaced 'Invoice_Supplier_StateId' with Invoice_Supplier_State_Id (+ updated the table)
Specified cast is not valid. error ..   On  Expense_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Record_Last_Updated_By_User_Id"];
23:12 -- inserted successfully !! 

*/



