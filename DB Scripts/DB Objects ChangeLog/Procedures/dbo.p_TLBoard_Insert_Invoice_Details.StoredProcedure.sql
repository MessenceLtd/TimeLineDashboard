SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [p_TLBoard_Insert_Invoice_Details]
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
@Is_Available_For_Download_For_Followers_Users bit, 
@Record_Created_By_User_Id int, @Is_Active bit
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
				@Is_Available_For_Download_For_Followers_Users, 
                @Record_Created_By_User_Id,
				GETUTCDATE(), 
                @Record_Created_By_User_Id,
				GETUTCDATE() , @Is_Active )

Select @@IDENTITY;

GO
