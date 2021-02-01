Use [DashboardTimeLine];
Go


Alter Proc p_Get_Users_Administration_List
@User_Id_Authorized_Employee_Searching_Users Int
As

Select	users.[User_Id],  users.Email, users.First_Name, users.Middle_Name , users.Last_Name, Username
From	t_TLBoard_Users users
Where	users.Is_Active = 1 and users.Is_Deleted = 0

Go

Alter Proc p_Get_Currencies_List
As

Select		currencies.* 
From		t_TLBoard_Currencies currencies
Order By	currencies.Wiki_Daily_Trades_Stats_2019 desc


Go

/* 

Todo -- Add new tables:
Document Types 
Supplier Types 

*/

Alter Proc p_TLBoard_Get_General_Document_Types
As

Select	General_Document_Type_Id	, 
		Document_Type_Name ,
		Sort_Order	,
		Suggested_By_User_Id, 
		Record_Created_By_User_Id,
		Record_Creation_DateTime_UTC, 
		Record_Last_Updated_By_User_Id, 
		Record_Last_Updated_DateTime_UTC, 
		Is_Active, 
		Is_Visible
From	t_TLBoard_General_Document_Types
Where	Is_Active = 1 

Go

Alter Proc p_TLBoard_Get_Supplier_Types
As

Select	[Supplier_Type_Id] , 
		[Type_Name] , 
		[Type_Code] , 
		[Description]
From	t_TLBoard_Supplier_Types

Go

--select * From t_TLBoard_Clients
--select * From t_TLBoard_Suppliers

--Select * From t_TLBoard_Expenses
--Select * From t_TLBoard_Invoices

-- dummy fillup expenses page
-- dummy fillup invoice page
-- dummy fillup document page 


Alter Proc p_TLBoard_Get_Suppliers_List_By_User_Id
@User_Id Int, @Searching_User_Id Int
As

Select	Supplier_Id, [User_Id], Company_Name + ' (' + suppliers.City + ')' As Company_Name
From	t_TLBoard_Suppliers suppliers
Where	suppliers.[User_Id] = @User_Id And 
		suppliers.Is_Active = 1 And 
		suppliers.Is_Deleted = 0 

Go

Alter Proc p_TLBoard_Get_Expense_Latest_Expense_By_Supplier_Id
@Supplier_Id Int, @Searching_User_Id Int
As

Select		Top 1 expenses.* 
From		t_TLBoard_Expenses expenses
Where		expenses.Supplier_Id = @Supplier_Id
Order By	expenses.Expense_Invoice_DateTime desc

Go

ALTER Proc [dbo].[p_TLBoard_Get_Supplier_Details]
@Supplier_Id Int, 
@User_Id_Searching_For_Supplier_Details Int
As

Select	supplier.*
From	t_TLBoard_Suppliers supplier
Where	supplier.[Supplier_Id] = @Supplier_Id
		And ( supplier.Is_Deleted Is Null Or supplier.Is_Deleted = 0 )  


Go

-- map default expenses table columns to supplier details table columns for auto complete using p_TLBoard_Get_Expense_Latest_Expense_By_Supplier_Id

--update t_TLBoard_Client_Types 
--set Record_Created_By_User_Id = 1, 
--	Record_Creation_DateTime_UTC = (GETUTCDATE()), 
--	Record_Last_Updated_By_User_Id = 1,
--	Record_Last_Updated_DateTime_UTC = (GETUTCDATE()),
--	Is_Active = 1,
--	Is_Visible = 1
--Where Record_Creation_DateTime_UTC is null

--update t_TLBoard_Supplier_Types 
--set Record_Created_By_User_Id = 1, 
--	Record_Creation_DateTime_UTC = (GETUTCDATE()), 
--	Record_Last_Updated_By_User_Id = 1,
--	Record_Last_Updated_DateTime_UTC = (GETUTCDATE()),
--	Is_Active = 1,
--	Is_Visible = 1
--Where Record_Creation_DateTime_UTC is null


--Invoice_Supplier_Company_Details	= Suppliers.Company_Name  
--Invoice_Supplier_Tax_Reference		= Suppliers.Supplier_Tax_Reference_Number
--Invoice_Address_Description			= Suppliers.Address
--Invoice_Supplier_Phone_Number		= Suppliers.Telephone
--Invoice_Supplier_WebAddress			= Suppliers.Website_URL
-- Default currency ? 
-- Default Vat ? 

