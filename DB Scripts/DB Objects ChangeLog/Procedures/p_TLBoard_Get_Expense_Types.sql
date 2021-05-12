SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Exec p_TLBoard_Get_Countries_Vat_History_Get_All
/*

CREATE TABLE [dbo].[t_TLBoard_Expense_Types](
	[Expense_Type_Id] [smallint] NOT NULL,
	[Expense_Type_Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Visible] [bit] NOT NULL,
 CONSTRAINT [PK_t_TLBoard_Expense_Types] PRIMARY KEY CLUSTERED 
(
	[Expense_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_TLBoard_Expense_Types] ADD  CONSTRAINT [DF_t_TLBoard_Expense_Types_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO

ALTER TABLE [dbo].[t_TLBoard_Expense_Types] ADD  CONSTRAINT [DF_t_TLBoard_Expense_Types_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO

*/

CREATE Proc p_TLBoard_Get_Expense_Types
As

Select		* 
From		t_TLBoard_Expense_Types
Where		[Is_Active] = 1 And [Is_Visible] = 1
Order By	Sort_Order ASC

GO
