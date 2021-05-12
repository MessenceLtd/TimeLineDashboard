SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create Proc p_TLBoard_Get_Countries_Vat_History
As

SELECT	[Vat_History_Record_Id], [Country_Id], [Vat_Changed_Date],
		[Vat_Percentage], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC],
		[Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC]
FROM	[dbo].[t_TLBoard_Countries_Vat_History]


GO