-- Need to map default currencies to countries.. 


ALTER Proc [dbo].[p_TLBoard_Insert_Supplier_Details]
@User_Id int, @Company_Name nvarchar(100),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt ,
@Telephone varchar(40), @Mobile_Phone varchar(40), 
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number nvarchar(20),
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100),
@Main_Contact_Phone_Number nvarchar(50), 
@Client_From_Date DateTime , @Client_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Record_Created_By_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Suppliers]
           ([User_Id] , [Company_Name], [Website_URL], 
		   [Country_Id], [State_Id], [City], [Address], [ZipCode],
		   [Default_Currency_Id],
           [Telephone]
           ,[Mobile_Phone]
           ,[Supplier_Type_Id]
           ,[Supplier_Tax_Reference_Number]
           ,[Main_Contact_FullName]
           ,[Main_Contact_Email_Address]
           ,[Main_Contact_Phone_Number]
		   ,[Supplier_From_Date], [Supplier_To_Date], [First_Contract_Date]
		   ,[First_Contract_Signed_With_Contact_Full_Name]  
		   ,[First_Contract_Signed_In_Location_Description] 
		   ,Is_Active
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           )
     VALUES
           (@User_Id , @Company_Name, @Website_URL, @Country_Id, @State_Id, @City,
			@Address, @ZipCode, @Default_Currency_Id, 
			@Telephone, 
			@Mobile_Phone, @Supplier_Type_Id, @Supplier_Tax_Reference_Number,
			@Main_Contact_FullName, @Main_Contact_Email_Address, 
			@Main_Contact_Phone_Number, 
			@Client_From_Date, @Client_To_Date, @First_Contract_Date,
			@First_Contract_Signed_With_Contact_Full_Name, 
			@First_Contract_Signed_In_Location_Description,
			@Is_Active,
			@Record_Created_By_User_Id, 
			GETUTCDATE(), 
			@Record_Created_By_User_Id,
			GETUTCDATE()
           )

Select @@IDENTITY;

Go

--select * from t_TLBoard_Currencies
---- 1 = usd
---- 2 = euro
---- 28 = ils

--select * from t_tlboard_countries where Country_English_Name like '%Sudan%'
--select * from t_TLBoard_Currencies

--SELECT [Country_Name]
--      ,[Currency_Name_Desc]
--      ,[Currency_Code]
--      ,[Currency_Number]
--  FROM [dbo].[t_TLBoard_Countries_Currencies]
  -- 234 countries with currency_id to sync with t_TLBoard_Countries.Primary_Currency_Id


/*****************//*****************//*****************//*****************//*****************/
/*****************//*****************//*****************//*****************//*****************/
/*****************//*****************//*****************//*****************//*****************/
--Update t_TLBoard_Countries 
--Set t_TLBoard_Countries.Primary_Currency_Id = currency.Currency_Id
--From t_TLBoard_Countries
--Join [t_TLBoard_Countries_Currencies] cc on cc.Country_Name = t_TLBoard_Countries.Country_English_Name
--join t_TLBoard_Currencies as currency on currency.Currency_Code = cc.Currency_Code
--where t_TLBoard_Countries.Primary_Currency_Id is null
/*****************//*****************//*****************//*****************//*****************/
/*****************//*****************//*****************//*****************//*****************/
/*****************//*****************//*****************//*****************//*****************/

-- (74 rows affected) :O only 74 rows auto synced by country name >_< 
-- or maybe i do not have the other currencies information in   t_TLBoard_Currencies ..

--Select  cc.Currency_Code, cur.Currency_Code , Count(cc.Country_Name) As total_Countries 
--From [t_TLBoard_Countries_Currencies] cc
--left join t_TLBoard_Currencies cur on cur.Currency_Code = cc.Currency_Code
--group by cc.Currency_Code, cur.Currency_Code
--Order by total_Countries desc


--select cur.Country_Name as Unfound_Country , c.*
--from t_TLBoard_Countries c
--left join t_TLBoard_Countries_Currencies cur on cur.Country_Name = c.Country_English_Name
--where cur.Country_Name is null and c.Primary_Currency_Id is null
---- 50 unsynced country names 


