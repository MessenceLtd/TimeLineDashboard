SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Invoice_Details]
@Invoice_Record_Id Int, 
@User_Id_Invoice_Owner Int, 
@User_Id_Searching_For_Invoice_Details Int
As 

Select	invoice.*
From	t_TLBoard_Invoices invoice
Where	invoice.[Invoice_Record_Id] = @Invoice_Record_Id And invoice.Is_Deleted = 0 
		And invoice.[User_Id] = @User_Id_Invoice_Owner

GO
