SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements](
	[Bank_Account_Credit_Card_Statement_Id] [int] IDENTITY(1,1) NOT NULL,
	[Bank_Account_Id] [int] NOT NULL,
	[Statement_Date] [datetime] NOT NULL,
	[Total_Amount] [decimal](16, 2) NULL,
	[Currency_Id] [tinyint] NULL,
	[Bank_Account_Transaction_Id_Connection] [bigint] NULL,
	[Is_Visible] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL
) ON [PRIMARY]
GO