--update t_TLBoard_Countries set Primary_Currency_Id = 2 where Country_Id = 2  -- Åland Islands, euro
--Update t_TLBoard_Countries set Country_English_Name = 'Bolivia' where Country_Id = 27 -- Bolivia (Plurinational State of)
--Update t_TLBoard_Countries set Primary_Currency_Id = 1 where Country_Id = 28 -- Bonaire, Sint Eustatius and Saba
--Update t_TLBoard_Countries set Primary_Currency_Id = 1 where Country_Id = 33 --British Indian Ocean Territory , United States Dollar
--update t_TLBoard_Countries set Country_English_Name = 'Cape Verde' where Country_English_Name = 'Cabo Verde' -- 38	CV	Cabo Verde

---------------

/*
Select cc.Currency_Code , count(cc.Country_Name) as total_Unknown_Currencies
from t_TLBoard_Countries_Currencies cc
Left Join t_TLBoard_Currencies cur on cur.Currency_Code = cc.Currency_Code
where cur.Currency_Id is null
group by cc.Currency_Code
order by total_Unknown_Currencies desc
*/
-- 124 unknown currencies...  >_<


Alter Proc p_t_TLBoard_Insert_Currency
@Currency_Name NVarChar(50), @Currency_Code VarChar(10) , @Currency_Symbol NVarChar(10)
As

Declare @Currency_Id TinyInt; 
Set @Currency_Id = ( Select (Max(Currency_Id)+1) from t_TLBoard_Currencies)

If (@Currency_Name Is Not Null)
Begin

	Insert Into t_TLBoard_Currencies (Currency_Id, Currency_Name, Currency_Code, Currency_Symbol )
	Values ( @Currency_Id, @Currency_Name, @Currency_Code, @Currency_Symbol )

	Select @Currency_Id;

End

Go

Declare @Currency_Name NVarChar(50); 
Declare @Currency_Code VarChar(10); 
Declare @Currency_Symbol NVarChar(10); 

--XCD	8
--Set @Currency_Name		= N'Eastern Caribbean Dollar';
--set @Currency_Code		= 'XCD';
--set @Currency_Symbol	= N'EC$'
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol


--XOF	7
--Set @Currency_Name		= N'West African CFA franc';
--set @Currency_Code		= 'CFA'; -- XOF
--set @Currency_Symbol	= N'CFA'
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol

--XAF	6
--Set @Currency_Name		= N'Central African CFA franc';
--set @Currency_Code		= 'XAF';
--set @Currency_Symbol	= N'FCFA'
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol

--XPF	3
--Set @Currency_Name		= N'CFP franc';
--set @Currency_Code		= 'XPF';
--set @Currency_Symbol	= N'₣'
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol

--Set @Currency_Name		= N'Netherlands Antillean guilder';
--set @Currency_Code		= 'ANG';
--set @Currency_Symbol	= N'NAƒ'

--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol


--Set @Currency_Name		= N'Netherlands Antillean guilder';
--set @Currency_Code		= 'ANG';
--set @Currency_Symbol	= N'NAƒ'
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @@Currency_Symbol


--Set @Currency_Name		= N'Moroccan dirham';
--set @Currency_Code		= 'MAD';
--set @Currency_Symbol	= N'DH';
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol


--select * from t_TLBoard_Currencies

/********************//********************//********************/
/*
Update t_TLBoard_Countries 
Set t_TLBoard_Countries.Primary_Currency_Id = currency.Currency_Id
From t_TLBoard_Countries
Join [t_TLBoard_Countries_Currencies] cc on cc.Country_Name = t_TLBoard_Countries.Country_English_Name
join t_TLBoard_Currencies as currency on currency.Currency_Code = cc.Currency_Code
where t_TLBoard_Countries.Primary_Currency_Id is null
*/
/********************//********************//********************/
--(17 rows affected)

-- From here for the rest ~119 currencies of some countries.. Thier symbol/name will not be searched
-- This will be done in later stages of developments.. i will need more information on countries anyway and think how to update it.. 
-- Info like -- Population , Languages/Primary Language , Mobile Country Code, Hour Diffrences, LAN/LAT of major cities and more.. 

--select * from t_TLBoard_Countries where Primary_Currency_Id is not null
-- 94 countries with primary currency_id information.. 

