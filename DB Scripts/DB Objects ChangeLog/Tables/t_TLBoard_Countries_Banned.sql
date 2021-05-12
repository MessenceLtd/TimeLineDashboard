SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Countries_Banned](
	[Country_Id] [smallint] NOT NULL,
	[Name] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BanReason] [varchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BanDate] [datetime] NULL
) ON [PRIMARY]
GO
