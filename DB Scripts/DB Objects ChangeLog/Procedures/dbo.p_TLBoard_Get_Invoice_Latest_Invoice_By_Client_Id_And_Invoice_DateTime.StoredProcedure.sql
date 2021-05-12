SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Invoice_Latest_Invoice_By_Client_Id_And_Invoice_DateTime]
@Client_Id Int, @Invoice_DateTime DateTime, @Searching_User_Id Int
As

Select		Top 1 Invoices.* 
From		t_TLBoard_Invoices Invoices
Where		Invoices.Client_Id = @Client_Id And Invoices.Invoice_DateTime <= @Invoice_DateTime
Order By	Invoices.Invoice_DateTime desc  

GO