--Update t_TLBoard_Countries 
--Set t_TLBoard_Countries.Primary_Currency_Id = currency.Currency_Id
--From t_TLBoard_Countries
--Join [t_TLBoard_Countries_Currencies] cc on cc.Country_Name = t_TLBoard_Countries.Country_English_Name
--join t_TLBoard_Currencies as currency on currency.Currency_Code = cc.Currency_Code
--where t_TLBoard_Countries.Primary_Currency_Id is null
-- (104 rows affected)  after adding missing currencies codes without researching thier name and symbol

--select * from t_TLBoard_Countries where Primary_Currency_Id is not null
-- 198 countries with primary currency ! 
-- I have total ~249 countries ! so need another ~50 countries to sync.. 

/*
Select		cur.Country_Name as Unfound_Country , c.*
From		t_TLBoard_Countries c
Left Join	t_TLBoard_Countries_Currencies cur on cur.Country_Name = c.Country_English_Name
Where		cur.Country_Name is null and c.Primary_Currency_Id is null
*/
---- 50 unsynced country names 


--update t_TLBoard_Countries set Primary_Currency_Id = 2, Country_English_Name = 'Netherlands' where Country_Id = 157 -- Netherlands[note 1]
--Update t_TLBoard_Countries Set Primary_Currency_Id = 38 where Country_Id = 51  -- Congo, XAF
--Update t_TLBoard_Countries Set Primary_Currency_Id = 63 where Country_Id = 52  -- Congo, Democratic Republic of the = CDF
--Update t_TLBoard_Countries Set Primary_Currency_Id = 37 where Country_Id = 55  -- Côte d'Ivoire = XOF

--XOF

--select * from t_TLBoard_Currencies where Currency_Code = 'XOF'

--update t_TLBoard_Currencies set Currency_Code = 'XOF' where Currency_Id = 37


--- 41 countries remaining.. i need a break.. 
Update t_TLBoard_Countries Set Primary_Currency_Id = 86 where Country_Id = 56  -- 56	HR	Croatiae = HRK
--select * from t_TLBoard_Currencies where Currency_Code = 'HRK' 
Update t_TLBoard_Countries Set Primary_Currency_Id = 40 where Country_Id = 58  -- 58	CW	Curaçao = ang
--select * from t_TLBoard_Currencies where Currency_Code = 'ang' 
Update t_TLBoard_Countries Set Primary_Currency_Id = 40 where Country_Id = 58  -- 58	CW	Curaçao = ang
--select * from t_TLBoard_Currencies where Currency_Code = 'ang' 
Update t_TLBoard_Countries Set Primary_Currency_Id = 27 where Country_Id = 60  --60	CZ	Czechia = CZK
--select * from t_TLBoard_Currencies where Currency_Code = 'CZK' 
Update t_TLBoard_Countries Set Primary_Currency_Id = 142 where Country_Id = 71  -- 71	SZ	Eswatini (also Swaziland) = SZL
--select * from t_TLBoard_Currencies where Currency_Code = 'SZL' 
Update t_TLBoard_Countries Set Primary_Currency_Id = 160 where Country_Id = 93  -- 93	GG	Guernsey  SZL = GGP

--93	GG	Guernsey
--98	HM	Heard Island and McDonald Islands

--Guernsey pound
--GGP
--GG£

--Set @Currency_Name		= N'Guernsey pound';
--set @Currency_Code		= 'GGP';
--set @Currency_Symbol	= N'GG£';
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol

Update t_TLBoard_Countries Set Primary_Currency_Id = 160 where Country_Id = 93  -- 93	GG	Guernsey  SZL = GGP

--update t_TLBoard_Countries set Country_English_Name = 'Iran' where Country_Id = 106
/*
Select		cur.Country_Name as Unfound_Country , c.*
From		t_TLBoard_Countries c
Left Join	t_TLBoard_Countries_Currencies cur on cur.Country_Name = c.Country_English_Name
Where		cur.Country_Name is null and c.Primary_Currency_Id is null
35 countries remaining */

Update t_TLBoard_Countries Set Primary_Currency_Id = 161 where Country_Id = 109  -- 109	IM	Isle of Man = IMP
--select * from t_TLBoard_Currencies where Currency_Code = 'SZL' 

