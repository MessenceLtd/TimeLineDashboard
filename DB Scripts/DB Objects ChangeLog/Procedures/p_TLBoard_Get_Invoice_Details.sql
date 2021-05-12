SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[p_TLBoard_Get_Invoice_Details]
@Invoice_Record_Id Int, 
@User_Id_Invoice_Owner Int, 
@User_Id_Searching_For_Invoice_Details Int
As 

Select	invoice.* , 
		createdBy.First_Name As Created_By_First_Name, createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	t_TLBoard_Invoices invoice
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = invoice.Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = invoice.Record_Last_Updated_By_User_Id
Where	invoice.[Invoice_Record_Id] = @Invoice_Record_Id And invoice.Is_Deleted = 0 
		And invoice.[User_Id] = @User_Id_Invoice_Owner


GO
