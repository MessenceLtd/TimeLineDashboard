SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_AppExceptions](
	[App_Error_Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Exception] [nvarchar](500) NULL,
	[InnerException] [nvarchar](500) NULL,
	[Error_TimeStamp_UTC] [datetime] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_t_TLBoard_AppExceptions] PRIMARY KEY CLUSTERED 
(
	[App_Error_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_AppExceptions] ADD  CONSTRAINT [DF_Table_1_TimeStamp]  DEFAULT (getdate()) FOR [Error_TimeStamp_UTC]
GO
