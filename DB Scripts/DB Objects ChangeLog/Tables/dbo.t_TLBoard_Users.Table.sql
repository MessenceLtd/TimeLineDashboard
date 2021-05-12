SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Encrypted_Password] [varchar](120) NOT NULL,
	[Encryption_Random_Salt] [varchar](50) NOT NULL,
	[App_Permission_Type_Id] [tinyint] NOT NULL,
	[First_Name] [nvarchar](60) NULL,
	[Middle_Name] [nvarchar](60) NULL,
	[Last_Name] [nvarchar](60) NULL,
	[Email] [varchar](100) NOT NULL,
	[Country_Id] [smallint] NOT NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](80) NULL,
	[Address] [nvarchar](120) NULL,
	[ZipCode] [varchar](10) NULL,
	[Default_Currency_Id] [tinyint] NULL,
	[Mobile_Phone] [varchar](20) NULL,
	[Additional_Phone_Number] [varchar](20) NULL,
	[Birth_Date] [datetime] NULL,
	[Gender] [tinyint] NOT NULL,
	[Registration_DateTime_UTC] [datetime] NULL,
	[Heard_About_Application_From] [nvarchar](500) NULL,
	[Our_Administrative_Side_Notes] [nvarchar](500) NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Is_Deleted] [bit] NOT NULL,
	[Deleted_By_User_Id] [int] NULL,
	[Deleted_DateTime_UTC] [datetime] NULL,
	[Delete_Reason] [nvarchar](500) NULL,
	[Is_Active] [bit] NOT NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Azure_Container_Ref] [nvarchar](60) NULL,
 CONSTRAINT [PK_t_TLBoard_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [t_TLBoard_Users] ADD  CONSTRAINT [DF_t_TLBoard_Users_Is_Deleted]  DEFAULT ((0)) FOR [Is_Deleted]
GO
ALTER TABLE [t_TLBoard_Users] ADD  CONSTRAINT [DF_t_TLBoard_Users_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
