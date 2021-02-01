Use [DashboardTimeLine];
Go



--Select	* ,  
--		SUBSTRING(vat_Country_Desc, 1, CharIndex('(',vat_Country_Desc) - 2 ) AS ExtractString
--From	t_TLboard_Vat_History_Imported_From_PWC


--Update t_TLboard_Vat_History_Imported_From_PWC set countryName = SUBSTRING(vat_Country_Desc, 1, CharIndex('(',vat_Country_Desc) - 2 ) 

--Update t_TLboard_Vat_History_Imported_From_PWC set vat = 0 Where vat is null 


--Insert Into t_TLBoard_Countries_Vat_History (Country_Id, Vat_Changed_Date, Vat_Percentage, 1, GetUTCDate(), 1 , GETUTCDate() )

--Select GetDate()

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	country.Country_Id, '2021-01-01 00:00:00.000', pwcHistory.vat , 1, GetUTCDate(), 1 , GETUTCDate()
--From	t_TLboard_Vat_History_Imported_From_PWC pwcHistory
--Join	t_TLBoard_Countries country On country.Country_English_Name = pwcHistory.countryName
-- (129 rows affected)

-- israel ? 
--Select	* 
--From	t_TLBoard_Countries_Vat_History 
--Where	Country_Id = 110
--select getdate()
--01.10.15
--'2015-10-01'

--Update t_TLBoard_Countries_Vat_History set Vat_Changed_Date = '2015-10-01' where Country_Id = 110

--Declare @Country_Id Int; 
--Declare @Vat Decimal(6,2); 
--Declare @Change_Date DateTime;

--Set @Country_Id = 110;
--Set @Vat = 18;
--Set @Change_Date = '2013-06-02'; 

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 110;
--Set @Change_Date = '2012-09-01'; 
--Set @Vat = 17;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 110;
--Set @Change_Date = '2010-01-01'; 
--Set @Vat = 16;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 110;
--Set @Change_Date = '2009-07-01'; 
--Set @Vat = 16.5;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 110;
--Set @Change_Date = '2006-07-01'; 
--Set @Vat = 15.5;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 110;
--Set @Change_Date = '2005-09-01'; 
--Set @Vat = 16.5;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 110;
--Set @Change_Date = '2004-03-01'; 
--Set @Vat = 17;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 110;
--Set @Change_Date = '2002-06-15'; 
--Set @Vat = 18;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 110;
--Set @Change_Date = '1991-01-01'; 
--Set @Vat = 18;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()

--Select * from t_TLBoard_Countries_Vat_History where Country_Id = 110 order by Vat_Changed_Date desc


--Set @Country_Id = 110;
--Set @Change_Date = '1990-03-01'; 
--Set @Vat = 16;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 110;
--Set @Change_Date = '1985-10-01'; 
--Set @Vat = 15;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 110;
--Set @Change_Date = '1985-06-01'; 
--Set @Vat = 17;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 110;
--Set @Change_Date = '1977-11-01'; 
--Set @Vat = 12;

--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat , 1, GetUTCDate(), 1 , GETUTCDate()


/*
DONE -- 01.10.15 ירד המע"מ ל- 17%
DONE -- 02.06.13 עלה המע"מ ל18% 
DONE -- 01.09.12 עלה המע"מ ל-17%
DONE -- 01.01.10  ירד המע"מ ל-16%
DONE -- 01.07.09 עלה המע"מ ל-16.5%
DONE -- 01.07.06 ירד המע"מ ל-15.5%
DONE -- 01.09.05 ירד המע"מ ל-16.5%
DONE -- 01.03.04 ירד המע"מ ל-17%
DONE -- 15.06.02 עלה המע"מ ל-18%
DONE -- 01.01.93 ירד המע"מ ל-17%
DONE -- 01.01.91 עלה המע"מ ל-18%
DONE -- 01.03.90 עלה המע"מ ל-16%
DONE -- 01.10.85 ירד המע"מ ל-15%
DONE -- 01.06.85 עלה המע"מ ל-17%
DONE -- 01.08.82 עלה המע"מ ל-15%
DONE -- 01.11.77 עלה המע"מ ל-12%
*/

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- Sync countries's missed due to name 

--Update	t_TLboard_Vat_History_Imported_From_PWC  Set t_TLboard_Vat_History_Imported_From_PWC.Synced=1
--From	t_TLboard_Vat_History_Imported_From_PWC hist
--join	t_TLBoard_Countries country On country.Country_English_Name = hist.countryName
-- 129 rows affected 

--Select countryName, Vat 
--From t_TLboard_Vat_History_Imported_From_PWC
--Where Synced Is Null 



--Select * From t_TLBoard_Countries where Country_English_Name like '%Verde%' -- 38	CV	Cape Verde
--Set @Country_Id = 38;
--Set @Vat = 15;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()
--select * from t_TLBoard_Countries_Vat_History

--Select * From t_TLBoard_Countries where Country_English_Name like '%Cameroon%' -- 40
--Set @Country_Id = 40;
--Set @Vat = 19;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Select * From t_TLBoard_Countries where Country_English_Name like '%China%' -- 46	CN	China
--Set @Country_Id = 46;
--Set @Vat = 13;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--select * From t_TLBoard_Countries_Vat_History
--Update t_TLBoard_Countries_Vat_History Set Country_Id = 46  Where Vat_History_Record_Id =  147
--Select * From t_TLBoard_Countries where Country_English_Name like '%Congo%' --51	CG	Congo

