SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc p_TLBoard_Get_Users_Are_There_Any_Users
As

-- Return a boolean indication if there is any user in the database to prevent first time administrator usage
Declare @Are_There_Any_Users Bit;
Set @Are_There_Any_Users = 0;

If (Exists(Select Top 1 User_Id From t_TLBoard_Users Order by User_Id asc))
Begin
	Set @Are_There_Any_Users = 1;
End

Select @Are_There_Any_Users as Are_There_Any_Users;

GO
