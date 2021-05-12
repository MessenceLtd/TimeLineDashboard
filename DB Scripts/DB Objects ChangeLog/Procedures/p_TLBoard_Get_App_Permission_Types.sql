SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc p_TLBoard_Get_App_Permission_Types
As

Select	* 
From	t_TLBoard_App_Permission_Types

GO
