SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_AppExceptions](
	[App_Error_Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Exception] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InnerException] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Error_TimeStamp_UTC] [datetime] NULL,
	[User_Id] [int] NULL
) ON [PRIMARY]
GO
