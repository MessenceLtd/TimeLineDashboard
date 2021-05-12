SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[p_TLBoard_Get_Users_Search]
@Search_Criteria NVarChar(50)
As

Select	[User_Id]                           ,
        [Username]							,
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
        [Birth_Date]                        ,
		[Record_Creation_DateTime_UTC]		,
		[Record_Last_Updated_DateTime_UTC]	,
        [Gender]                            ,
        [Registration_DateTime_UTC]         ,
        [Is_Deleted]                        ,
        [Is_Active]                         ,
		[Record_Last_Updated_By_User_Id]    
From	t_TLBoard_Users 
Where	Len (   @Search_Criteria ) > 0 
		And (	[First_Name]    = @Search_Criteria		OR 
				[Middle_Name]   = @Search_Criteria	    OR
				[Last_Name]     = @Search_Criteria		OR 
				[Email]         = @Search_Criteria		OR 
				[City]          = @Search_Criteria		OR 
				[ZipCode]       = @Search_Criteria		    )

GO
