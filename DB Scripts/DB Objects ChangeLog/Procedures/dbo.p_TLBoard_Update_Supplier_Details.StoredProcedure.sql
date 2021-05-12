SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Update_Supplier_Details]
@Supplier_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt , @Default_Vat_Percentage Decimal(6,2),
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
        [Default_Vat_Percentage] = @Default_Vat_Percentage ,
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

GO
