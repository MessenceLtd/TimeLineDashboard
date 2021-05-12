SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Audit](
	[Type] [char](1) NULL,
	[TableName] [varchar](128) NULL,
	[PK] [varchar](1000) NULL,
	[FieldName] [varchar](128) NULL,
	[OldValue] [varchar](1000) NULL,
	[NewValue] [varchar](1000) NULL,
	[UpdateDate] [datetime] NULL,
	[UserName] [varchar](128) NULL
) ON [PRIMARY]
GO
