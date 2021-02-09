Use [DashboardTimeLine];
Go 

/**** 1) Need more work on permissions / permission types (need to create a regular user for testings)
2) Need to implement add invoice page (should work similar to add expense)
3) Implement add document page
4) Start to implement update pages (For 3 user permissions types -- Administrator(me) Company employee, User) / view details pages (User/Client/Supplier/Expense/Invoice/Document)
5) Implement Application pages: Captcha / exceptions / login tries / Successful login sessions, Currenctly authenticated users/sessions (+ future ability to cancel session)
6) Bank accounts entries 
7) Credit card statements / payments 
8) After all is working, Viewable and updatable  -- Add ability to connect to the entities above (Expenses, Invoices, Documents, Credit card statements ect.. )
*** Credit card statements should also be linkable to expenses/invoices and other documents/ general information and/or future features (like contracts and more information)
*/

-----------------------------
-----------------------------
------ I must create a powershell command to quickly script DB Objects create script in proper folders
------ 1) The problem is that the files going out as dbo. and ends with .Table.sql  (the dbo. starting is kinda annoying) 
------ 2) Each script (table schema for example) Starts with the "SET ANSI_NULLS ON GO SET QUOTED_IDENTIFIER ON GO" that probably can only be excluded from custom powershell command.
------ 3) Need to script each object to different folders and (DB Tables to Tables\  StoredProcedures to Procedures\)

-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
-- Resuming working on the add invoice pages and other bullet points i've logged.. I'll resolve those issues later on this month


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Clients_All_By_User_Id'  ))
Begin
	Drop Proc [p_TLBoard_Get_Clients_All_By_User_Id]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Clients_All_By_User_Id]
@User_Id_To_Return_Clients Int, 
@Authenticated_User_ID Int
As

Select	Client_Id,[User_Id], Company_Name, Website_URL, Country_Id, State_Id, City, 
		Mobile_Phone, Client_Type_Id, 
		Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number, 
		Is_Active , Is_Deleted
From	t_TLBoard_Clients 
Where	[User_Id] = @User_Id_To_Return_Clients And Is_Deleted = 0 And Is_Active = 1

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
@Is_Available_For_Download_For_Followers_Users bit, @Record_Created_By_User_Id int,
@Record_Creation_DateTime_UTC datetime, @Record_Last_Updated_By_User_Id int,
@Record_Last_Updated_DateTime_UTC datetime,
@Is_Active bit
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
				@Is_Available_For_Download_For_Followers_Users, @Record_Created_By_User_Id,
				@Record_Creation_DateTime_UTC, @Record_Last_Updated_By_User_Id,
				@Record_Last_Updated_DateTime_UTC , @Is_Active )

Select @@IDENTITY;

GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Invoice_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_Invoice_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Invoice_Details]
@Invoice_Record_Id Int, 
@User_Id_Invoice_Owner Int, 
@User_Id_Searching_For_Invoice_Details Int
As 

Select	invoice.*
From	t_TLBoard_Invoices invoice
Where	invoice.[Invoice_Record_Id] = @Invoice_Record_Id And invoice.Is_Deleted = 0 
		And invoice.[User_Id] = @User_Id_Invoice_Owner

Go

-- 3) Implement add document page

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_General_Document_Details'  ))
Begin
	Drop Proc [p_TLBoard_Insert_General_Document_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Insert_General_Document_Details]
@User_Id int, @General_Document_Type SmallInt, @Title nvarchar(200),
@Description nvarchar(1500), @Document_Creation_DateTime datetime,
@Sent_By_Entity_Name nvarchar(100), @Sent_By_Entity_Country_Id smallint,
@Sent_By_Entity_State_Id smallint, @Sent_By_Entity_City nvarchar(100),
@Sent_By_Entity_Address nvarchar(150), @Sent_By_Entity_ZipCode nvarchar(20),
@Sent_By_Entity_DateTime datetime, @Sent_By_Entity_Email_Address nvarchar(100),
@Sent_To_Entity_Name nvarchar(100), @Sent_To_Entity_Country_Id smallint,
@Sent_To_Entity_State_Id smallint, @Sent_To_Entity_City nvarchar(100),
@Sent_To_Entity_Address nvarchar(150), @Sent_To_Entity_ZipCode nvarchar(20),
@Sent_To_Entity_Email_Address nvarchar(150), @Recieved_Document_DateTime datetime,
@Recieved_In_Country_Id smallint, @Recieved_In_State_Id smallint,
@Recieved_In_City nvarchar(100), @Recieved_In_Address nvarchar(150),
@Recieved_In_ZipCode nvarchar(20), @Recieved_In_Email_Address nvarchar(100),
@User_Comments nvarchar(500), @Recieved_By_User_Id int, @Recieved_DateTime datetime,
@Original_File_Name nvarchar(255), @Azure_Block_Blob_Reference nvarchar(255),
@Is_Visible_To_Anonymous_Users bit, @Is_Available_For_Download_For_Anonymous_Users bit,
@Is_Visible_To_Followers_Users bit, @Is_Available_For_Download_For_Followers_Users bit,
@Record_Created_By_User_Id int, @Record_Creation_DateTime_UTC datetime,
@Record_Last_Updated_By_User_Id int, @Record_Last_Updated_DateTime_UTC datetime,
@Is_Active bit
As

