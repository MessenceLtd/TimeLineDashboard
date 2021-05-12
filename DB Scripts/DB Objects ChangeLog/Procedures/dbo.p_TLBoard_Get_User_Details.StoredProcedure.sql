SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_User_Details]
@User_Id Int
As

Select	[usr].[User_Id]							    ,
		[usr].[Username]							,
		[usr].[Encrypted_Password]				    ,
		[usr].[Encryption_Random_Salt]			    ,
		[usr].[App_Permission_Type_Id]			    ,
		[usr].[First_Name]						    ,
		[usr].[Middle_Name]						    ,
		[usr].[Last_Name]							,
		[usr].[Email]							    ,
		[usr].[Country_Id]						    ,
		[usr].[State_Id]							,
		[usr].[City]								,
		[usr].[Address]							    ,
		[usr].[ZipCode]							    ,
        [usr].[Default_Currency_Id]					,
		[usr].[Mobile_Phone]						,
		[usr].[Additional_Phone_Number]			    ,
		[usr].[Birth_Date]						    ,
		[usr].[Gender]							    ,
		[usr].[Registration_DateTime_UTC]			,
        [usr].Azure_Container_Ref                   ,
        [usr].Heard_About_Application_From          ,
        [usr].Our_Administrative_Side_Notes         ,
		[usr].[Record_Creation_DateTime_UTC]		,
		[usr].[Record_Created_By_User_Id]			,
		[usr].[Record_Last_Updated_DateTime_UTC]	,
		[usr].[Record_Last_Updated_By_User_Id]	    ,
		[usr].[Is_Deleted]						    ,
		[usr].[Is_Active]                           ,
        createdBy.First_Name As Created_By_First_Name, 
        createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
        lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	[dbo].[t_TLBoard_Users] [usr]
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = [usr].Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = [usr].Record_Last_Updated_By_User_Id
Where	[usr].[User_Id] = @User_Id

GO
