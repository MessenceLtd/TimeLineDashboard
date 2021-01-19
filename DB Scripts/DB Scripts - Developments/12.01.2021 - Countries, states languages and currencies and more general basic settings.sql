Use [DocumentsManager];

--Select * 
--From t_DocMan_Countries
--order by Country_English_Name


--Select * from Table_1

--select *  From t_DocMan_Countries

--Select distinct CountryCode from Table_1
--truncate table t_DocMan_Countries
--Insert Into t_DocMan_Countries (Country_Code , Country_English_Name)
--Select * from Table_1 Order By CountryName

--Select * From t_DocMan_Countries
--truncate table t_DocMan_States

--Select * From t_DocMan_States where state_name like '%canad%'

--Update t_DocMan_States Set Country_Id = 38 where state_name like '%canad%'

--Select * From t_DocMan_Countries where Country_English_Name like '%united%'

--Update t_DocMan_States Set Country_Id =  233 Where Country_Id Is Null 

--Select * from t_DocMan_States where Country_Id =  233 

--Delete From t_DocMan_States where state_id in (32,33,34) 

-- taken from https://www.courts.wa.gov/jislink/public/codes/Shared/states.htm#US_and_Canadian_State_Codes

--Select * From t_DocMan_Countries where Country_English_Name like '%aust%'
-- 13	AU	Australia	NULL	NULL

--Insert Into t_DocMan_States values (78 , 'NSW', 'New South Wales', 13 );

--Insert Into t_DocMan_States values (79 , 'QLD', 'Queensland', 13 );

--Insert Into t_DocMan_States values (80 , 'SA', 'South Australia', 13 );

--Insert Into t_DocMan_States values (81 , 'TAS', 'Tasmania', 13 );

--Insert Into t_DocMan_States values (82 , 'VIC', 'Victoria', 13 );

--Insert Into t_DocMan_States values (83 , 'WA', 'Western Australia', 13 );

--Insert Into t_DocMan_States values (84 , 'ACT', 'Australian Capital Territory', 13 );

--Insert Into t_DocMan_States values (85 , 'NT', 'Northern Territory', 13 );

--Update t_DocMan_States set country_id = 14 where country_id = 13
--Select * From t_DocMan_Countries where Country_English_Name like '%unit%'

--Update t_DocMan_States set country_id = 237 where country_id = 233
--Update t_DocMan_States 

--Select * From t_DocMan_Countries where Country_English_Name like '%cana%'

--Update t_DocMan_States set country_id = 41 where country_id not in (237, 14)


Go


