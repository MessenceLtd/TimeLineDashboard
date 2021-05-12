SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Get_Clients_All_By_User_Id]
@User_Id_To_Return_Clients Int, 
@Authenticated_User_ID Int
As

Select	Client_Id,[User_Id], Company_Name, Website_URL, Country_Id, State_Id, City, 
		Mobile_Phone, Client_Type_Id, 
		Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number, 
		Is_Active , Is_Deleted
From	t_TLBoard_Clients 
Where	[User_Id] = @User_Id_To_Return_Clients And Is_Deleted = 0 And Is_Active = 1

GO
