SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [p_TLBoard_Get_Client_Details]
@Client_Id Int, 
@User_Id Int
As

Select	Client.*
From	t_TLBoard_Clients client
Where	client.[Client_Id] = @Client_Id And client.[User_Id] = @User_Id 
		And ( client.Is_Deleted Is Null Or client.Is_Deleted = 0 )  

GO
