SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_Currencies_List]
As

Select		currencies.* 
From		t_TLBoard_Currencies currencies
Order By	currencies.Wiki_Daily_Trades_Stats_2019 desc


GO
