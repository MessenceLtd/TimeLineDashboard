SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [p_TLBoard_Get_Clients_Search]
@Search_Criteria NVarChar(50) ,
@User_Id Int
As

Select	Client_Id,[User_Id], Company_Name, Website_URL, Country_Id, State_Id, City, 
		Mobile_Phone, Client_Type_Id, 
		Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number, 
		Is_Active , Is_Deleted
From	t_TLBoard_Clients 
Where	[User_Id] = @User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 ) And 
		(	Company_Name Like '%'+@Search_Criteria+'%' Or
			Website_URL Like '%' + @Search_Criteria + '%' Or
			City Like '%' + @Search_Criteria + '%'  Or
			Main_Contact_FullName Like '%' + @Search_Criteria + '%'
			) 

GO
