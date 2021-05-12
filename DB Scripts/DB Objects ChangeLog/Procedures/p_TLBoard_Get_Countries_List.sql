SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[p_TLBoard_Get_Countries_List]
As

Select	Country_Id, Country_Code, Country_English_Name, Primary_Currency_Id
From	t_TLBoard_Countries
Where	Country_Id Not In ( Select Country_Id From t_TLBoard_Countries_Banned ) And Is_Active = 1

GO
