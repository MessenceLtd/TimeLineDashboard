SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit](
	[Type] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[TableName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PK] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FieldName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OldValue] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NewValue] [varchar](1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdateDate] [datetime] NULL,
	[UserName] [varchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