INSERT INTO [dbo].[t_TLBoard_General_Documents]
				([User_Id]
				,[General_Document_Type]
				,[Title]
				,[Description]
				,[Document_Creation_DateTime]
				,[Sent_By_Entity_Name]
				,[Sent_By_Entity_Country_Id]
				,[Sent_By_Entity_State_Id]
				,[Sent_By_Entity_City]
				,[Sent_By_Entity_Address]
				,[Sent_By_Entity_ZipCode]
				,[Sent_By_Entity_DateTime]
				,[Sent_By_Entity_Email_Address]
				,[Sent_To_Entity_Name]
				,[Sent_To_Entity_Country_Id]
				,[Sent_To_Entity_State_Id]
				,[Sent_To_Entity_City]
				,[Sent_To_Entity_Address]
				,[Sent_To_Entity_ZipCode]
				,[Sent_To_Entity_Email_Address]
				,[Recieved_Document_DateTime]
				,[Recieved_In_Country_Id]
				,[Recieved_In_State_Id]
				,[Recieved_In_City]
				,[Recieved_In_Address]
				,[Recieved_In_ZipCode]
				,[Recieved_In_Email_Address]
				,[User_Comments]
				,[Recieved_By_User_Id]
				,[Recieved_DateTime]
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
				,[Is_Active] )
     VALUES  (	@User_Id , @General_Document_Type , @Title ,
				@Description, @Document_Creation_DateTime ,
				@Sent_By_Entity_Name, @Sent_By_Entity_Country_Id,
				@Sent_By_Entity_State_Id, @Sent_By_Entity_City,
				@Sent_By_Entity_Address, @Sent_By_Entity_ZipCode,
				@Sent_By_Entity_DateTime, @Sent_By_Entity_Email_Address,
				@Sent_To_Entity_Name, @Sent_To_Entity_Country_Id,
				@Sent_To_Entity_State_Id, @Sent_To_Entity_City,
				@Sent_To_Entity_Address, @Sent_To_Entity_ZipCode,
				@Sent_To_Entity_Email_Address, 
				@Recieved_Document_DateTime,
				@Recieved_In_Country_Id, @Recieved_In_State_Id,
				@Recieved_In_City, @Recieved_In_Address,
				@Recieved_In_ZipCode, @Recieved_In_Email_Address,
				@User_Comments, @Recieved_By_User_Id , @Recieved_DateTime ,
				@Original_File_Name, @Azure_Block_Blob_Reference,
				@Is_Visible_To_Anonymous_Users, @Is_Available_For_Download_For_Anonymous_Users,
				@Is_Visible_To_Followers_Users, @Is_Available_For_Download_For_Followers_Users,
				@Record_Created_By_User_Id, @Record_Creation_DateTime_UTC,
				@Record_Last_Updated_By_User_Id, @Record_Last_Updated_DateTime_UTC,
				@Is_Active)

Select @@IDENTITY;

GO

-- ToDo.. Implement document types, Test the actual document insert process (dummy + manual data)
-- need to change/ think about the field "Recieved_By_User_Id" -- it should be free text as well (so maybe extra field / else option in case there are no options)

if (Not exists (select * from t_TLBoard_General_Document_Types where General_Document_Type_Id = 1))
Begin

	INSERT INTO [dbo].[t_TLBoard_General_Document_Types]
           ([Document_Type_Name]
           ,[Sort_Order]
           ,[Suggested_By_User_Id]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           ,[Is_Active]
           ,[Is_Visible])
     VALUES
           (
		   'General', 
           1
           ,1
           ,1
           ,GETUTCDATE()
           ,1
           ,GETUTCDATE()
           ,1
           ,1)

End

Go

--Select * 
--From t_TLBoard_General_Document_Types
-- Could not find stored procedure 'p_TLBoard_Get_General_Document_Details'.


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_General_Document_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_General_Document_Details]
End

Go

CREATE Proc [dbo].[p_TLBoard_Get_General_Document_Details]
@General_Document_Id Int, 
@User_Id_Document_Owner Int, 
@User_Id_Searching_For_Document_Details Int
As 

Select	documents.*
From	t_TLBoard_General_Documents documents
Where	documents.[General_Document_Id] = @General_Document_Id And 
		documents.[User_Id] = @User_Id_Document_Owner  And ( documents.Is_Deleted = 0 ) 

Go

--select * from t_TLBoard_General_Documents
--truncate table t_TLBoard_General_Documents

-- need to implement private General_Documents Create_General_Document_Details_From_Data_Row(DataRow dbRowDetailsForUserInitialization)
-- besides a small error on Sent_To_Entity_Email_Address (Sent_To_Entity_Email_Adress)  all went smooth.. 





