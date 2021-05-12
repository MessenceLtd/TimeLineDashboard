SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update t_TLBoard_Users Set App_Permission_Type_Id = 1 Where User_Id = 1 

CREATE Proc [dbo].[p_TLBoard_Get_Users_Administration_List]
@User_Id_Authorized_Employee_Searching_Users Int
As

Select	users.[User_Id],  
		users.Email, 
		users.First_Name, 
		users.Middle_Name , 
		users.Last_Name, 
		users.Username, 
		users.App_Permission_Type_Id
From	t_TLBoard_Users users
Where	users.Is_Active = 1 and users.Is_Deleted = 0

GO
