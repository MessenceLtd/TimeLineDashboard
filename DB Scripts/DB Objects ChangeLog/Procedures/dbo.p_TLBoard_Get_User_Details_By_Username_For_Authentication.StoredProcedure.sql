SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_User_Details_By_Username_For_Authentication]
@Username_For_Authentication NVarChar(50)
As

Select	* 
From	t_TLBoard_Users
Where	Username = @Username_For_Authentication And Is_Active = 1 And Is_Deleted = 0

GO
