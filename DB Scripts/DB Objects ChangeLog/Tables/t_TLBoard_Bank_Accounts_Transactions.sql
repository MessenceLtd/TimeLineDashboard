SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Bank_Accounts_Transactions](
	[Bank_Account_Transaction_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Bank_Account_Id] [int] NULL,
	[Transaction_Account_Balance] [decimal](16, 2) NULL,
	[Transaction_Actual_DateTime] [datetime] NOT NULL,
	[Positive_Amount_Entered] [decimal](16, 2) NULL,
	[Negative_Amount_Paid] [decimal](16, 2) NULL,
	[Transaction_Value_DateTime] [datetime] NULL,
	[Reference_Number] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_Bank_Description] [nvarchar](40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_Bank_Inner_Reference_Code] [nvarchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_User_Description] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_User_Comments] [nvarchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Credit_Card_Statement_Transaction] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL
) ON [PRIMARY]
GO
