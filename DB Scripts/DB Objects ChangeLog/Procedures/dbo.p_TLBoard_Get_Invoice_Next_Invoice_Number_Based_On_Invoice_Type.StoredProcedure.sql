SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Invoice_Next_Invoice_Number_Based_On_Invoice_Type]
@User_Id Int, 
@Invoice_Type_Id TinyInt 
As

Declare @Next_Invoice_Number Int; 

Set @Next_Invoice_Number =  (   Select  Max(Invoice_Number) Max_Invoice_Number
                                From    t_TLBoard_Invoices
                                Where   [User_Id] = @User_Id And Invoice_Type_Id = @Invoice_Type_Id );

-- The next invoice number based on the invoice type might be null (because there are no invoices for him of that type)

If (@Next_Invoice_Number Is Not Null)
Begin
    Set @Next_Invoice_Number = @Next_Invoice_Number + 1;
End 
--Else
--Begin 
--    -- ToDo -- Use the default starting values for the invoice type that the user selected in his profile
--End

Select @Next_Invoice_Number;

GO
