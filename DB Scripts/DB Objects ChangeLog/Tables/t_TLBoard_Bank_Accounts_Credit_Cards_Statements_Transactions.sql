SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions](
	[Credit_Card_Statement_Transaction_Id] [bigint] NOT NULL,
	[Bank_Account_Credit_Card_Statement_Id] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Business_Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_Amount] [decimal](10, 2) NULL,
	[Transaction_Amount_Currency_Id] [tinyint] NULL,
	[Transaction_Actual_Payment_Amount] [decimal](10, 2) NULL,
	[Transaction_Actual_Payment_Amount_Currency_Id] [tinyint] NULL,
	[Description] [nvarchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Has_Been_Actually_Charged_In_Statement] [bit] NULL,
	[Total_Charged_In_Statement] [decimal](10, 2) NULL,
	[User_Description] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[User_Comments] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Transaction_Sort_Order_View] [smallint] NULL,
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
