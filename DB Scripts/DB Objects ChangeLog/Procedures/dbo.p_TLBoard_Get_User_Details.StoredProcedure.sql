SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Select * from t_TLBoard_Users


CREATE Proc [p_TLBoard_Get_User_Details]
@User_Id Int
As

Select	[User_Id]							,
		[Username]							,
		[Encrypted_Password]				,
		[Encryption_Random_Salt]			,
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
		[Birth_Date]						,
		[Gender]							,
		[Registration_DateTime_UTC]			,
		[Record_Creation_DateTime_UTC]		,
		[Record_Created_By_User_Id]			,
		[Record_Last_Updated_DateTime_UTC]	,
		[Record_Last_Updated_By_User_Id]	,
		[Is_Deleted]						,
		[Is_Active]
From	[dbo].[t_TLBoard_Users]
Where	[User_Id] = @User_Id

GO
