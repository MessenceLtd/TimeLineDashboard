SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Get_States]
As

Select		State_Id, State_Code , State_Name, Country_Id
From		t_TLBoard_States
Order By	Country_Id, State_Name

GO
