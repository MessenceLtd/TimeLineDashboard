SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [p_TLBoard_Insert_Countries_Vat_History_Details]
@Country_Id SmallInt, @Vat_Changed_Date DateTime,
@Vat_Percentage Decimal(6,2), @Record_Created_By_User_Id int,
@Record_Creation_DateTime_UTC DateTime, @Record_Last_Updated_By_User_Id int,
@Record_Last_Updated_DateTime_UTC DateTime
AS

INSERT INTO [dbo].[t_TLBoard_Countries_Vat_History]
			   ([Country_Id], [Vat_Changed_Date], [Vat_Percentage], [Record_Created_By_User_Id],
				[Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC])
VALUES		(	@Country_Id,@Vat_Changed_Date, @Vat_Percentage, 
				@Record_Created_By_User_Id, @Record_Creation_DateTime_UTC, 
				@Record_Last_Updated_By_User_Id, @Record_Last_Updated_DateTime_UTC	)

Select @@IDENTITY;

GO
