SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Browers_User_Agents](
	[User_Browser_Agent_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Agent] [nvarchar](200) NULL,
	[Record_Created_TimeStamp_UTC] [datetime] NULL,
	[Is_Mobile] [bit] NULL,
	[Is_Desktop] [bit] NULL,
 CONSTRAINT [PK_t_TLBoard_Browers_User_Agents] PRIMARY KEY CLUSTERED 
(
	[User_Browser_Agent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Browers_User_Agents] ADD  CONSTRAINT [DF_t_TLBoard_Browers_User_Agents_Record_Created_TimeStamp_UTC]  DEFAULT (getutcdate()) FOR [Record_Created_TimeStamp_UTC]
GO