--Set @Country_Id = 51;
--Set @Vat = 16;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 60;  -- Select * From t_TLBoard_Countries where Country_English_Name like '%Czech%' -- 60	CZ	Czechia
--Set @Vat = 21;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 93;  -- Select * From t_TLBoard_Countries where Country_English_Name like '%Guernsey%' --93	GG	Guernsey
--Set @Vat = 0;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 93;  -- Select * From t_TLBoard_Countries where Country_English_Name like '%Guernsey%' --93	GG	Guernsey
--Set @Vat = 0;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 101;  -- Select * From t_TLBoard_Countries where Country_English_Name like '%Hong Kong%' -- 101	HK	Hong Kong
--Set @Vat = 0;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 55;  -- Select * From t_TLBoard_Countries where Country_English_Name like '%Côte%' -- 55	CI	Côte d'Ivoire (ivory coast)
--Set @Vat = 18;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 114;  -- Select * From t_TLBoard_Countries where Country_English_Name like '%Jersey%' -- 114	JE	Jersey 
--Set @Vat = 5;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 250;  -- Select * From t_TLBoard_Countries where country_code = 'XK' -- 250	XK	Republic of Kosovo
--Set @Vat = 18;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 123;  -- Select * From t_TLBoard_Countries where country_english_name like '%Lao%' -- 123	LA	Lao
--Set @Vat = 10;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 132;  -- Select * From t_TLBoard_Countries where country_english_name like '%Maca%' -- 132	MO	Macao
--Set @Vat = 0;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 136;  -- Select * From t_TLBoard_Countries where country_english_name like '%Maldives%' -- 136	MV	Maldives
--Set @Vat = 6;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 146;  -- Select * From t_TLBoard_Countries where country_english_name like '%Moldova%' -- 146	MD	Moldova, Republic of
--Set @Vat = 20;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 154;  -- Select * From t_TLBoard_Countries where country_english_name like '%Namibia%' -- 154	NA	Namibia
--Set @Vat = 15;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 171;  -- Select * From t_TLBoard_Countries where country_english_name like '%Pales%' -- 171	PS	Palestine, State of
--Set @Vat = 17;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 203;  -- Select * From t_TLBoard_Countries where country_english_name like '%Slovak%' -- 203	SK	Slovakia
--Set @Vat = 20;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 71;  -- Select * From t_TLBoard_Countries where country_english_name like '%Eswatini%' -- 71	SZ	Eswatini // Swaziland
--Set @Vat = 15;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 218;  -- Select * From t_TLBoard_Countries where country_english_name like '%Taiwan%' -- 218	TW	Taiwan, Province of China
--Set @Vat = 5;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 222;  -- Select * From t_TLBoard_Countries where country_english_name like '%Timor%' -- 222	TL	Timor Leste
--Set @Vat = 2.5;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()


--Set @Country_Id = 235;  -- Select * From t_TLBoard_Countries where country_english_name like '%United Kingdom%' -- 235	GB	United Kingdom of Great Britain and Northern Ireland
--Set @Vat = 20;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 237;  -- Select * From t_TLBoard_Countries where country_english_name like '%United States%' -- 237	US	United States of America
--Set @Vat = 10;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--Set @Country_Id = 239;  -- Select * From t_TLBoard_Countries where country_english_name like '%Uzbekistan%' -- 239	UZ	Uzbekistan
--Set @Vat = 15;
--Set @Change_Date = '2020-01-01'; 
--Insert Into t_TLBoard_Countries_Vat_History (	Country_Id, Vat_Changed_Date, Vat_Percentage, Record_Created_By_User_Id, 
--												Record_Creation_DateTime_UTC, Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC )
--Select	@Country_Id, @Change_Date, @Vat, 1 , GetUTCDate(), 1 , GETUTCDate()

--select * from t_TLBoard_Continents
--update t_TLBoard_Countries set Country_Code = 'XK' where Country_Id = 250 
/*
Cabo Verde	15.000
Cameroon, Republic of	19.250
China, People's Republic of	13.000
Congo, Republic of	16.000
Czech Republic	21.000
Guernsey, Channel Islands	0.000
Hong Kong SAR	0.000
Ivory Coast	18.000
Jersey, Channel Islands	5.000
Kosovo	18.000
Lao PDR	10.000
Macau SAR	0.000
Maldives, Republic of	6.000
Moldova	20.000
Namibia, Republic of	15.000
Palestinian territories	16.000
Slovak Republic	20.000
Swaziland	15.000
Taiwan	5.000
Timor-Leste	2.500
United Kingdom	20.000
United States	10.000

Uzbekistan, Republic of	15.000

**/

----------------------------------------------
----------------------------------------------
----------------------------------------------
--Update t_TLboard_Vat_History_Imported_From_PWC Set Synced = 1

Alter Proc [dbo].[p_TLBoard_Get_Expense_Latest_Expense_By_Supplier_Id_And_Expense_DateTime]
@Supplier_Id Int, @Expense_DateTime DateTime, @Searching_User_Id Int
As

Select		Top 1 expenses.* 
From		t_TLBoard_Expenses expenses
Where		expenses.Supplier_Id = @Supplier_Id And expenses.Expense_Invoice_DateTime <= @Expense_DateTime
Order By	expenses.Expense_Invoice_DateTime desc  

Go






