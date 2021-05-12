SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Update_User_Details]
@User_Id                        Int				, 
@Username                       varchar(50)		, 
@First_Name                     nvarchar(60)	, 
@Middle_Name                    nvarchar(60)	, 
@Last_Name                      nvarchar(60)	, 
@Email                          varchar(100)	, 
@Country_Id                     SmallInt		,
@State_Id                       SmallInt		,
@City                           nvarchar(80)	,
@Address                        nvarchar(120)	,
@ZipCode                        nvarchar(10)	,
@Default_Currency_Id            TinyInt         ,
@Mobile_Phone                   varchar(20)		,
@Additional_Phone_Number        varchar(20)		, 
@Birth_Date                     DateTime        ,
@Gender                         TinyInt         ,
@Registration_DateTime_UTC      DateTime        ,
@Azure_Container_Ref            nvarchar(60)    , 
@Heard_About_Application_From   nvarchar(500)   ,   
@Our_Administrative_Side_Notes  nvarchar(500)   ,
@Is_Active                      Bit             ,
@Updating_User_Id               Int
As

UPDATE	[dbo].[t_TLBoard_Users]
SET		[Username] = @Username,
		[First_Name] = @First_Name ,
		[Middle_Name] = @Middle_Name ,
		[Last_Name] = @Last_Name ,
		[Email] = @Email , 
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City,
		[Address] = @Address,
		[ZipCode] = @ZipCode,
        [Default_Currency_Id] = @Default_Currency_Id,
		[Mobile_Phone] = @Mobile_Phone,
		[Additional_Phone_Number] = @Additional_Phone_Number,
        Birth_Date = @Birth_Date,
        Gender = @Gender,
        Registration_DateTime_UTC = @Registration_DateTime_UTC,
        Azure_Container_Ref = @Azure_Container_Ref,
        Is_Active = @Is_Active,
        Heard_About_Application_From = @Heard_About_Application_From,
        Our_Administrative_Side_Notes = @Our_Administrative_Side_Notes,
        Record_Last_Updated_DateTime_UTC = GetUtcDate(),
        Record_Last_Updated_By_User_Id = @Updating_User_Id
WHERE	[User_Id] = @User_Id And (Is_Deleted = 0 Or Is_Deleted Is Null )

GO
