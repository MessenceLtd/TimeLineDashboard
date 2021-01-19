


--Update	DocumentsManager.dbo.t_DocMan_Countries 
--Set		t_DocMan_Countries.Continent_Id = DocManContinents.Continent_Id
--From DocumentsManager.dbo.t_DocMan_Countries  docManCountry
--Left Join [Wings-CTIX].dbo.Countries wingsCountriesByName On wingsCountriesByName.Name = docManCountry.Country_English_Name
--Left Join [Wings-CTIX].dbo.Countries wingsCountriesByCode On wingsCountriesByCode.ShortName = docManCountry.Country_Code
--Left Join [Wings-CTIX].dbo.Continents wingsContinent On wingsContinent.ContinentID = wingsCountriesByName.ContinentId
--Left Join DocumentsManager.dbo.t_DocMan_Continents DocManContinents On DocManContinents.Name = wingsContinent.Name
--Where docManCountry.Continent_Id is null and wingsCountriesByName.CountryId is not null 
-- 190 rows affected

--Select docManCountry.Country_English_Name , wingsCountriesByName.Name , wingsContinent.Name, wingsContinent.ContinentID, DocManContinents.Continent_Id , DocManContinents.Name
--From DocumentsManager.dbo.t_DocMan_Countries  docManCountry
--Left Join [Wings-CTIX].dbo.Countries wingsCountriesByName On wingsCountriesByName.Name = docManCountry.Country_English_Name
--Left Join [Wings-CTIX].dbo.Countries wingsCountriesByCode On wingsCountriesByCode.ShortName = docManCountry.Country_Code
--Left Join [Wings-CTIX].dbo.Continents wingsContinent On wingsContinent.ContinentID = wingsCountriesByName.ContinentId
--Left Join DocumentsManager.dbo.t_DocMan_Continents DocManContinents On DocManContinents.Name = wingsContinent.Name
--Where docManCountry.Continent_Id is null and wingsCountriesByName.CountryId is not null 


--Update	DocumentsManager.dbo.t_DocMan_Countries 
--Set		t_DocMan_Countries.Continent_Id = DocManContinents.Continent_Id
--From DocumentsManager.dbo.t_DocMan_Countries  docManCountry
--Left Join [Wings-CTIX].dbo.Countries wingsCountriesByCode On wingsCountriesByCode.ShortName = docManCountry.Country_Code
--Left Join [Wings-CTIX].dbo.Continents wingsContinent On wingsContinent.ContinentID = wingsCountriesByCode.ContinentId
--Left Join DocumentsManager.dbo.t_DocMan_Continents DocManContinents On DocManContinents.Name = wingsContinent.Name
--Where docManCountry.Continent_Id is null and wingsCountriesByCode.CountryId is not null 
-- 35 rows affected

--Select	* 
--From	DocumentsManager.dbo.t_DocMan_Countries docManCountry
--Where docManCountry.Continent_Id is null

-- select * from t_docman_continents 
/*
1	Africa
2	Antarctica
3	Asia
4	Australia
5	Europe
6	North America
7	South America
*/

--2	AX	Åland Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--5	AS	American Samoa	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--8	AI	Anguilla	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--13	AW	Aruba	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--25	BM	Bermuda	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--28	BQ	Bonaire, Sint Eustatius and Saba	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--31	BV	Bouvet Island	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--33	IO	British Indian Ocean Territory	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--42	KY	Cayman Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--47	CX	Christmas Island	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--48	CC	Cocos (Keeling) Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--73	FK	Falkland Islands (Malvinas)	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--74	FO	Faroe Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--80	TF	French Southern Territories	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--86	GI	Gibraltar	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--88	GL	Greenland	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--91	GU	Guam	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--93	GG	Guernsey	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--98	HM	Heard Island and McDonald Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--109	IM	Isle of Man	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--114	JE	Jersey	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--150	MS	Montserrat	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--164	NF	Norfolk Island	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--171	PS	Palestine, State of	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--180	PR	Puerto Rico	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--182	RE	Réunion	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--187	SH	Saint Helena, Ascension and Tristan da Cunha	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--202	SX	Sint Maarten (Dutch part)	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--208	GS	South Georgia and the South Sandwich Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL

--214	SJ	Svalbard and Jan Mayen	NULL	NULL	NULL	NULL	NULL	NULL	NULL

