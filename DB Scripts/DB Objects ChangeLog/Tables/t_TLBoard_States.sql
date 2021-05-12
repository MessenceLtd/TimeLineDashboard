SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_States](
	[State_Id] [smallint] NOT NULL,
	[State_Code] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State_Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country_Id] [smallint] NULL
) ON [PRIMARY]
GO
