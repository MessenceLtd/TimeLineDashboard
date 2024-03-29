﻿SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_Country_Details]
@Country_Id SmallInt , @Country_Code VarChar(10), @Country_English_Name NVarChar(80) , 
@Country_Native_Name NVarChar(80), @Continent_Id TinyInt, @Updating_User_Id Int
As

UPDATE	[dbo].[t_TLBoard_Countries]
SET		[Country_Code] = @Country_Code						, 
		[Country_English_Name] = @Country_English_Name		,
		[Country_Native_Name] = @Country_Native_Name		,
		[Continent_Id] = @Continent_Id						,
		Record_Last_Updated_By_User_Id = @Updating_User_Id	,
		Record_Last_Updated_DateTime_UTC = GetUTCDate()
WHERE	Country_Id = @Country_Id

GO
