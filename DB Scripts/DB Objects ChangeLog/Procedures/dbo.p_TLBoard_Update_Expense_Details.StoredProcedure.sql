﻿SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Update_Expense_Details]
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

GO
