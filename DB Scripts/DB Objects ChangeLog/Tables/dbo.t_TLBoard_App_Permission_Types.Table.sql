SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_App_Permission_Types](
	[App_Permission_Type_Id] [tinyint] NOT NULL,
	[App_Permission_Type_Name] [nvarchar](50) NOT NULL,
	[App_Permission_Type_Code] [varchar](50) NOT NULL,
	[App_Permission_Type_Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_t_TLBoard_App_Permission_Types] PRIMARY KEY CLUSTERED 
(
	[App_Permission_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
