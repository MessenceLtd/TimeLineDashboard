SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_General_Document_Types](
	[General_Document_Type_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Document_Type_Name] [nvarchar](50) NULL,
	[Sort_Order] [smallint] NULL,
	[Suggested_By_User_Id] [int] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Is_Visible] [bit] NULL,
 CONSTRAINT [PK_t_TLBoard_General_Document_Types] PRIMARY KEY CLUSTERED 
(
	[General_Document_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_General_Document_Types] ADD  CONSTRAINT [DF_t_TLBoard_General_Document_Types_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_General_Document_Types] ADD  CONSTRAINT [DF_t_TLBoard_General_Document_Types_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
