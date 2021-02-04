USE [DashboardTimeLine]
GO
SET IDENTITY_INSERT [dbo].[t_TLBoard_Supplier_Types] ON 

INSERT [dbo].[t_TLBoard_Supplier_Types] ([Supplier_Type_Id], [Type_Name], [Type_Code], [Description], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active], [Is_Visible]) VALUES (1, N'General', N'General', N'General', 1, NULL, 1, CAST(N'2021-01-30T11:36:46.943' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[t_TLBoard_Supplier_Types] OFF
GO
