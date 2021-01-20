



ALTER Proc [dbo].[p_TLBoard_Get_Counties_List]
As

Select	Country_Id, Country_Code, Country_English_Name
From	t_TLBoard_Countries
Where	Country_Id Not In ( Select Country_Id From t_TLBoard_Countries_Banned ) And Is_Active = 1

Go

Declare @NAStatus_Countries_IsActive Int ; 
Set @NAStatus_Countries_IsActive = (Select Count(*) From t_TLBoard_Countries Where Is_Active Is Null );

If (@NAStatus_Countries_IsActive > 0 )
Begin 

	Update t_TLBoard_Countries Set Is_Active = 1 
	Where country_id not in (select country_id from t_TLBoard_Countries_Banned )

	update t_TLBoard_Countries set is_active = 0 where is_active is null

End