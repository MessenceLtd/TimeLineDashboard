SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Browers_User_Agents](
	[User_Browser_Agent_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Agent] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Record_Created_TimeStamp_UTC] [datetime] NULL,
	[Is_Mobile] [bit] NULL,
	[Is_Desktop] [bit] NULL
) ON [PRIMARY]
GO
