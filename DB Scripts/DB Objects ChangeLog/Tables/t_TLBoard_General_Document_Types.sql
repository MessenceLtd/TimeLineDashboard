SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_General_Document_Types](
	[General_Document_Type_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Document_Type_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Sort_Order] [smallint] NULL,
	[Suggested_By_User_Id] [int] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Is_Visible] [bit] NULL
) ON [PRIMARY]
GO
