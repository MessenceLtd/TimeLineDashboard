SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc p_TLBoard_Get_Countries_Vat_History_Get_All
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


GO