--222	TL	Timor-Leste	NULL	NULL	NULL	NULL	NULL	NULL	NULL

--230	TC	Turks and Caicos Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL

--235	GB	United Kingdom of Great Britain and Northern Ireland	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--236	UM	United States Minor Outlying Islands	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--243	VG	Virgin Islands (British)	NULL	NULL	NULL	NULL	NULL	NULL	NULL
--244	VI	Virgin Islands (U.S.)	NULL	NULL	NULL	NULL	NULL	NULL	NULL


--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 2 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 4  Where Country_Id = 5 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 8 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 7  Where Country_Id = 13 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 25 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 28 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 2  Where Country_Id = 31 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 42 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 3  Where Country_Id = 47 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 3  Where Country_Id = 48 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 7  Where Country_Id = 73 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 74 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 2  Where Country_Id = 80 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 86 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 88 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 4  Where Country_Id = 91 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 93 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 2  Where Country_Id = 98 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 109 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 114 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 7  Where Country_Id = 150 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 4  Where Country_Id = 164 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 3  Where Country_Id = 171 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 180 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 1  Where Country_Id = 182 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 1  Where Country_Id = 187 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 202 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 2  Where Country_Id = 208 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 214 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 3  Where Country_Id = 222 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 230 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 5  Where Country_Id = 235 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 236 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 243 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 6  Where Country_Id = 244 And Continent_Id Is null;
--Update t_DocMan_Countries Set Continent_Id = 3  Where Country_Id = 33 And Continent_Id Is null;


---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Insert_Supplier_Details'  ))
Begin

	Drop Proc p_DocMan_Insert_Supplier_Details

End

Go

Create Proc p_DocMan_Insert_Supplier_Details
@User_Id int, @Company_Name nvarchar(100),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40), 
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number nvarchar(20),
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100),
@Main_Contact_Phone_Number nvarchar(50), @Record_Created_By_User_Id int
As

INSERT INTO [dbo].[t_DocMan_Suppliers]
           ([User_Id] , [Company_Name], [Website_URL], 
		   [Country_Id], [State_Id], [City], [Address], [ZipCode]
           ,[Telephone]
           ,[Mobile_Phone]
           ,[Supplier_Type_Id]
           ,[Supplier_Tax_Reference_Number]
           ,[Main_Contact_FullName]
           ,[Main_Contact_Email_Address]
           ,[Main_Contact_Phone_Number]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           )
     VALUES
           (@User_Id , @Company_Name, @Website_URL, @Country_Id, @State_Id, @City,
            @Address, @ZipCode, @Telephone, 
			@Mobile_Phone, @Supplier_Type_Id, @Supplier_Tax_Reference_Number,
			@Main_Contact_FullName, @Main_Contact_Email_Address, 
			@Main_Contact_Phone_Number, 
			@Record_Created_By_User_Id, 
			GETUTCDATE(), 
			@Record_Created_By_User_Id,
			GETUTCDATE()
           )

Select @@IDENTITY;

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Update_Supplier_Details'  ))
Begin

	Drop Proc p_DocMan_Update_Supplier_Details

End

Go

Create Proc p_DocMan_Update_Supplier_Details
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

UPDATE	[dbo].[t_DocMan_Suppliers]
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


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Update_Supplier_Details_Is_Active'  ))
Begin

	Drop Proc p_DocMan_Update_Supplier_Details_Is_Active

End

Go

Create Proc p_DocMan_Update_Supplier_Details_Is_Active
@Supplier_Id Int, 
@Is_Active Bit, 
@Active_Last_Updated_Comments NVarChar(500), 
@Record_Updated_By_User_Id int
As

UPDATE	[dbo].[t_DocMan_Suppliers]
SET		[Is_Active] = @Is_Active, 
		[Active_Last_Updated_Comments] = @Active_Last_Updated_Comments,
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()
WHERE Supplier_Id = @Supplier_Id And [User_Id] = @Record_Updated_By_User_Id

GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Delete_Supplier'  ))
Begin

	Drop Proc p_DocMan_Delete_Supplier

End

Go

Create Proc p_DocMan_Delete_Supplier
@Supplier_Id Int, 
@Record_Deleted_By_User_Id int
As

