SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Login_Attempts](
	[Login_Attempt_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Session_Id] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[IP_Address] [varchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_Browser_Agent_Id] [int] NULL,
	[Login_Attempt_TimeStamp_UTC] [datetime] NULL,
	[Successfully_Logged_In] [bit] NULL,
	[User_Id] [int] NULL
) ON [PRIMARY]
GO
