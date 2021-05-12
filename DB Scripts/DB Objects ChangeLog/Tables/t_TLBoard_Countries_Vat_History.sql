SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Countries_Vat_History](
	[Vat_History_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Country_Id] [smallint] NOT NULL,
	[Vat_Changed_Date] [datetime] NOT NULL,
	[Vat_Percentage] [decimal](6, 2) NOT NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL
) ON [PRIMARY]
GO