UPDATE	[dbo].[t_DocMan_Suppliers]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Deleted_DateTime_UTC = GETUTCDATE()
WHERE	Supplier_Id = @Supplier_Id And [User_Id] = @Record_Deleted_By_User_Id And (Is_Deleted Is null Or Is_Deleted = 0)

GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Delete_Supplier_Administrative'  ))
Begin

	Drop Proc p_DocMan_Delete_Supplier_Administrative

End

Go

Create Proc p_DocMan_Delete_Supplier_Administrative
@Supplier_Id Int, 
@Record_Deleted_By_User_Id int
As

UPDATE	[dbo].[t_DocMan_Suppliers]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Deleted_DateTime_UTC = GETUTCDATE()
WHERE	Supplier_Id = @Supplier_Id And (Is_Deleted Is null Or Is_Deleted = 0)

GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Insert_Credit_Card_Transactions_To_Invoices_Expenses'  ))
Begin

	Drop Proc p_DocMan_Insert_Credit_Card_Transactions_To_Invoices_Expenses

End

Go

Create Proc p_DocMan_Insert_Credit_Card_Transactions_To_Invoices_Expenses
@Credit_Card_Statement_Transaction_Id bigint,
@Is_Supplier_Expense bit, @Expense_Record_Id int,
@Is_Invoice_Income bit, @Invoice_Record_Id int,
@Record_Created_By_User_Id int 
As


INSERT INTO [dbo].[t_DocMan_Credit_Card_Transactions_To_Invoices_Expenses]
           ([Credit_Card_Statement_Transaction_Id]
           ,[Is_Supplier_Expense]
           ,[Expense_Record_Id]
           ,[Is_Invoice_Income]
           ,[Invoice_Record_Id]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC])
     VALUES
           (
			@Credit_Card_Statement_Transaction_Id, 
			@Is_Supplier_Expense,
			@Expense_Record_Id,
			@Is_Invoice_Income, 
			@Invoice_Record_Id,
	        @Record_Created_By_User_Id, 
			GETUTCDATE(),
			@Record_Created_By_User_Id, 
		   GETUTCDATE()
		   )

Select @@IDENTITY;

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Update_Credit_Card_Transactions_To_Invoices_Expenses'  ))
Begin

	Drop Proc p_DocMan_Update_Credit_Card_Transactions_To_Invoices_Expenses

End

Go

Create Proc p_DocMan_Update_Credit_Card_Transactions_To_Invoices_Expenses
@Credit_Card_Tranasction_Connection_Record_Id Int, 
@Credit_Card_Statement_Transaction_Id bigint,
@Is_Supplier_Expense bit, @Expense_Record_Id int,
@Is_Invoice_Income bit, @Invoice_Record_Id int, 
@Is_Visible Bit, 
@Record_Updated_By_User_Id int 
As

UPDATE	[dbo].[t_DocMan_Credit_Card_Transactions_To_Invoices_Expenses]
SET		[Credit_Card_Statement_Transaction_Id] = @Credit_Card_Statement_Transaction_Id,
		[Is_Supplier_Expense] = @Is_Supplier_Expense, 
		[Expense_Record_Id] = @Expense_Record_Id,
		[Is_Invoice_Income] = @Is_Invoice_Income,
		[Invoice_Record_Id] = @Invoice_Record_Id,
		Is_Visible = @Is_Visible, 
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GETUTCDATE()
WHERE	Credit_Card_Tranasction_Connection_Record_Id = @Credit_Card_Tranasction_Connection_Record_Id


GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_DocMan_Delete_Credit_Card_Transactions_To_Invoices_Expenses'  ))
Begin

	Drop Proc p_DocMan_Delete_Credit_Card_Transactions_To_Invoices_Expenses

End

Go

Create Proc p_DocMan_Delete_Credit_Card_Transactions_To_Invoices_Expenses
@Credit_Card_Tranasction_Connection_Record_Id Int, 
@Record_Deleted_By_User_Id int 
As

UPDATE	[dbo].[t_DocMan_Credit_Card_Transactions_To_Invoices_Expenses]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Delete_DateTime_UTC = GETUTCDATE()
WHERE	Credit_Card_Tranasction_Connection_Record_Id = @Credit_Card_Tranasction_Connection_Record_Id And
		(Is_Deleted Is Null Or Is_Deleted = 0 )


GO







