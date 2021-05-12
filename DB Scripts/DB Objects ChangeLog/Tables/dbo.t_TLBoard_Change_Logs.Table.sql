﻿SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Change_Logs](
	[Log_Id] [int] IDENTITY(1,1) NOT NULL,
	[Table_Name] [varchar](100) NULL,
	[PK] [nvarchar](500) NULL,
	[Timestamp] [datetime] NULL,
	[Updating_User_Id] [int] NULL,
	[Change_Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_t_TLBoard_Change_Logs] PRIMARY KEY CLUSTERED 
(
	[Log_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
