SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Invoice_Types](
	[Invoice_Type_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Invoice_Type_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Visible] [bit] NOT NULL,
	[Sort_Order] [smallint] NOT NULL
) ON [PRIMARY]
GO
