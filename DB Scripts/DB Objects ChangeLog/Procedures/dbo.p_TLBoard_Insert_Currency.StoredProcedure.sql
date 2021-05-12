SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Insert_Currency]
@Currency_Name NVarChar(50), @Currency_Code VarChar(10) , @Currency_Symbol NVarChar(10)
As

Declare @Currency_Id TinyInt; 
Set @Currency_Id = ( Select (Max(Currency_Id)+1) from t_TLBoard_Currencies)

If (@Currency_Name Is Not Null)
Begin

	Insert Into t_TLBoard_Currencies (Currency_Id, Currency_Name, Currency_Code, Currency_Symbol )
	Values ( @Currency_Id, @Currency_Name, @Currency_Code, @Currency_Symbol )

	Select @Currency_Id;

End

GO
