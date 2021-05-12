SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Login_Attempts](
	[Login_Attempt_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Session_Id] [varchar](30) NULL,
	[IP_Address] [varchar](40) NULL,
	[User_Browser_Agent_Id] [int] NULL,
	[Login_Attempt_TimeStamp_UTC] [datetime] NULL,
	[Successfully_Logged_In] [bit] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_t_TLBoard_Login_Attempts] PRIMARY KEY CLUSTERED 
(
	[Login_Attempt_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Login_Attempts] ADD  CONSTRAINT [DF_t_TLBoard_Login_Attempts_Login_Attempt_TimeStamp_UTC]  DEFAULT (getutcdate()) FOR [Login_Attempt_TimeStamp_UTC]
GO
