SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [p_TLBoard_Insert_Client_Details]
@User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt, @Default_Vat_Percentage Decimal(6,2),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Client_Type_Id smallint, @Client_Tax_Reference_Number NVarChar(50),  
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100), 
@Main_Contact_Phone_Number nvarchar(50),
@Client_From_Date DateTime , @Client_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Clients]
           ([User_Id] , [Company_Name] , [Website_URL], [Country_Id] , 
			[State_Id] , [City] , [Address] , [ZipCode] , 
            [Default_Currency_Id] , [Default_Vat_Percentage], 
            [Telephone] ,[Mobile_Phone] , 
            [Client_Type_Id], [Client_Tax_Reference_Number] , 
			[Main_Contact_FullName] , [Main_Contact_Email_Address] , [Main_Contact_Phone_Number],
			[Client_From_Date], [Client_To_Date], [First_Contract_Date],
			[First_Contract_Signed_With_Contact_Full_Name],  
			[First_Contract_Signed_In_Location_Description], 
			Is_Active, Record_Created_By_User_Id, Record_Creation_DateTime_UTC, 
			Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC
			)
     VALUES	(
			@User_Id, @Company_Name, 
			@Website_URL, @Country_Id , 
			@State_Id, @City , @Address, @ZipCode, 
            @Default_Currency_Id , @Default_Vat_Percentage, 
            @Telephone, @Mobile_Phone, 
			@Client_Type_Id, @Client_Tax_Reference_Number,
			@Main_Contact_FullName, @Main_Contact_Email_Address, 
			@Main_Contact_Phone_Number,
			@Client_From_Date, @Client_To_Date, @First_Contract_Date,
			@First_Contract_Signed_With_Contact_Full_Name, 
			@First_Contract_Signed_In_Location_Description,
			@Is_Active,
			@Creating_User_Id, GETUTCDATE(), 
			@Creating_User_Id, GETUTCDATE()
			);

Select @@IDENTITY;

GO
