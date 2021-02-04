USE [DashboardTimeLine]
GO
SET IDENTITY_INSERT [dbo].[t_TLBoard_Expense_Types] ON 

INSERT [dbo].[t_TLBoard_Expense_Types] ([Expense_Type_Id], [Expense_Type_Name], [Description], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active], [Is_Visible], [Sort_Order]) VALUES (1, N'General', N'General', 1, CAST(N'2021-02-01T18:56:00.393' AS DateTime), 1, CAST(N'2021-02-01T18:56:00.393' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[t_TLBoard_Expense_Types] OFF
GO