--Set @Currency_Name		= N'Manx pound';
--set @Currency_Code		= 'IMP';
--set @Currency_Symbol	= N'£';
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol

--Set @Currency_Name		= N'Jersey pound';
--set @Currency_Code		= 'JEP';
--set @Currency_Symbol	= N'£';
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol


Update t_TLBoard_Countries Set Primary_Currency_Id = 162 where Country_Id = 114  -- 114	JE	Jersey = JEP
Update t_TLBoard_Countries Set Primary_Currency_Id = 12 where Country_Id = 119  -- 119	KP	Korea (Democratic People's Republic of) = KRW
Update t_TLBoard_Countries Set Primary_Currency_Id = 95 where Country_Id = 120  -- 120	KR	Korea, Republic of = KPW
--select * from t_TLBoard_Currencies where Currency_Code in ( 'KRW', 'KPW' )
--Update t_TLBoard_Countries set Country_English_Name = 'Lao' where Country_English_Name = 'Lao People''s Democratic Republic'


--Set @Currency_Name		= N'Macanese pataca';
--set @Currency_Code		= 'MOP';
--set @Currency_Symbol	= N'MOP$';
--Exec p_t_TLBoard_Insert_Currency @Currency_Name, @Currency_Code, @Currency_Symbol
--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'mop' )
Update t_TLBoard_Countries Set Primary_Currency_Id = 111 where Country_Id = 132  -- 132	MO	Macao = MOP
Update t_TLBoard_Countries Set Primary_Currency_Id = 2 where Country_Id = 143  -- 143	YT	Mayotte = EUR
Update t_TLBoard_Countries Set Primary_Currency_Id = 1 where Country_Id = 145 -- 145	FM	Micronesia = USD
Update t_TLBoard_Countries Set Primary_Currency_Id = 109 where Country_Id = 153 -- 153	MM	Myanmar (Burma) = MMK
--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'MMK' )

Update t_TLBoard_Countries Set Primary_Currency_Id = 109 where Country_Id = 153 -- 153	MM	Myanmar (Burma) = MMK
Update t_TLBoard_Countries Set Primary_Currency_Id = 5 where Country_Id = 164 -- 164	NF	Norfolk Island = AUD
Update t_TLBoard_Countries Set Primary_Currency_Id = 108 where Country_Id = 165 -- 165	MK	North Macedonia = MKD
--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'MKD' )

Update t_TLBoard_Countries Set Primary_Currency_Id = 28 where Country_Id = 171 -- 171	PS	Palestine, State of = ils
update t_TLBoard_Countries set Country_English_Name = 'Pitcairn Island' where Country_English_Name = 'Pitcairn'
update t_TLBoard_Countries set Country_English_Name = N'Réunion Island' where Country_English_Name = 'Réunion'
Update t_TLBoard_Countries Set Primary_Currency_Id = 2 where Country_Id = 182 -- 182	RE	Réunion Island = eur


--143	YT	Mayotte
--145	FM	Micronesia (Federated States of)
--153	MM	Myanmar
--164	NF	Norfolk Island
--165	MK	North Macedonia
--171	PS	Palestine, State of
--177	PN	Pitcairn
--182	RE	Réunion

Update t_TLBoard_Countries Set Primary_Currency_Id = 2 where Country_Id = 186 -- 186	BL	Saint Barthélemy = eur
update t_TLBoard_Countries set Country_English_Name = N'Saint Helena' where Country_English_Name = 'Saint Helena, Ascension and Tristan da Cunha'
Update t_TLBoard_Countries Set Primary_Currency_Id = 2 where Country_Id = 190 -- 190	MF	Saint Martin (French part) = eur
Update t_TLBoard_Countries Set Primary_Currency_Id = 2 where Country_Id = 191 -- 191	PM	Saint Pierre and Miquelon = eur
Update t_TLBoard_Countries Set Primary_Currency_Id = 156 where Country_Id = 193 -- 193	WS	Samoa = WST
--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'WST' )
--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'ANG' )
Update t_TLBoard_Countries Set Primary_Currency_Id = 40 where Country_Id = 202 -- 202	SX	Sint Maarten (Dutch part) = ANG

