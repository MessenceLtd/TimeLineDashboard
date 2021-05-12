SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Currencies](
	[Currency_Id] [tinyint] NOT NULL,
	[Currency_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency_Code] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Currency_Symbol] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Wiki_Daily_Trades_Stats_2019] [decimal](10, 3) NULL
) ON [PRIMARY]
GO
