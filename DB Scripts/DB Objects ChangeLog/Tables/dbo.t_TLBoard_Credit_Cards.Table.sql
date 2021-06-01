SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Credit_Cards](
	[Credit_Card_Id] [int] IDENTITY(1,1) NOT NULL,
	[Bank_Account_Id] [int] NULL,
	[User_Id] [int] NULL,
	[Card_Name] [nvarchar](40) NULL,
	[Four_Ending_Digits] [nvarchar](4) NULL,
	[Expiration_Date] [smalldatetime] NULL,
	[Is_Active] [bit] NOT NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Credit_Cards] PRIMARY KEY CLUSTERED 
(
	[Credit_Card_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Credit_Cards] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Cards_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [t_TLBoard_Credit_Cards] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Cards_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Credit_Cards] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Cards_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_Credit_Cards] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Cards_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