Update t_TLBoard_Countries Set Primary_Currency_Id = 2 where Country_Id = 203 -- 203	SK	Slovakia = eur
Update t_TLBoard_Countries Set Primary_Currency_Id = 75 where Country_Id = 208 -- GS	South Georgia and the South Sandwich Islands = FKP 	Falkland Islands pound
--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'FKP' )

--186	BL	Saint Barthélemy
--187	SH	Saint Helena, Ascension and Tristan da Cunha
--190	MF	Saint Martin (French part)
--191	PM	Saint Pierre and Miquelon
--193	WS	Samoa
--202	SX	Sint Maarten (Dutch part)
--203	SK	Slovakia
--208	GS	South Georgia and the South Sandwich Islands

--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'TWD' )
Update t_TLBoard_Countries Set Primary_Currency_Id = 1 where Country_Id = 214 -- 214	SJ	Svalbard and Jan Mayen =  ??  USD... 

Update t_TLBoard_Countries Set Primary_Currency_Id = 1 where Country_Id = 214 -- 214	SJ	Svalbard and Jan Mayen =  ??  USD... 

update t_TLBoard_Countries set Country_English_Name = 'Taiwan, Province of China' where Country_English_Name = 'Taiwan, Province of China [note 2]'
Update t_TLBoard_Countries Set Primary_Currency_Id = 21 where Country_Id = 218 -- 218	TW	Taiwan, Province of China =  ??  TWD... 

update t_TLBoard_Countries set Country_English_Name = 'Tanzania' where Country_English_Name = 'Tanzania, United Republic of'

update t_TLBoard_Countries set Country_English_Name = 'Timor Leste' where Country_English_Name = 'Timor-Leste'

Update t_TLBoard_Countries Set Primary_Currency_Id = 4 where Country_Id = 235  -- 235	GB	United Kingdom of Great Britain and Northern Ireland

Update t_TLBoard_Countries Set Primary_Currency_Id = 1 where Country_Id = 236  -- 236	UM	United States Minor Outlying Islands

Update t_TLBoard_Countries Set Primary_Currency_Id = 1 where Country_Id = 237  -- 237	US	United States of America

update t_TLBoard_Countries set Country_English_Name = 'Venezuela' where Country_English_Name = 'Venezuela (Bolivarian Republic of)'

--update t_TLBoard_Countries set Country_English_Name = '	Vietnam' where Country_English_Name = 'Viet Nam'
--update t_TLBoard_Countries set Country_English_Name = 'Vietnam' where Country_English_Name like '%Vietnam%'

Update t_TLBoard_Countries Set Primary_Currency_Id = 39 where Country_Id = 245  -- 245	WF	Wallis and Futuna = XPF  (CFP franc)
--Select * from t_TLBoard_Currencies  where Currency_Code in ( 'XPF' )

--214	SJ	Svalbard and Jan Mayen
--218	TW	Taiwan, Province of China [note 2]
--220	TZ	Tanzania, United Republic of
--222	TL	Timor-Leste
--235	GB	United Kingdom of Great Britain and Northern Ireland
--236	UM	United States Minor Outlying Islands
--237	US	United States of America
--241	VE	Venezuela (Bolivarian Republic of)
--242	VN	Viet Nam
--245	WF	Wallis and Futuna


/********************//********************//********************/
/*
Update t_TLBoard_Countries 
Set t_TLBoard_Countries.Primary_Currency_Id = currency.Currency_Id
From t_TLBoard_Countries
Join [t_TLBoard_Countries_Currencies] cc on cc.Country_Name = t_TLBoard_Countries.Country_English_Name
join t_TLBoard_Currencies as currency on currency.Currency_Code = cc.Currency_Code
where t_TLBoard_Countries.Primary_Currency_Id is null
*/
/********************//********************//********************/
-- (5 rows affected) 

Select * From t_TLBoard_Countries Where Primary_Currency_Id is null
/*
9	AQ	Antarctica
31	BV	Bouvet Island
98	HM	Heard Island and McDonald Islands
which are remote and uninhabited islands and should not have a default currency..  
*/


ALTER Proc [dbo].[p_TLBoard_Get_Countries_List]
As

Select	Country_Id, Country_Code, Country_English_Name, Primary_Currency_Id
From	t_TLBoard_Countries
Where	Country_Id Not In ( Select Country_Id From t_TLBoard_Countries_Banned ) And Is_Active = 1

GO
