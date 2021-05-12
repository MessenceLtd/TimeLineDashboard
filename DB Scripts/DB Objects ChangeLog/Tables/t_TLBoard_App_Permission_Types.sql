SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_App_Permission_Types](
	[App_Permission_Type_Id] [tinyint] NOT NULL,
	[App_Permission_Type_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[App_Permission_Type_Code] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[App_Permission_Type_Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
