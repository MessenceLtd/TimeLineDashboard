SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[p_TLBoard_Get_Client_Details]
@Client_Id Int, 
@User_Id Int
As

Select	client.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Clients client
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = client.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = client.Record_Last_Updated_By_User_Id
Where	client.[Client_Id] = @Client_Id And client.[User_Id] = @User_Id 
		And ( client.Is_Deleted Is Null Or client.Is_Deleted = 0 )  

GO
