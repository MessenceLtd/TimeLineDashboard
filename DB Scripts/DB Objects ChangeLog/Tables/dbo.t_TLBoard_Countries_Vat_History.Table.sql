SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Countries_Vat_History](
	[Vat_History_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Country_Id] [smallint] NOT NULL,
	[Vat_Changed_Date] [datetime] NOT NULL,
	[Vat_Percentage] [decimal](6, 2) NOT NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
 CONSTRAINT [PK_t_TLBoard_Countries_Vat_History] PRIMARY KEY CLUSTERED 
(
	[Vat_History_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