If (Not Exists ( Select Id From sysobjects where xtype = 'U' and [name] = 't_DocMan_Countries_Banned' ))
Begin
	Create TABLE [dbo].[t_DocMan_Countries_Banned](
		[Country_Id] [smallint] NOT NULL,
		[Name] [varchar](50) NULL,
		[BanReason] [varchar](500) NULL,
		[BanDate] [datetime] NULL,
	 CONSTRAINT [PK_Countries_Banned] PRIMARY KEY CLUSTERED 
	(
		[Country_Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]

End 

GO

--Select * from t_DocMan_Countries where Country_English_Name like  '%Yemen%'
--Libya	Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017
-- 136	LY	Libya
--Select * from t_DocMan_Countries where Country_English_Name like  '%Libya%'
--128	LY	Libya
--Somalia	Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017
--206	SO	Somalia
--Select * from t_DocMan_Countries where Country_English_Name like  '%Somalia%'

--Sudan	Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017
-- 196	SD	Sudan
--Select * from t_DocMan_Countries where Country_English_Name like  '%Sudan%'
--209 , 212

--Iran	Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017

--Select * from t_DocMan_Countries where Country_English_Name like  '%Iran%'

-- 108	IR	Iran (Islamic Republic of)
--106	IR	Iran (Islamic Republic of)
--Iraq	Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017
-- 107	IQ	Iraq

--Select * from t_DocMan_Countries where Country_English_Name like  '%Iraq%'
--107	IQ

--Lebanon	Vadim suggested and gal approved on 24.12.18 :)
--Select * from t_DocMan_Countries where Country_English_Name like  '%Lebanon%'
-- 125	LB	Lebanon

--Syria	Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017
-- 212	SY	Syrian Arab Republic
--Select * from t_DocMan_Countries where Country_English_Name like  '%Syrian%'
--217	SY	Syrian Arab Republic
--Yemen	Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017
-- 245	YE	Yemen
--Select * from t_DocMan_Countries where Country_English_Name like  '%Yemen%'
--247	YE	Yemen
-- delete from [t_DocMan_Countries_Banned]

Declare @Total_Banned_Countries Int = ( Select Count(*) From [t_DocMan_Countries_Banned])
If (@Total_Banned_Countries < 9)
Begin
	
	Insert Into [t_DocMan_Countries_Banned] 
	Values (128, 'Libya', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');
	
	Insert Into [t_DocMan_Countries_Banned] 
	Values (206, 'Somalia', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

	Insert Into [t_DocMan_Countries_Banned] 
	Values (209, 'South Sudan', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

	Insert Into [t_DocMan_Countries_Banned] 
	Values (212, 'Sudan', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

	Insert Into [t_DocMan_Countries_Banned] 
	Values (106, 'Iran', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

	Insert Into [t_DocMan_Countries_Banned] 
	Values (107, 'Iraq', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

	Insert Into [t_DocMan_Countries_Banned] 
	Values (125, 'Lebanon', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

	Insert Into [t_DocMan_Countries_Banned] 
	Values (217, 'Syria', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

	Insert Into [t_DocMan_Countries_Banned] 
	Values (247, 'Yemen', 'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', '2017-01-27 00:00:00.000');

End

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Get_Counties_List'  ))
Begin
	Drop Proc s_DocMan_Get_Counties_List
End

Go

Create Proc s_DocMan_Get_Counties_List
As

Select	Country_Id, Country_Code, Country_English_Name
From	t_DocMan_Countries
Where	Country_Id Not In ( Select Country_Id From t_DocMan_Countries_Banned ) And Is_Active = 1

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Update_Country_Details_Administrative'  ))
Begin

	Drop Proc s_DocMan_Update_Country_Details_Administrative

End

Go

Create Proc s_DocMan_Update_Country_Details_Administrative
@Country_Id SmallInt , @Country_Code VarChar(10), @Country_English_Name NVarChar(80) , 
@Country_Native_Name NVarChar(80), @Continent_Id TinyInt, @Is_Active Bit , @Updating_User_Id Int
As

UPDATE	[dbo].[t_DocMan_Countries]
   SET	[Country_Code] = @Country_Code						, 
		[Country_English_Name] = @Country_English_Name		,
		[Country_Native_Name] = @Country_Native_Name		,
		[Continent_Id] = @Continent_Id						,
		[Is_Active] = @Is_Active							,
		Record_Last_Updated_By_User_Id = @Updating_User_Id	,
		Record_Last_Updated_DateTime_UTC = GetUTCDate()
WHERE	Country_Id = @Country_Id

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Update_Country_Details'  ))
Begin

	Drop Proc s_DocMan_Update_Country_Details

End

Go

Create Proc s_DocMan_Update_Country_Details
@Country_Id SmallInt , @Country_Code VarChar(10), @Country_English_Name NVarChar(80) , 
@Country_Native_Name NVarChar(80), @Continent_Id TinyInt, @Updating_User_Id Int
As

UPDATE	[dbo].[t_DocMan_Countries]
SET		[Country_Code] = @Country_Code						, 
		[Country_English_Name] = @Country_English_Name		,
		[Country_Native_Name] = @Country_Native_Name		,
		[Continent_Id] = @Continent_Id						,
		Record_Last_Updated_By_User_Id = @Updating_User_Id	,
		Record_Last_Updated_DateTime_UTC = GetUTCDate()
WHERE	Country_Id = @Country_Id

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Get_Currencies_List'  ))
Begin

	Drop Proc s_DocMan_Get_Currencies_List

End

Go

Create Proc s_DocMan_Get_Currencies_List
As

Select	* 
From	[dbo].[t_DocMan_Currencies]

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Insert_Invoice_Details'  ))
Begin

	Drop Proc s_DocMan_Insert_Invoice_Details

End

Go

Create Proc s_DocMan_Insert_Invoice_Details
@User_Id int								, 
@Client_Id Int								, 
@Currency_Id int							,
@Total_Without_Vat decimal(18,3)			,
@Total_Vat decimal(18,3)					,
@Vat_Percentage decimal(6,2)				,
@Total_Amount decimal(18,3)					,
@Creation_DateTime datetime					,
@Creation_DateTime_UTC datetime				,
@Invoiced_On_User_Location_Id int			,
@Invoiced_To_CompanyName nvarchar(150)		,
@Invoiced_To_PhoneNumber nvarchar(50)		,
@Invoiced_To_Address nvarchar(50)			,
@Invoice_Number int							,
@Invoice_Reference_Number nvarchar(50)		,
@Invoice_Type_Id tinyint					,
@User_Description nvarchar(500)				,
@User_Comments nvarchar(500)				,	 
@Original_File_Name nvarchar(255)			,
@Azure_Block_Blob_Reference nvarchar(255)	,
@Creating_User_Id int
As

INSERT INTO [dbo].[t_DocMan_Invoices] (
			[User_Id]							,
			[Client_Id]							,.
			[Currency_Id]						,
			[Total_Without_Vat]					,
			[Total_Vat]							,
			[Vat_Percentage]					,
			[Total_Amount]						,
			[Creation_DateTime]					,
			[Creation_DateTime_UTC]				,
			[Invoiced_On_User_Location_Id]		,
			[Invoiced_To_CompanyName]			,
			[Invoiced_To_PhoneNumber]			,
			[Invoiced_To_Address]				,
			[Invoice_Number]					,
			[Invoice_Reference_Number]			,
			[Invoice_Type_Id]					,
			[Record_Created_By_User_Id]			,
			[Record_Creation_DateTime_UTC]		,
			[Record_Last_Updated_By_User_Id]	,
			[Record_Last_Updated_DateTime_UTC]	,
			[User_Description]					,
			[User_Comments]						,
			[Original_File_Name]				,
			[Azure_Block_Blob_Reference] )
VALUES (	@User_Id							,
			@Client_Id							,
			@Currency_Id						,	 
			@Total_Without_Vat					,	 
			@Total_Vat 							,
			@Vat_Percentage 					,
			@Total_Amount						,
			@Creation_DateTime 					,
			@Creation_DateTime_UTC				,
			@Invoiced_On_User_Location_Id		,
			@Invoiced_To_CompanyName			,
			@Invoiced_To_PhoneNumber			,
			@Invoiced_To_Address				,
			@Invoice_Number						,
			@Invoice_Reference_Number			,
			@Invoice_Type_Id					,	
			@Creating_User_Id					, 
			GetUTCDate()						,
			@Creating_User_Id					,
			GetUTCDate()						,
			@User_Description 					,
			@User_Comments						,
			@Original_File_Name					,
			@Azure_Block_Blob_Reference			)

Select @@Identity;

GO


If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Update_Invoice_Details_File_Change'  ))
Begin

	Drop Proc s_DocMan_Update_Invoice_Details_File_Change

End

Go

Create Proc s_DocMan_Update_Invoice_Details_File_Change
@Invoice_Record_Id Int						,
@User_Description nvarchar(500)				,
@User_Comments nvarchar(500)				,	 
@Original_File_Name nvarchar(255)			,
@Azure_Block_Blob_Reference nvarchar(255)	,
@Updating_User_Id int
As

UPDATE	[dbo].[t_DocMan_Invoices] 
SET		[User_Id] = @Updating_User_Id									,
		[User_Description] = @User_Description							,
		[User_Comments] = @User_Comments								,
		[Original_File_Name] = @User_Comments							,
		[Azure_Block_Blob_Reference] = @Azure_Block_Blob_Reference		,
		[Record_Last_Updated_By_User_Id] = @Updating_User_Id			,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()				
WHERE	[Invoice_Record_Id] = @Invoice_Record_Id

GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 's_DocMan_Delete_Invoice_Details'  ))
Begin

	Drop Proc s_DocMan_Delete_Invoice_Details

End

Go

Create Proc s_DocMan_Delete_Invoice_Details
@Invoice_Record_Id	Int	,
@Deleting_User_Id	Int	
As

UPDATE	[dbo].[t_DocMan_Invoices] 
SET		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()		,
		Is_Deleted = 1											, 
		Record_Deleted_By_User_Id = @Deleting_User_Id			,
		Record_Delete_DateTime_UTC = GetUTCDate()		
WHERE	[Invoice_Record_Id] = @Invoice_Record_Id And ( Is_Deleted Is null Or Is_Deleted = 0 )

GO




