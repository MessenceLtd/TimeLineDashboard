SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Get_Client_Types]
As

Select	* 
From	t_TLBoard_Client_Types

GO
