Use [DashboardTimeLine];

Go


Alter Proc p_TLBoard_Get_Countries_Vat_History_Get_All
As

SELECT		vatHistory.[Vat_History_Record_Id], 
			vatHistory.[Country_Id], 
			countryDetails.Country_English_Name,
			vatHistory.[Vat_Changed_Date],
			vatHistory.[Vat_Percentage], 
			vatHistory.[Record_Created_By_User_Id], 
			vatHistory.[Record_Creation_DateTime_UTC],
			vatHistory.[Record_Last_Updated_By_User_Id], 
			vatHistory.[Record_Last_Updated_DateTime_UTC] 
FROM		[t_TLBoard_Countries_Vat_History] vatHistory
JOIN		t_TLBoard_Countries countryDetails On countryDetails.Country_Id = vatHistory.Country_Id
ORDER BY	[Country_Id] ASC, Vat_Changed_Date DESC


Go

Alter Proc p_TLBoard_Insert_Countries_Vat_History_Details
@Country_Id SmallInt, @Vat_Changed_Date DateTime,
@Vat_Percentage Decimal(6,2), @Record_Created_By_User_Id int,
@Record_Creation_DateTime_UTC DateTime, @Record_Last_Updated_By_User_Id int,
@Record_Last_Updated_DateTime_UTC DateTime
AS

INSERT INTO [dbo].[t_TLBoard_Countries_Vat_History]
			   ([Country_Id], [Vat_Changed_Date], [Vat_Percentage], [Record_Created_By_User_Id],
				[Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC])
VALUES		(	@Country_Id,@Vat_Changed_Date, @Vat_Percentage, 
				@Record_Created_By_User_Id, @Record_Creation_DateTime_UTC, 
				@Record_Last_Updated_By_User_Id, @Record_Last_Updated_DateTime_UTC	)

Select @@IDENTITY;

GO


--exec p_TLBoard_Get_Countries_Vat_History_Get_All 

/*
01.10.15 ירד המע"מ ל- 17%
02.06.13 עלה המע"מ ל18% 
01.09.12 עלה המע"מ ל-17%
1.01.10  ירד המע"מ ל-16%
01.07.09 עלה המע"מ ל-16.5%
01.07.06 ירד המע"מ ל-15.5%
01.09.05 ירד המע"מ ל-16.5%
01.03.04 ירד המע"מ ל-17%
15.06.02 עלה המע"מ ל-18%
01.01.93 ירד המע"מ ל-17%
01.01.91 עלה המע"מ ל-18%
01.03.90 עלה המע"מ ל-16%
01.10.85 ירד המע"מ ל-15%
01.06.85 עלה המע"מ ל-17%
01.08.82 עלה המע"מ ל-15%
01.11.77 עלה המע"מ ל-12%

*/
