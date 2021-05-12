SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Supplier_Types](
	[Supplier_Type_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Type_Code] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Description] [nvarchar](500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Is_Visible] [bit] NULL
) ON [PRIMARY]
GO
