SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Change_Logs](
	[Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[Table_Name] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PK] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Timestamp] [datetime] NULL,
	[Updating_User_Id] [int] NULL,
	[Change_Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
