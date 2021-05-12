SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Invoice_Details]
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

GO
