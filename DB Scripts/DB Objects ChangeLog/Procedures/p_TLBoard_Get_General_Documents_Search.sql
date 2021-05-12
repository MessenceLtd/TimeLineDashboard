SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[p_TLBoard_Get_General_Documents_Search]
@User_Id Int,
@Filter_By_Type SmallInt,
@Filter_By_Country SmallInt , 
@Filter_By_State SmallInt , 
@Filter_By_City_Or_Address_Or_ZipCode NVarChar(50) , 
@Filter_By_CompanyName_Or_Person_Fullname NVarChar(50)
As

Select	document.General_Document_Id , 
		document.[User_Id], 
		document.Title, document.[Description] , 
		document.General_Document_Type ,
		document.Document_Creation_DateTime, 
		document.Sent_By_Entity_Name , 
		document.Sent_By_Entity_Country_Id ,
		country.Country_English_Name As Sent_By_Entity_Country_Name,
		document.Sent_By_Entity_State_Id ,
		document.Sent_By_Entity_City, 
		document.Sent_By_Entity_Email_Address, 
		document.Recieved_Document_DateTime, 
		document.Is_Visible_To_Anonymous_Users, document.Is_Available_For_Download_For_Anonymous_Users,
		document.Is_Visible_To_Followers_Users, document.Is_Available_For_Download_For_Followers_Users,
		document.Is_Active 
From		t_TLBoard_General_Documents document
Left Join	t_TLBoard_Countries country On country.Country_Id = document.Sent_By_Entity_Country_Id
Where	document.[User_Id] = @User_Id And ( document.Is_Deleted Is Null Or document.Is_Deleted = 0 ) And 
		(@Filter_By_Type Is Null Or General_Document_Type = @Filter_By_Type ) And 
		(@Filter_By_Country Is Null Or document.Sent_By_Entity_Country_Id = @Filter_By_Country ) And 
		(@Filter_By_State Is Null Or document.Sent_By_Entity_State_Id = @Filter_By_State ) And 
		(@Filter_By_City_Or_Address_Or_ZipCode Is Null Or Len(@Filter_By_City_Or_Address_Or_ZipCode) = 0 
			Or [Sent_By_Entity_City] Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' 
			Or [Sent_By_Entity_Address] Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%'
			Or [Sent_By_Entity_ZipCode] Like '%' + @Filter_By_City_Or_Address_Or_ZipCode + '%' ) And 
		(@Filter_By_CompanyName_Or_Person_Fullname Is Null Or Len(@Filter_By_CompanyName_Or_Person_Fullname) = 0
			Or document.Title Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or document.Description Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or Sent_By_Entity_Name Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' 
			Or Sent_By_Entity_Email_Address Like '%' + @Filter_By_CompanyName_Or_Person_Fullname + '%' ) 

GO
