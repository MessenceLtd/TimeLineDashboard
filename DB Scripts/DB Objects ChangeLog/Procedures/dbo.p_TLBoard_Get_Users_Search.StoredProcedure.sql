SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Users_Search]
@Search_Criteria NVarChar(50)
As

Select	[Username]							,
		[App_Permission_Type_Id]			,
		[First_Name]						,
		[Middle_Name]						,
		[Last_Name]							,
		[Email]								,
		[Country_Id]						,
		[State_Id]							,
		[City]								,
		[Address]							,
		[ZipCode]							,
		[Mobile_Phone]						,
		[Additional_Phone_Number]			,
		[Record_Creation_DateTime_UTC]		,
		[Record_Last_Updated_DateTime_UTC]	,
		[Record_Last_Updated_By_User_Id]
From	t_TLBoard_Users 
Where	Len( @Search_Criteria ) > 0 
		And (	[First_Name] = @Search_Criteria		Or 
				[Middle_Name] = @Search_Criteria	Or 
				[Last_Name] = @Search_Criteria		Or 
				[Email] = @Search_Criteria		Or 
				[City] = @Search_Criteria			Or 
				[ZipCode] = @Search_Criteria		)

GO
