SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_General_Documents](
	[General_Document_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[General_Document_Type] [smallint] NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](1500) NULL,
	[Document_Creation_DateTime] [datetime] NULL,
	[Sent_By_Entity_Name] [nvarchar](100) NULL,
	[Sent_By_Entity_Country_Id] [smallint] NULL,
	[Sent_By_Entity_State_Id] [smallint] NULL,
	[Sent_By_Entity_City] [nvarchar](100) NULL,
	[Sent_By_Entity_Address] [nvarchar](150) NULL,
	[Sent_By_Entity_ZipCode] [nvarchar](20) NULL,
	[Sent_By_Entity_DateTime] [datetime] NULL,
	[Sent_By_Entity_Email_Address] [nvarchar](100) NULL,
	[Sent_To_Entity_Name] [nvarchar](100) NULL,
	[Sent_To_Entity_Country_Id] [smallint] NULL,
	[Sent_To_Entity_State_Id] [smallint] NULL,
	[Sent_To_Entity_City] [nvarchar](100) NULL,
	[Sent_To_Entity_Address] [nvarchar](150) NULL,
	[Sent_To_Entity_ZipCode] [nvarchar](20) NULL,
	[Sent_To_Entity_Email_Address] [nvarchar](150) NULL,
	[Recieved_Document_DateTime] [datetime] NULL,
	[Recieved_In_Country_Id] [smallint] NULL,
	[Recieved_In_State_Id] [smallint] NULL,
	[Recieved_In_City] [nvarchar](100) NULL,
	[Recieved_In_Address] [nvarchar](150) NULL,
	[Recieved_In_ZipCode] [nvarchar](20) NULL,
	[Recieved_In_Email_Address] [nvarchar](100) NULL,
	[User_Comments] [nvarchar](500) NULL,
	[Recieved_By_User_Id] [int] NULL,
	[Recieved_DateTime] [datetime] NULL,
	[Original_File_Name] [nvarchar](255) NULL,
	[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
	[Is_Visible_To_Anonymous_Users] [bit] NULL,
	[Is_Available_For_Download_For_Anonymous_Users] [bit] NULL,
	[Is_Visible_To_Followers_Users] [bit] NULL,
	[Is_Available_For_Download_For_Followers_Users] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NOT NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_General_Documents] PRIMARY KEY CLUSTERED 
(
	[General_Document_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_General_Documents] ADD  CONSTRAINT [DF_t_TLBoard_General_Documents_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_General_Documents] ADD  CONSTRAINT [DF_t_TLBoard_General_Documents_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [t_TLBoard_General_Documents] ADD  CONSTRAINT [DF_t_TLBoard_General_Documents_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [t_TLBoard_General_Documents] ADD  CONSTRAINT [DF_t_TLBoard_General_Documents_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
