SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Supplier_Details]
@Supplier_Id Int, @User_Id int, @Company_Name nvarchar(100),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40), 
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number nvarchar(20),
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100),
@Main_Contact_Phone_Number nvarchar(50), 
@Record_Updated_By_User_Id int

As

UPDATE	[dbo].[t_TLBoard_Suppliers]
SET		[Company_Name] = @Company_Name,
		[Website_URL] = @Website_URL,
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City, 
		[Address] = @Address,
		[ZipCode] = @ZipCode,
		[Telephone] = @Telephone,
		[Mobile_Phone] = @Mobile_Phone, 
		[Supplier_Type_Id] = @Supplier_Type_Id, 
		[Supplier_Tax_Reference_Number] = @Supplier_Tax_Reference_Number,
		[Main_Contact_FullName] = @Main_Contact_FullName, 
		[Main_Contact_Email_Address] = @Main_Contact_Email_Address,
		[Main_Contact_Phone_Number] = @Main_Contact_Phone_Number,
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()
WHERE Supplier_Id = @Supplier_Id And [User_Id] = @Record_Updated_By_User_Id

GO
