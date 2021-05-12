SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Invoice_Types](
	[Invoice_Type_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Invoice_Type_Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Visible] [bit] NOT NULL,
	[Sort_Order] [smallint] NOT NULL,
 CONSTRAINT [PK_t_TLBoard_Invoice_Types] PRIMARY KEY CLUSTERED 
(
	[Invoice_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Is_Visible]  DEFAULT ((1)) FOR [Is_Visible]
GO
