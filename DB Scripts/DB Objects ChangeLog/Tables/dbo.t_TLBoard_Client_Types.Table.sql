SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Client_Types](
	[Client_Type_Id] [smallint] NOT NULL,
	[Type_Name] [nvarchar](200) NULL,
	[Type_Code] [varchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Is_Visible] [bit] NULL,
 CONSTRAINT [PK_t_TLBoard_Client_Types] PRIMARY KEY CLUSTERED 
(
	[Client_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Client_Types] ADD  CONSTRAINT [DF_t_TLBoard_Client_Types_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Client_Types] ADD  CONSTRAINT [DF_t_TLBoard_Client_Types_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
