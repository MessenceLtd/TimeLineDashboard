USE [DashboardTimeLine]
GO
/****** Object:  Table [dbo].[t_TLBoard_AppExceptions]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_AppExceptions](
	[App_Error_Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](200) NULL,
	[Exception] [nvarchar](500) NULL,
	[InnerException] [nvarchar](500) NULL,
	[Error_TimeStamp_UTC] [datetime] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_t_TLBoard_AppExceptions] PRIMARY KEY CLUSTERED 
(
	[App_Error_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Bank_Accounts]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Bank_Accounts](
	[Bank_Account_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Bank_Name] [nvarchar](40) NULL,
	[Account_Number] [varchar](10) NULL,
	[Branch_Number] [varchar](10) NULL,
	[Branch_Name] [nvarchar](40) NULL,
	[Opened_Account_DateTime] [datetime] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts] PRIMARY KEY CLUSTERED 
(
	[Bank_Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements]    Script Date: 19/01/2021 21:02:59 ******/
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
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts_Credit_Cards_Statements] PRIMARY KEY CLUSTERED 
(
	[Bank_Account_Credit_Card_Statement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions](
	[Credit_Card_Statement_Transaction_Id] [bigint] NOT NULL,
	[Bank_Account_Credit_Card_Statement_Id] [int] NULL,
	[Transaction_Date] [datetime] NULL,
	[Business_Name] [nvarchar](50) NULL,
	[Transaction_Amount] [decimal](10, 2) NULL,
	[Transaction_Amount_Currency_Id] [tinyint] NULL,
	[Transaction_Actual_Payment_Amount] [decimal](10, 2) NULL,
	[Transaction_Actual_Payment_Amount_Currency_Id] [tinyint] NULL,
	[Description] [nvarchar](80) NULL,
	[Has_Been_Actually_Charged_In_Statement] [bit] NULL,
	[Total_Charged_In_Statement] [decimal](10, 2) NULL,
	[User_Description] [nvarchar](300) NULL,
	[User_Comments] [nvarchar](300) NULL,
	[Transaction_Sort_Order_View] [smallint] NULL,
	[Is_Visible] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] PRIMARY KEY CLUSTERED 
(
	[Credit_Card_Statement_Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Bank_Accounts_Transactions]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Bank_Accounts_Transactions](
	[Bank_Account_Transaction_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Bank_Account_Id] [int] NULL,
	[Transaction_Account_Balance] [decimal](16, 2) NULL,
	[Transaction_Value_DateTime] [datetime] NULL,
	[Positive_Amount_Entered] [decimal](16, 2) NULL,
	[Negative_Amount_Paid] [decimal](16, 2) NULL,
	[Transaction_Actual_DateTime] [datetime] NOT NULL,
	[Reference_Number] [varchar](15) NULL,
	[Transaction_Bank_Description] [nvarchar](40) NULL,
	[Transaction_Bank_Inner_Reference_Code] [varchar](10) NULL,
	[Transaction_User_Description] [nvarchar](200) NULL,
	[Transaction_User_Comments] [nvarchar](200) NULL,
	[Transaction_SortOrderView] [smallint] NULL,
	[Is_Visible] [bit] NULL,
	[Is_Credit_Card_Statement_Transaction] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Bank_Accounts_Transactions] PRIMARY KEY CLUSTERED 
(
	[Bank_Account_Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Browers_User_Agents]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Browers_User_Agents](
	[User_Browser_Agent_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Agent] [nvarchar](200) NULL,
	[Record_Created_TimeStamp_UTC] [datetime] NULL,
	[Is_Mobile] [bit] NULL,
	[Is_Desktop] [bit] NULL,
 CONSTRAINT [PK_t_TLBoard_Browers_User_Agents] PRIMARY KEY CLUSTERED 
(
	[User_Browser_Agent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Clients]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Clients](
	[Client_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Company_Name] [nvarchar](150) NULL,
	[Website_URL] [nvarchar](150) NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Telephone] [varchar](40) NULL,
	[Mobile_Phone] [varchar](40) NULL,
	[Client_Type_Id] [smallint] NULL,
	[Client_Tax_Reference_Number] [nvarchar](20) NULL,
	[Main_Contact_FullName] [nvarchar](100) NULL,
	[Main_Contact_Email_Address] [nvarchar](100) NULL,
	[Main_Contact_Phone_Number] [nvarchar](50) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Clients] PRIMARY KEY CLUSTERED 
(
	[Client_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Continents]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Continents](
	[Continent_Id] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_t_TLBoard_Continents] PRIMARY KEY CLUSTERED 
(
	[Continent_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Countries]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Countries](
	[Country_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Country_Code] [varchar](10) NOT NULL,
	[Country_English_Name] [nvarchar](80) NOT NULL,
	[Country_Native_Name] [nvarchar](80) NULL,
	[Continent_Id] [tinyint] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
 CONSTRAINT [PK_t_TLBoard_Countries] PRIMARY KEY CLUSTERED 
(
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Countries_Banned]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Countries_Banned](
	[Country_Id] [smallint] NOT NULL,
	[Name] [varchar](50) NULL,
	[BanReason] [varchar](500) NULL,
	[BanDate] [datetime] NULL,
 CONSTRAINT [PK_Countries_Banned] PRIMARY KEY CLUSTERED 
(
	[Country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses](
	[Credit_Card_Tranasction_Connection_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[Credit_Card_Statement_Transaction_Id] [bigint] NOT NULL,
	[Is_Supplier_Expense] [bit] NULL,
	[Expense_Record_Id] [int] NULL,
	[Is_Invoice_Income] [bit] NULL,
	[Invoice_Record_Id] [int] NULL,
	[Is_Visible] [bit] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Delete_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses] PRIMARY KEY CLUSTERED 
(
	[Credit_Card_Tranasction_Connection_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Currencies]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Currencies](
	[Currency_Id] [tinyint] NOT NULL,
	[Currency_Name] [nvarchar](50) NULL,
	[Currency_Code] [varchar](10) NULL,
	[Currency_Symbol] [nvarchar](10) NULL,
	[Wiki_Daily_Trades_Stats_2019] [decimal](10, 3) NULL,
 CONSTRAINT [PK_t_TLBoard_Currencies] PRIMARY KEY CLUSTERED 
(
	[Currency_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Expenses]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Expenses](
	[Expense_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Supplier_Id] [int] NULL,
	[Currency_Id] [int] NULL,
	[Total_Without_Vat] [decimal](18, 3) NULL,
	[Total_Vat] [decimal](18, 3) NULL,
	[Vat_Percentage] [decimal](6, 2) NULL,
	[Total_Amount] [decimal](18, 3) NULL,
	[Creation_DateTime] [datetime] NULL,
	[Creation_DateTime_UTC] [datetime] NULL,
	[Invoiced_On_User_Location_Id] [int] NULL,
	[Invoiced_To_CompanyName] [nvarchar](150) NULL,
	[Invoiced_To_PersonName] [nvarchar](100) NULL,
	[Invoiced_To_PhoneNumber] [nvarchar](50) NULL,
	[Invoiced_To_Address] [nvarchar](50) NULL,
	[Invoice_Number] [int] NULL,
	[Invoice_Reference_Number] [nvarchar](50) NULL,
	[Invoice_Type_Id] [tinyint] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[User_Description] [nvarchar](500) NULL,
	[User_Comments] [nvarchar](500) NULL,
	[Original_File_Name] [nvarchar](255) NULL,
	[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
 CONSTRAINT [PK_t_TLBoard_Expenses] PRIMARY KEY CLUSTERED 
(
	[Expense_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_General_Documents]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_General_Documents](
	[General_Document_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Document_Type] [smallint] NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Document_Creation_DateTime] [datetime] NULL,
	[Sent_By_Entity_Name] [nvarchar](100) NULL,
	[Sent_To_Address] [nvarchar](100) NULL,
	[Recieved_Document_DateTime] [datetime] NULL,
	[Recieved_In_Country_Id] [smallint] NULL,
	[Recieved_In_State_Id] [smallint] NULL,
	[Recieved_In_City] [nvarchar](100) NULL,
	[Recieved_In_Address] [nvarchar](150) NULL,
	[User_Comments] [nvarchar](500) NULL,
	[Recieved_By_User_Id] [int] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_General_Documents] PRIMARY KEY CLUSTERED 
(
	[General_Document_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Invoices]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Invoices](
	[Invoice_Record_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Client_Id] [int] NULL,
	[Currency_Id] [int] NULL,
	[Total_Without_Vat] [decimal](18, 3) NULL,
	[Total_Vat] [decimal](18, 3) NULL,
	[Vat_Percentage] [decimal](6, 2) NULL,
	[Total_Amount] [decimal](18, 3) NULL,
	[Creation_DateTime] [datetime] NULL,
	[Creation_DateTime_UTC] [datetime] NULL,
	[Invoiced_On_User_Location_Id] [int] NULL,
	[Invoiced_To_CompanyName] [nvarchar](150) NULL,
	[Invoiced_To_PhoneNumber] [nvarchar](50) NULL,
	[Invoiced_To_Address] [nvarchar](50) NULL,
	[Invoice_Number] [int] NULL,
	[Invoice_Reference_Number] [nvarchar](50) NULL,
	[Invoice_Type_Id] [tinyint] NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[User_Description] [nvarchar](500) NULL,
	[User_Comments] [nvarchar](500) NULL,
	[Original_File_Name] [nvarchar](255) NULL,
	[Azure_Block_Blob_Reference] [nvarchar](255) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Delete_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_tbl_Invoices] PRIMARY KEY CLUSTERED 
(
	[Invoice_Record_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Login_Attempts]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Login_Attempts](
	[Login_Attempt_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Session_Id] [varchar](30) NULL,
	[IP_Address] [varchar](40) NULL,
	[User_Browser_Agent_Id] [int] NULL,
	[Login_Attempt_TimeStamp_UTC] [datetime] NULL,
	[Successfully_Logged_In] [bit] NULL,
	[User_Id] [int] NULL,
 CONSTRAINT [PK_t_TLBoard_Login_Attempts] PRIMARY KEY CLUSTERED 
(
	[Login_Attempt_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_States]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_States](
	[State_Id] [smallint] NOT NULL,
	[State_Code] [varchar](10) NULL,
	[State_Name] [nvarchar](100) NULL,
	[Country_Id] [smallint] NULL,
 CONSTRAINT [PK_t_TLBoard_States] PRIMARY KEY CLUSTERED 
(
	[State_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Suppliers]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Suppliers](
	[Supplier_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Company_Name] [nvarchar](100) NULL,
	[Website_URL] [nvarchar](150) NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Telephone] [varchar](40) NULL,
	[Mobile_Phone] [varchar](40) NULL,
	[Supplier_Type_Id] [smallint] NULL,
	[Supplier_Tax_Reference_Number] [nvarchar](20) NULL,
	[Main_Contact_FullName] [nvarchar](100) NULL,
	[Main_Contact_Email_Address] [nvarchar](100) NULL,
	[Main_Contact_Phone_Number] [nvarchar](50) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Supplier_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Suppliers_Contacts]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Suppliers_Contacts](
	[Supplier_Contact_Id] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Id] [int] NULL,
	[First_Name] [nvarchar](50) NULL,
	[Middle_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Email_Address] [nvarchar](100) NULL,
	[Mobile_Phone] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Telephone] [varchar](40) NULL,
	[User_Description] [nvarchar](500) NULL,
	[User_Comments] [nvarchar](500) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Suppliers_Contacts] PRIMARY KEY CLUSTERED 
(
	[Supplier_Contact_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Suppliers_Contracts_Agreements]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Suppliers_Contracts_Agreements](
	[Supplier_Contract_Agreement_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Supplier_Id] [int] NULL,
	[Agreement_Contract_Name] [nvarchar](100) NULL,
	[Agreement_Contract_Title] [nvarchar](150) NULL,
	[Description] [nvarchar](500) NULL,
	[Signed_On_DateTime] [datetime] NULL,
	[Signed_In_Country_Id] [nvarchar](100) NULL,
	[Signed_In_State_Id] [smallint] NULL,
	[Signed_In_City] [nvarchar](100) NULL,
	[Signed_In_Address] [nvarchar](150) NULL,
	[Signed_In_ZipCode] [varchar](10) NULL,
	[Has_Sent_Agreement_Contract_By_Email_Address] [bit] NULL,
	[Email_Recipient] [varchar](100) NULL,
	[Email_Recipient_Full_Name] [varchar](100) NULL,
	[Email_Recipient_Mobile_Phone] [varchar](100) NULL,
	[Email_Subject] [varchar](100) NULL,
	[Email_Submition_DateTime_UTC] [varchar](100) NULL,
	[Email_Sent_From_Email_Address] [varchar](100) NULL,
	[Comments] [nvarchar](100) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Suppliers_Contracts_Agreements] PRIMARY KEY CLUSTERED 
(
	[Supplier_Contract_Agreement_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Users]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Users](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[EncryptedPassword] [varchar](120) NULL,
	[EncryptionRandomSalt] [varchar](50) NULL,
	[First_Name] [nvarchar](60) NULL,
	[Middle_Name] [nvarchar](60) NULL,
	[Last_Name] [nvarchar](60) NULL,
	[User_Email] [varchar](100) NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](80) NULL,
	[Address] [nvarchar](120) NULL,
	[ZipCode] [varchar](10) NULL,
	[Mobile_Phone] [varchar](20) NULL,
	[Additional_Phone_Number] [varchar](20) NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Is_Deleted] [bit] NULL,
	[Deleted_By_User_Id] [int] NULL,
	[Deleted_DateTime_UTC] [datetime] NULL,
	[Delete_Reason] [nvarchar](500) NULL,
 CONSTRAINT [PK_t_TLBoard_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Users_Apartments]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Users_Apartments](
	[User_Apartment_Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Country_Id] [smallint] NULL,
	[State_Id] [smallint] NULL,
	[City] [nvarchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[ZipCode] [varchar](10) NULL,
	[Telephone] [varchar](40) NULL,
	[Lived_In_Apartment_From_DateTime] [datetime] NULL,
	[Lived_In_Apartment_To_DateTime] [datetime] NULL,
	[Lived_Alone] [bit] NULL,
	[Average_Monthly_Rent_Price_Amount] [decimal](12, 3) NULL,
	[Average_Monthly_Rent_Price_Currency_Id] [decimal](12, 3) NULL,
	[House_Owner_Full_Name] [nvarchar](100) NULL,
	[House_Owner_Mobile_Phone] [varchar](20) NULL,
	[House_Owner_Email_Address] [nvarchar](100) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_User_Apartments] PRIMARY KEY CLUSTERED 
(
	[User_Apartment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_TLBoard_Users_Love_Relationships]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_TLBoard_Users_Love_Relationships](
	[Love_Relationship_Id] [int] NOT NULL,
	[User_Id] [int] NULL,
	[Partner_Full_Name] [nvarchar](100) NULL,
	[Partner_Mobile_Number] [varchar](20) NULL,
	[Had_Sexual_Intercourse] [bit] NULL,
	[Relationship_Start_DateTime] [datetime] NULL,
	[Relationship_End_DateTime] [datetime] NULL,
	[Relationship_Type_Id] [smallint] NULL,
	[Relationship_Main_Country_Id] [smallint] NULL,
	[Relationship_Main_State_Id] [smallint] NULL,
	[Relationship_Main_City] [nvarchar](100) NULL,
	[Relationship_Main_Address] [nvarchar](150) NULL,
	[Relationship_Main_ZipCode] [varchar](10) NULL,
	[Record_Created_By_User_Id] [int] NULL,
	[Record_Creation_DateTime_UTC] [datetime] NULL,
	[Record_Last_Updated_By_User_Id] [int] NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NULL,
	[Is_Active] [bit] NULL,
	[Active_Last_Updated_dateTime_UTC] [datetime] NULL,
	[Active_Last_Updated_By_User_Id] [int] NULL,
	[Active_Last_Updated_Comments] [nvarchar](500) NULL,
	[Is_Deleted] [bit] NULL,
	[Record_Deleted_By_User_Id] [int] NULL,
	[Record_Deleted_DateTime_UTC] [datetime] NULL,
 CONSTRAINT [PK_t_TLBoard_Users_Love_Relationships] PRIMARY KEY CLUSTERED 
(
	[Love_Relationship_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[t_TLBoard_Continents] ([Continent_Id], [Name]) VALUES (1, N'Africa')
GO
INSERT [dbo].[t_TLBoard_Continents] ([Continent_Id], [Name]) VALUES (2, N'Antarctica')
GO
INSERT [dbo].[t_TLBoard_Continents] ([Continent_Id], [Name]) VALUES (3, N'Asia')
GO
INSERT [dbo].[t_TLBoard_Continents] ([Continent_Id], [Name]) VALUES (4, N'Australia')
GO
INSERT [dbo].[t_TLBoard_Continents] ([Continent_Id], [Name]) VALUES (5, N'Europe')
GO
INSERT [dbo].[t_TLBoard_Continents] ([Continent_Id], [Name]) VALUES (6, N'North America')
GO
INSERT [dbo].[t_TLBoard_Continents] ([Continent_Id], [Name]) VALUES (7, N'South America')
GO
SET IDENTITY_INSERT [dbo].[t_TLBoard_Countries] ON 
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (1, N'AF', N'Afghanistan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (2, N'AX', N'Åland Islands', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (3, N'AL', N'Albania', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (4, N'DZ', N'Algeria', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (5, N'AS', N'American Samoa', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (6, N'AD', N'Andorra', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (7, N'AO', N'Angola', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (8, N'AI', N'Anguilla', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (9, N'AQ', N'Antarctica', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (10, N'AG', N'Antigua and Barbuda', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (11, N'AR', N'Argentina', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (12, N'AM', N'Armenia', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (13, N'AW', N'Aruba', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (14, N'AU', N'Australia', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (15, N'AT', N'Austria', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (16, N'AZ', N'Azerbaijan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (17, N'BS', N'Bahamas', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (18, N'BH', N'Bahrain', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (19, N'BD', N'Bangladesh', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (20, N'BB', N'Barbados', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (21, N'BY', N'Belarus', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (22, N'BE', N'Belgium', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (23, N'BZ', N'Belize', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (24, N'BJ', N'Benin', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (25, N'BM', N'Bermuda', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (26, N'BT', N'Bhutan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (27, N'BO', N'Bolivia (Plurinational State of)', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (28, N'BQ', N'Bonaire, Sint Eustatius and Saba', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (29, N'BA', N'Bosnia and Herzegovina', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (30, N'BW', N'Botswana', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (31, N'BV', N'Bouvet Island', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (32, N'BR', N'Brazil', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (33, N'IO', N'British Indian Ocean Territory', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (34, N'BN', N'Brunei Darussalam', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (35, N'BG', N'Bulgaria', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (36, N'BF', N'Burkina Faso', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (37, N'BI', N'Burundi', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (38, N'CV', N'Cabo Verde', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (39, N'KH', N'Cambodia', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (40, N'CM', N'Cameroon', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (41, N'CA', N'Canada', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (42, N'KY', N'Cayman Islands', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (43, N'CF', N'Central African Republic', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (44, N'TD', N'Chad', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (45, N'CL', N'Chile', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (46, N'CN', N'China', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (47, N'CX', N'Christmas Island', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (48, N'CC', N'Cocos (Keeling) Islands', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (49, N'CO', N'Colombia', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (50, N'KM', N'Comoros', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (51, N'CG', N'Congo', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (52, N'CD', N'Congo, Democratic Republic of the', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (53, N'CK', N'Cook Islands', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (54, N'CR', N'Costa Rica', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (55, N'CI', N'Côte d''Ivoire', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (56, N'HR', N'Croatia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (57, N'CU', N'Cuba', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (58, N'CW', N'Curaçao', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (59, N'CY', N'Cyprus', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (60, N'CZ', N'Czechia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (61, N'DK', N'Denmark', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (62, N'DJ', N'Djibouti', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (63, N'DM', N'Dominica', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (64, N'DO', N'Dominican Republic', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (65, N'EC', N'Ecuador', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (66, N'EG', N'Egypt', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (67, N'SV', N'El Salvador', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (68, N'GQ', N'Equatorial Guinea', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (69, N'ER', N'Eritrea', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (70, N'EE', N'Estonia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (71, N'SZ', N'Eswatini', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (72, N'ET', N'Ethiopia', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (73, N'FK', N'Falkland Islands (Malvinas)', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (74, N'FO', N'Faroe Islands', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (75, N'FJ', N'Fiji', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (76, N'FI', N'Finland', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (77, N'FR', N'France', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (78, N'GF', N'French Guiana', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (79, N'PF', N'French Polynesia', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (80, N'TF', N'French Southern Territories', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (81, N'GA', N'Gabon', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (82, N'GM', N'Gambia', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (83, N'GE', N'Georgia', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (84, N'DE', N'Germany', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (85, N'GH', N'Ghana', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (86, N'GI', N'Gibraltar', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (87, N'GR', N'Greece', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (88, N'GL', N'Greenland', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (89, N'GD', N'Grenada', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (90, N'GP', N'Guadeloupe', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (91, N'GU', N'Guam', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (92, N'GT', N'Guatemala', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (93, N'GG', N'Guernsey', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (94, N'GN', N'Guinea', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (95, N'GW', N'Guinea-Bissau', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (96, N'GY', N'Guyana', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (97, N'HT', N'Haiti', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (98, N'HM', N'Heard Island and McDonald Islands', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (99, N'VA', N'Holy See', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (100, N'HN', N'Honduras', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (101, N'HK', N'Hong Kong', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (102, N'HU', N'Hungary', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (103, N'IS', N'Iceland', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (104, N'IN', N'India', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (105, N'ID', N'Indonesia', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (106, N'IR', N'Iran (Islamic Republic of)', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (107, N'IQ', N'Iraq', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (108, N'IE', N'Ireland', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (109, N'IM', N'Isle of Man', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (110, N'IL', N'Israel', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (111, N'IT', N'Italy', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (112, N'JM', N'Jamaica', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (113, N'JP', N'Japan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (114, N'JE', N'Jersey', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (115, N'JO', N'Jordan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (116, N'KZ', N'Kazakhstan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (117, N'KE', N'Kenya', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (118, N'KI', N'Kiribati', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (119, N'KP', N'Korea (Democratic People''s Republic of)', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (120, N'KR', N'Korea, Republic of', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (121, N'KW', N'Kuwait', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (122, N'KG', N'Kyrgyzstan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (123, N'LA', N'Lao People''s Democratic Republic', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (124, N'LV', N'Latvia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (125, N'LB', N'Lebanon', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (126, N'LS', N'Lesotho', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (127, N'LR', N'Liberia', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (128, N'LY', N'Libya', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (129, N'LI', N'Liechtenstein', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (130, N'LT', N'Lithuania', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (131, N'LU', N'Luxembourg', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (132, N'MO', N'Macao', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (133, N'MG', N'Madagascar', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (134, N'MW', N'Malawi', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (135, N'MY', N'Malaysia', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (136, N'MV', N'Maldives', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (137, N'ML', N'Mali', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (138, N'MT', N'Malta', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (139, N'MH', N'Marshall Islands', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (140, N'MQ', N'Martinique', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (141, N'MR', N'Mauritania', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (142, N'MU', N'Mauritius', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (143, N'YT', N'Mayotte', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (144, N'MX', N'Mexico', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (145, N'FM', N'Micronesia (Federated States of)', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (146, N'MD', N'Moldova, Republic of', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (147, N'MC', N'Monaco', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (148, N'MN', N'Mongolia', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (149, N'ME', N'Montenegro', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (150, N'MS', N'Montserrat', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (151, N'MA', N'Morocco', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (152, N'MZ', N'Mozambique', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (153, N'MM', N'Myanmar', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (154, N'NA', N'Namibia', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (155, N'NR', N'Nauru', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (156, N'NP', N'Nepal', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (157, N'NL', N'Netherlands[note 1]', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (158, N'NC', N'New Caledonia', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (159, N'NZ', N'New Zealand', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (160, N'NI', N'Nicaragua', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (161, N'NE', N'Niger', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (162, N'NG', N'Nigeria', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (163, N'NU', N'Niue', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (164, N'NF', N'Norfolk Island', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (165, N'MK', N'North Macedonia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (166, N'MP', N'Northern Mariana Islands', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (167, N'NO', N'Norway', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (168, N'OM', N'Oman', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (169, N'PK', N'Pakistan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (170, N'PW', N'Palau', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (171, N'PS', N'Palestine, State of', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (172, N'PA', N'Panama', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (173, N'PG', N'Papua New Guinea', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (174, N'PY', N'Paraguay', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (175, N'PE', N'Peru', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (176, N'PH', N'Philippines', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (177, N'PN', N'Pitcairn', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (178, N'PL', N'Poland', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (179, N'PT', N'Portugal', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (180, N'PR', N'Puerto Rico', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (181, N'QA', N'Qatar', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (182, N'RE', N'Réunion', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (183, N'RO', N'Romania', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (184, N'RU', N'Russian Federation', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (185, N'RW', N'Rwanda', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (186, N'BL', N'Saint Barthélemy', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (187, N'SH', N'Saint Helena, Ascension and Tristan da Cunha', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (188, N'KN', N'Saint Kitts and Nevis', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (189, N'LC', N'Saint Lucia', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (190, N'MF', N'Saint Martin (French part)', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (191, N'PM', N'Saint Pierre and Miquelon', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (192, N'VC', N'Saint Vincent and the Grenadines', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (193, N'WS', N'Samoa', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (194, N'SM', N'San Marino', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (195, N'ST', N'Sao Tome and Principe', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (196, N'SA', N'Saudi Arabia', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (197, N'SN', N'Senegal', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (198, N'RS', N'Serbia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (199, N'SC', N'Seychelles', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (200, N'SL', N'Sierra Leone', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (201, N'SG', N'Singapore', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (202, N'SX', N'Sint Maarten (Dutch part)', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (203, N'SK', N'Slovakia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (204, N'SI', N'Slovenia', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (205, N'SB', N'Solomon Islands', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (206, N'SO', N'Somalia', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (207, N'ZA', N'South Africa', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (208, N'GS', N'South Georgia and the South Sandwich Islands', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (209, N'SS', N'South Sudan', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (210, N'ES', N'Spain', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (211, N'LK', N'Sri Lanka', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (212, N'SD', N'Sudan', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (213, N'SR', N'Suriname', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (214, N'SJ', N'Svalbard and Jan Mayen', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (215, N'SE', N'Sweden', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (216, N'CH', N'Switzerland', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (217, N'SY', N'Syrian Arab Republic', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (218, N'TW', N'Taiwan, Province of China [note 2]', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (219, N'TJ', N'Tajikistan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (220, N'TZ', N'Tanzania, United Republic of', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (221, N'TH', N'Thailand', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (222, N'TL', N'Timor-Leste', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (223, N'TG', N'Togo', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (224, N'TK', N'Tokelau', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (225, N'TO', N'Tonga', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (226, N'TT', N'Trinidad and Tobago', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (227, N'TN', N'Tunisia', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (228, N'TR', N'Turkey', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (229, N'TM', N'Turkmenistan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (230, N'TC', N'Turks and Caicos Islands', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (231, N'TV', N'Tuvalu', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (232, N'UG', N'Uganda', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (233, N'UA', N'Ukraine', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (234, N'AE', N'United Arab Emirates', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (235, N'GB', N'United Kingdom of Great Britain and Northern Ireland', NULL, 5, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (236, N'UM', N'United States Minor Outlying Islands', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (237, N'US', N'United States of America', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (238, N'UY', N'Uruguay', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (239, N'UZ', N'Uzbekistan', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (240, N'VU', N'Vanuatu', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (241, N'VE', N'Venezuela (Bolivarian Republic of)', NULL, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (242, N'VN', N'Viet Nam', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (243, N'VG', N'Virgin Islands (British)', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (244, N'VI', N'Virgin Islands (U.S.)', NULL, 6, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (245, N'WF', N'Wallis and Futuna', NULL, 4, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (246, N'EH', N'Western Sahara', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (247, N'YE', N'Yemen', NULL, 3, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (248, N'ZM', N'Zambia', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[t_TLBoard_Countries] ([Country_Id], [Country_Code], [Country_English_Name], [Country_Native_Name], [Continent_Id], [Record_Created_By_User_Id], [Record_Creation_DateTime_UTC], [Record_Last_Updated_By_User_Id], [Record_Last_Updated_DateTime_UTC], [Is_Active]) VALUES (249, N'ZW', N'Zimbabwe', NULL, 1, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[t_TLBoard_Countries] OFF
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (106, N'Iran', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (107, N'Iraq', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (125, N'Lebanon', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (128, N'Libya', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (206, N'Somalia', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (209, N'South Sudan', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (212, N'Sudan', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (217, N'Syria', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Countries_Banned] ([Country_Id], [Name], [BanReason], [BanDate]) VALUES (247, N'Yemen', N'Homeland Security lists these countries as Iran, Iraq, Libya, Somalia, Sudan, Syria, and Yemen. More than 700 travelers were detained, and up to 60,000 visas were "provisionally revoked". Signed by: Donald Trump on 27 January 2017', CAST(N'2017-01-27T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (1, N'United States dollar', N'USD', N'$', CAST(0.883 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (2, N'Euro', N'EUR', N'€', CAST(0.323 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (3, N'Japanese yen', N'JPY', N'¥', CAST(0.168 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (4, N'Pound sterling', N'GBP', N'£', CAST(0.128 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (5, N'Australian dollar', N'AUD', N'A$', CAST(0.068 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (6, N'Canadian dollar', N'CAD', N'C$', CAST(0.050 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (7, N'Swiss franc', N'CHF', N'CHF', CAST(0.050 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (8, N'Renminbi', N'CNY', N'元', CAST(0.043 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (9, N'Hong Kong dollar', N'HKD', N'HK$', CAST(0.035 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (10, N'New Zealand dollar', N'NZD', N'NZ$', CAST(0.021 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (11, N'Swedish krona', N'SEK', N'kr', CAST(0.020 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (12, N'South Korean won', N'KRW', N'₩', CAST(0.020 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (13, N'Singapore dollar', N'SGD', N'S$', CAST(0.018 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (14, N'Norwegian krone', N'NOK', N'kr', CAST(0.018 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (15, N'Mexican peso', N'MXN', N'$', CAST(0.017 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (16, N'Indian rupee', N'INR', N'₹', CAST(0.017 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (17, N'Russian ruble', N'RUB', N'₽', CAST(0.011 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (18, N'South African rand', N'ZAR', N'R', CAST(0.011 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (19, N'Turkish lira', N'TRY', N'₺', CAST(0.011 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (20, N'Brazilian real', N'BRL', N'R$', CAST(0.011 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (21, N'New Taiwan dollar', N'TWD', N'NT$', CAST(0.009 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (22, N'Danish krone', N'DKK', N'kr', CAST(0.006 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (23, N'Polish złoty', N'PLN', N'zł', CAST(0.006 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (24, N'Thai baht', N'THB', N'฿', CAST(0.005 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (25, N'Indonesian rupiah', N'IDR', N'Rp', CAST(0.004 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (26, N'Hungarian forint', N'HUF', N'Ft', CAST(0.004 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (27, N'Czech koruna', N'CZK', N'Kč', CAST(0.004 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (28, N'Israeli new shekel', N'ILS', N'₪', CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (29, N'Chilean peso', N'CLP', N'CLP$', CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (30, N'Philippine peso', N'PHP', N'₱', CAST(0.003 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (31, N'UAE dirham', N'AED', N'د.إ', CAST(0.002 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (32, N'Colombian peso', N'COP', N'COL$', CAST(0.002 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (33, N'Saudi riyal', N'SAR', N'﷼', CAST(0.002 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (34, N'Malaysian ringgit', N'MYR', N'RM', CAST(0.001 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_Currencies] ([Currency_Id], [Currency_Name], [Currency_Code], [Currency_Symbol], [Wiki_Daily_Trades_Stats_2019]) VALUES (35, N'Romanian leu', N'RON', N'L', CAST(0.001 AS Decimal(10, 3)))
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (1, N'AL', N'Alabama', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (2, N'AK', N'Alaska', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (3, N'AB', N'Alberta (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (4, N'AS', N'American Samoa (US territory/association)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (5, N'AZ', N'Arizona', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (6, N'AR', N'Arkansas', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (7, N'BC', N'British Columbia (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (8, N'CA', N'California', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (9, N'CO', N'Colorado', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (10, N'CT', N'Connecticut', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (11, N'DE', N'Delaware', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (12, N'DC', N'District of Columbia', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (13, N'FL', N'Florida', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (14, N'GA', N'Georgia', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (15, N'GU', N'Guam (US territory/association)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (16, N'HI', N'Hawaii', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (17, N'ID', N'Idaho', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (18, N'IL', N'Illinois', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (19, N'IN', N'Indiana', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (20, N'IA', N'Iowa', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (21, N'KS', N'Kansas', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (22, N'KY', N'Kentucky', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (23, N'LA', N'Louisiana', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (24, N'ME', N'Maine', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (25, N'MB', N'Manitoba (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (26, N'MH', N'Marshall Islands (US territory/association)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (27, N'MD', N'Maryland', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (28, N'MA', N'Massachusetts', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (29, N'MX', N'Mexico', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (30, N'MI', N'Michigan', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (31, N'FM', N'Micronesia, Federated States of (US territory/association)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (35, N'MN', N'Minnesota', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (36, N'MS', N'Mississippi', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (37, N'MO', N'Missouri', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (38, N'MT', N'Montana', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (39, N'NE', N'Nebraska', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (40, N'NV', N'Nevada', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (41, N'NB', N'New Brunswick (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (42, N'NH', N'New Hampshire', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (43, N'NJ', N'New Jersey', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (44, N'NM', N'New Mexico', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (45, N'NY', N'New York', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (46, N'NF', N'Newfoundland (including Labrador) (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (47, N'NC', N'North Carolina', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (48, N'ND', N'North Dakota', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (49, N'MP', N'Northern Mariana Islands (US territory/association)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (50, N'NT', N'Northwest Territory (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (51, N'NS', N'Nova Scotia (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (52, N'NU', N'Nunavut (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (53, N'OH', N'Ohio', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (54, N'OK', N'Oklahoma', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (55, N'ON', N'Ontario (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (56, N'OR', N'Oregon', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (57, N'PW', N'Palau (US territory/association)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (58, N'PA', N'Pennsylvania', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (59, N'PE', N'Prince Edward Island (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (60, N'PR', N'Puerto Rico (US territory/association)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (61, N'QC', N'Quebec (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (62, N'RI', N'Rhode Island', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (63, N'SK', N'Saskatchewan (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (64, N'SC', N'South Carolina', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (65, N'SD', N'South Dakota', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (66, N'TN', N'Tennessee', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (67, N'TX', N'Texas', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (68, N'ZZ', N'Unknown', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (69, N'UT', N'Utah', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (70, N'VT', N'Vermont', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (71, N'VA', N'Virginia', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (72, N'VI', N'Virgin Islands (US)', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (73, N'WA', N'Washington', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (74, N'WV', N'West Virginia', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (75, N'WI', N'Wisconsin', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (76, N'WY', N'Wyoming', 237)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (77, N'YT', N'Yukon Territory (Canada)', 41)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (78, N'NSW', N'New South Wales', 14)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (79, N'QLD', N'Queensland', 14)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (80, N'SA', N'South Australia', 14)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (81, N'TAS', N'Tasmania', 14)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (82, N'VIC', N'Victoria', 14)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (83, N'WA', N'Western Australia', 14)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (84, N'ACT', N'Australian Capital Territory', 14)
GO
INSERT [dbo].[t_TLBoard_States] ([State_Id], [State_Code], [State_Name], [Country_Id]) VALUES (85, N'NT', N'Northern Territory', 14)
GO
ALTER TABLE [dbo].[t_TLBoard_AppExceptions] ADD  CONSTRAINT [DF_Table_1_TimeStamp]  DEFAULT (getdate()) FOR [Error_TimeStamp_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Credit_Cards_Statements_Transactions_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Transactions_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Bank_Accounts_Transactions] ADD  CONSTRAINT [DF_t_TLBoard_Bank_Accounts_Transactions_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Browers_User_Agents] ADD  CONSTRAINT [DF_t_TLBoard_Browers_User_Agents_Record_Created_TimeStamp_UTC]  DEFAULT (getutcdate()) FOR [Record_Created_TimeStamp_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Clients] ADD  CONSTRAINT [DF_t_TLBoard_Clients_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Clients] ADD  CONSTRAINT [DF_t_TLBoard_Clients_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Countries] ADD  CONSTRAINT [DF_t_TLBoard_Countries_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Countries] ADD  CONSTRAINT [DF_t_TLBoard_Countries_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses] ADD  CONSTRAINT [DF_t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_General_Documents] ADD  CONSTRAINT [DF_t_TLBoard_General_Documents_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_General_Documents] ADD  CONSTRAINT [DF_t_TLBoard_General_Documents_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Invoices] ADD  CONSTRAINT [DF_t_TLBoard_Invoices_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Invoices] ADD  CONSTRAINT [DF_t_TLBoard_Invoices_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Login_Attempts] ADD  CONSTRAINT [DF_t_TLBoard_Login_Attempts_Login_Attempt_TimeStamp_UTC]  DEFAULT (getutcdate()) FOR [Login_Attempt_TimeStamp_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Suppliers] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Suppliers] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Suppliers_Contacts] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Contacts_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Suppliers_Contacts] ADD  CONSTRAINT [DF_t_TLBoard_Suppliers_Contacts_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Suppliers_Contracts_Agreements] ADD  CONSTRAINT [DF_t_Doc_Man_Suppliers_Contracts_Agreements_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Suppliers_Contracts_Agreements] ADD  CONSTRAINT [DF_t_Doc_Man_Suppliers_Contracts_Agreements_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Users_Apartments] ADD  CONSTRAINT [DF_t_TLBoard_User_Apartments_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Users_Apartments] ADD  CONSTRAINT [DF_t_TLBoard_User_Apartments_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Users_Love_Relationships] ADD  CONSTRAINT [DF_t_TLBoard_Users_Love_Relationships_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO
ALTER TABLE [dbo].[t_TLBoard_Users_Love_Relationships] ADD  CONSTRAINT [DF_t_TLBoard_Users_Love_Relationships_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Delete_Client_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_Client_Details]
@Client_Id Int, 
@Deleting_User_Id Int
As

UPDATE	[dbo].[t_TLBoard_Clients]
SET		Is_Deleted = 1, 
		[Record_Deleted_By_User_Id] = @Deleting_User_Id, 
		[Record_Deleted_DateTime_UTC] = GETUTCDATE()
WHERE	Client_Id = @Client_Id And [User_Id] = @Deleting_User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 )

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Delete_Credit_Card_Transactions_To_Invoices_Expenses]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_Credit_Card_Transactions_To_Invoices_Expenses]
@Credit_Card_Tranasction_Connection_Record_Id Int, 
@Record_Deleted_By_User_Id int 
As

UPDATE	[dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Delete_DateTime_UTC = GETUTCDATE()
WHERE	Credit_Card_Tranasction_Connection_Record_Id = @Credit_Card_Tranasction_Connection_Record_Id And
		(Is_Deleted Is Null Or Is_Deleted = 0 )


GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Delete_Invoice_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_Invoice_Details]
@Invoice_Record_Id	Int	,
@Deleting_User_Id	Int
As

UPDATE	[dbo].[t_TLBoard_Invoices] 
SET		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()		,
		Is_Deleted = 1											, 
		Record_Deleted_By_User_Id = @Deleting_User_Id			,
		Record_Delete_DateTime_UTC = GetUTCDate()		
WHERE	[Invoice_Record_Id] = @Invoice_Record_Id And ( Is_Deleted Is null Or Is_Deleted = 0 )

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Delete_Supplier]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_Supplier]
@Supplier_Id Int, 
@Record_Deleted_By_User_Id int
As

UPDATE	[dbo].[t_TLBoard_Suppliers]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Deleted_DateTime_UTC = GETUTCDATE()
WHERE	Supplier_Id = @Supplier_Id And [User_Id] = @Record_Deleted_By_User_Id And (Is_Deleted Is null Or Is_Deleted = 0)

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Delete_Supplier_Administrative]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_Supplier_Administrative]
@Supplier_Id Int, 
@Record_Deleted_By_User_Id int
As

UPDATE	[dbo].[t_TLBoard_Suppliers]
SET		Is_Deleted = 1, Record_Deleted_By_User_Id = @Record_Deleted_By_User_Id , Record_Deleted_DateTime_UTC = GETUTCDATE()
WHERE	Supplier_Id = @Supplier_Id And (Is_Deleted Is null Or Is_Deleted = 0)

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Delete_User_By_Id_Administrative_Side]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Delete_User_By_Id_Administrative_Side]
@User_Id_To_Delete Int			,
@Delete_Reason NVarChar(500)	,	
@Deleted_By_User_Id Int			 
As

Update	t_TLBoard_Users 
Set		Is_Deleted = 1 , Deleted_By_User_Id = @Deleted_By_User_Id , 
		Deleted_DateTime_UTC = GETUTCDATE() , Delete_Reason = @Delete_Reason
Where	[User_Id] = @User_Id_To_Delete And ( Is_Deleted is Null Or Is_Deleted = 0 )

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Get_Client_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Get_Client_Details]
@Client_Id Int, 
@User_Id Int
As

Select	Client.*
From	t_TLBoard_Clients client
Where	client.[Client_Id] = @Client_Id And client.[User_Id] = @User_Id 
		And ( client.Is_Deleted Is Null Or client.Is_Deleted = 0 )  


GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Get_Clients_Search]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Get_Clients_Search]
@User_Id Int,
@Search_Criteria NVarChar(50) 
As

Select	Client_Id, Company_Name, Website_URL, Country_Id, State_Id, City , Mobile_Phone, Main_Contact_FullName, Main_Contact_Email_Address, Main_Contact_Phone_Number
From	t_TLBoard_Clients 
Where	[User_Id] = @User_Id And ( Is_Deleted Is Null Or Is_Deleted = 0 ) And 
		(	Company_Name Like '%'+@Search_Criteria+'%' Or
			Website_URL Like '%' + @Search_Criteria + '%' Or
			City Like '%' + @Search_Criteria + '%'  Or
			Main_Contact_FullName Like '%' + @Search_Criteria + '%'
			) 


GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Get_Counties_List]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Get_Counties_List]
As

Select	Country_Id, Country_Code, Country_English_Name
From	t_TLBoard_Countries
Where	Country_Id Not In ( Select Country_Id From t_TLBoard_Countries_Banned ) And Is_Active = 1

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Get_Currencies_List]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Get_Currencies_List]
As

Select	* 
From	[dbo].[t_TLBoard_Currencies]

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Get_User_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Get_User_Details]
@User_Id Int
As

Select	[Username]							,
		[First_Name]						,
		[Middle_Name]						,
		[Last_Name]							,
		[User_Email]						,
		[Country_Id]						,
		[State_Id]							,
		[City]								,
		[Address]							,
		[ZipCode]							,
		[Mobile_Phone]						,
		[Additional_Phone_Number]			,
		[Record_Creation_DateTime_UTC]		,
		[Record_Last_Updated_DateTime_UTC]	,
		[Record_Last_Updated_By_User_Id]
From	[dbo].[t_TLBoard_Users]
Where	[User_Id] = @User_Id

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Get_Users_Search]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Get_Users_Search]
@Search_Criteria NVarChar(50)
As

Select	[Username]							,
		[First_Name]						,
		[Middle_Name]						,
		[Last_Name]							,
		[User_Email]						,
		[Country_Id]						,
		[State_Id]							,
		[City]								,
		[Address]							,
		[ZipCode]							,
		[Mobile_Phone]						,
		[Additional_Phone_Number]			,
		[Record_Creation_DateTime_UTC]		,
		[Record_Last_Updated_DateTime_UTC]	,
		[Record_Last_Updated_By_User_Id]
From	t_TLBoard_Users 
Where	Len( @Search_Criteria ) > 0 
		And (	[First_Name] = @Search_Criteria		Or 
				[Middle_Name] = @Search_Criteria	Or 
				[Last_Name] = @Search_Criteria		Or 
				[User_Email] = @Search_Criteria		Or 
				[City] = @Search_Criteria			Or 
				[ZipCode] = @Search_Criteria		)

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Insert_Client_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Insert_Client_Details]
@User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Client_Type_Id smallint, @Main_Contact_FullName nvarchar(100),
@Main_Contact_Email_Address nvarchar(100), @Main_Contact_Phone_Number nvarchar(50),
@Creating_User_Id Int
As

INSERT INTO [dbo].[t_TLBoard_Clients]
           ([User_Id] , [Company_Name] , [Website_URL] , [Country_Id] , 
			[State_Id] , [City] , [Address] , [ZipCode] , [Telephone] ,
			[Mobile_Phone] , [Client_Type_Id] , [Main_Contact_FullName] ,
			[Main_Contact_Email_Address] , [Main_Contact_Phone_Number],
			Record_Created_By_User_Id, Record_Creation_DateTime_UTC, 
			Record_Last_Updated_By_User_Id, Record_Last_Updated_DateTime_UTC
			)
     VALUES	(
			@User_Id, @Company_Name, 
			@Website_URL, @Country_Id , 
			@State_Id, @City , @Address, 
			@ZipCode, @Telephone, @Mobile_Phone, 
			@Client_Type_Id, @Main_Contact_FullName,
			@Main_Contact_Email_Address, @Main_Contact_Phone_Number,
			@Creating_User_Id, GETUTCDATE(), 
			@Creating_User_Id, GETUTCDATE()
			)

Select @@IDENTITY;


GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Insert_Credit_Card_Transactions_To_Invoices_Expenses]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Insert_Credit_Card_Transactions_To_Invoices_Expenses]
@Credit_Card_Statement_Transaction_Id bigint,
@Is_Supplier_Expense bit, @Expense_Record_Id int,
@Is_Invoice_Income bit, @Invoice_Record_Id int,
@Record_Created_By_User_Id int 
As


INSERT INTO [dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses]
           ([Credit_Card_Statement_Transaction_Id]
           ,[Is_Supplier_Expense]
           ,[Expense_Record_Id]
           ,[Is_Invoice_Income]
           ,[Invoice_Record_Id]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC])
     VALUES
           (
			@Credit_Card_Statement_Transaction_Id, 
			@Is_Supplier_Expense,
			@Expense_Record_Id,
			@Is_Invoice_Income, 
			@Invoice_Record_Id,
	        @Record_Created_By_User_Id, 
			GETUTCDATE(),
			@Record_Created_By_User_Id, 
		   GETUTCDATE()
		   )

Select @@IDENTITY;

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Insert_Invoice_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Insert_Invoice_Details]
@User_Id int								, 
@Client_Id Int								, 
@Currency_Id int							,
@Total_Without_Vat decimal(18,3)			,
@Total_Vat decimal(18,3)					,
@Vat_Percentage decimal(6,2)				,
@Total_Amount decimal(18,3)					,
@Creation_DateTime datetime					,
@Creation_DateTime_UTC datetime				,
@Invoiced_On_User_Location_Id int			,
@Invoiced_To_CompanyName nvarchar(150)		,
@Invoiced_To_PhoneNumber nvarchar(50)		,
@Invoiced_To_Address nvarchar(50)			,
@Invoice_Number int							,
@Invoice_Reference_Number nvarchar(50)		,
@Invoice_Type_Id tinyint					,
@User_Description nvarchar(500)				,
@User_Comments nvarchar(500)				,	 
@Original_File_Name nvarchar(255)			,
@Azure_Block_Blob_Reference nvarchar(255)	,
@Creating_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Invoices] (
			[User_Id]							,
			[Client_Id]							,.
			[Currency_Id]						,
			[Total_Without_Vat]					,
			[Total_Vat]							,
			[Vat_Percentage]					,
			[Total_Amount]						,
			[Creation_DateTime]					,
			[Creation_DateTime_UTC]				,
			[Invoiced_On_User_Location_Id]		,
			[Invoiced_To_CompanyName]			,
			[Invoiced_To_PhoneNumber]			,
			[Invoiced_To_Address]				,
			[Invoice_Number]					,
			[Invoice_Reference_Number]			,
			[Invoice_Type_Id]					,
			[Record_Created_By_User_Id]			,
			[Record_Creation_DateTime_UTC]		,
			[Record_Last_Updated_By_User_Id]	,
			[Record_Last_Updated_DateTime_UTC]	,
			[User_Description]					,
			[User_Comments]						,
			[Original_File_Name]				,
			[Azure_Block_Blob_Reference] )
VALUES (	@User_Id							,
			@Client_Id							,
			@Currency_Id						,	 
			@Total_Without_Vat					,	 
			@Total_Vat 							,
			@Vat_Percentage 					,
			@Total_Amount						,
			@Creation_DateTime 					,
			@Creation_DateTime_UTC				,
			@Invoiced_On_User_Location_Id		,
			@Invoiced_To_CompanyName			,
			@Invoiced_To_PhoneNumber			,
			@Invoiced_To_Address				,
			@Invoice_Number						,
			@Invoice_Reference_Number			,
			@Invoice_Type_Id					,	
			@Creating_User_Id					, 
			GetUTCDate()						,
			@Creating_User_Id					,
			GetUTCDate()						,
			@User_Description 					,
			@User_Comments						,
			@Original_File_Name					,
			@Azure_Block_Blob_Reference			)

Select @@Identity;

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Insert_Supplier_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Insert_Supplier_Details]
@User_Id int, @Company_Name nvarchar(100),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40), 
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number nvarchar(20),
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100),
@Main_Contact_Phone_Number nvarchar(50), @Record_Created_By_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Suppliers]
           ([User_Id] , [Company_Name], [Website_URL], 
		   [Country_Id], [State_Id], [City], [Address], [ZipCode]
           ,[Telephone]
           ,[Mobile_Phone]
           ,[Supplier_Type_Id]
           ,[Supplier_Tax_Reference_Number]
           ,[Main_Contact_FullName]
           ,[Main_Contact_Email_Address]
           ,[Main_Contact_Phone_Number]
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           )
     VALUES
           (@User_Id , @Company_Name, @Website_URL, @Country_Id, @State_Id, @City,
            @Address, @ZipCode, @Telephone, 
			@Mobile_Phone, @Supplier_Type_Id, @Supplier_Tax_Reference_Number,
			@Main_Contact_FullName, @Main_Contact_Email_Address, 
			@Main_Contact_Phone_Number, 
			@Record_Created_By_User_Id, 
			GETUTCDATE(), 
			@Record_Created_By_User_Id,
			GETUTCDATE()
           )

Select @@IDENTITY;

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Insert_User_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Insert_User_Details]
@Username varchar(50), 
@EncryptedPassword varchar(120), 
@EncryptionRandomSalt varchar(50),
@First_Name nvarchar(60), 
@Middle_Name nvarchar(60),
@Last_Name nvarchar(60),
@User_Email varchar(100),
@Country_Id smallint,
@State_Id smallint,
@City nvarchar(80), 
@Address nvarchar(120),
@ZipCode varchar(10), 
@Mobile_Phone varchar(20), 
@Additional_Phone_Number varchar(20),
@Record_Creation_DateTime_UTC datetime,
@Record_Last_Updated_DateTime_UTC datetime,
@Record_Last_Updated_By_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Users]
    ([Username]
    ,[EncryptedPassword]
    ,[EncryptionRandomSalt]
    ,[First_Name]
    ,[Middle_Name]
    ,[Last_Name]
    ,[User_Email]
    ,[Country_Id]
    ,[State_Id]
    ,[City]
    ,[Address]
    ,[ZipCode]
    ,[Mobile_Phone]
    ,[Additional_Phone_Number]
    ,[Record_Creation_DateTime_UTC]
    ,[Record_Last_Updated_DateTime_UTC]
    ,[Record_Last_Updated_By_User_Id])
VALUES (
	@Username , 
	@EncryptedPassword, 
	@EncryptionRandomSalt,
	@First_Name, 
	@Middle_Name,
	@Last_Name,
    @User_Email,
	@Country_Id, 
	@State_Id,
	@City,
	@Address,
	@ZipCode,
	@Mobile_Phone,
	@Additional_Phone_Number,
	@Record_Creation_DateTime_UTC,
	@Record_Last_Updated_DateTime_UTC,
	@Record_Last_Updated_By_User_Id )

Select @@Identity;

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_Client_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_Client_Details]
@Client_Id Int, @User_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Client_Type_Id smallint, @Main_Contact_FullName nvarchar(100),
@Main_Contact_Email_Address nvarchar(100), @Main_Contact_Phone_Number nvarchar(50),
@Updating_User_Id Int
As

UPDATE	[dbo].[t_TLBoard_Clients]
SET		[Company_Name] = @Company_Name, 
		[Website_URL] = @Website_URL,
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City,
		[Address] = @Address,
		[ZipCode] = @ZipCode, 
		[Telephone] = @Telephone,
		[Mobile_Phone] = @Mobile_Phone,
		[Client_Type_Id] = @Client_Type_Id,
		[Main_Contact_FullName] = @Main_Contact_FullName,
		[Main_Contact_Email_Address] = @Main_Contact_Email_Address,
		[Main_Contact_Phone_Number] = @Main_Contact_Phone_Number,
		[Record_Last_Updated_By_User_Id] = @Updating_User_Id, 
		[Record_Last_Updated_DateTime_UTC] = GETUTCDATE()
		
WHERE	Client_Id = @Client_Id

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_Country_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_Country_Details]
@Country_Id SmallInt , @Country_Code VarChar(10), @Country_English_Name NVarChar(80) , 
@Country_Native_Name NVarChar(80), @Continent_Id TinyInt, @Updating_User_Id Int
As

UPDATE	[dbo].[t_TLBoard_Countries]
SET		[Country_Code] = @Country_Code						, 
		[Country_English_Name] = @Country_English_Name		,
		[Country_Native_Name] = @Country_Native_Name		,
		[Continent_Id] = @Continent_Id						,
		Record_Last_Updated_By_User_Id = @Updating_User_Id	,
		Record_Last_Updated_DateTime_UTC = GetUTCDate()
WHERE	Country_Id = @Country_Id

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_Country_Details_Administrative]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_Country_Details_Administrative]
@Country_Id SmallInt , @Country_Code VarChar(10), @Country_English_Name NVarChar(80) , 
@Country_Native_Name NVarChar(80), @Continent_Id TinyInt, @Is_Active Bit , @Updating_User_Id Int
As

UPDATE	[dbo].[t_TLBoard_Countries]
   SET	[Country_Code] = @Country_Code						, 
		[Country_English_Name] = @Country_English_Name		,
		[Country_Native_Name] = @Country_Native_Name		,
		[Continent_Id] = @Continent_Id						,
		[Is_Active] = @Is_Active							,
		Record_Last_Updated_By_User_Id = @Updating_User_Id	,
		Record_Last_Updated_DateTime_UTC = GetUTCDate()
WHERE	Country_Id = @Country_Id

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_Credit_Card_Transactions_To_Invoices_Expenses]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_Credit_Card_Transactions_To_Invoices_Expenses]
@Credit_Card_Tranasction_Connection_Record_Id Int, 
@Credit_Card_Statement_Transaction_Id bigint,
@Is_Supplier_Expense bit, @Expense_Record_Id int,
@Is_Invoice_Income bit, @Invoice_Record_Id int, 
@Is_Visible Bit, 
@Record_Updated_By_User_Id int 
As

UPDATE	[dbo].[t_TLBoard_Credit_Card_Transactions_To_Invoices_Expenses]
SET		[Credit_Card_Statement_Transaction_Id] = @Credit_Card_Statement_Transaction_Id,
		[Is_Supplier_Expense] = @Is_Supplier_Expense, 
		[Expense_Record_Id] = @Expense_Record_Id,
		[Is_Invoice_Income] = @Is_Invoice_Income,
		[Invoice_Record_Id] = @Invoice_Record_Id,
		Is_Visible = @Is_Visible, 
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GETUTCDATE()
WHERE	Credit_Card_Tranasction_Connection_Record_Id = @Credit_Card_Tranasction_Connection_Record_Id


GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_Invoice_Details_File_Change]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_Invoice_Details_File_Change]
@Invoice_Record_Id Int						,
@User_Description nvarchar(500)				,
@User_Comments nvarchar(500)				,	 
@Original_File_Name nvarchar(255)			,
@Azure_Block_Blob_Reference nvarchar(255)	,
@Updating_User_Id int
As

UPDATE	[dbo].[t_TLBoard_Invoices] 
SET		[User_Id] = @Updating_User_Id									,
		[User_Description] = @User_Description							,
		[User_Comments] = @User_Comments								,
		[Original_File_Name] = @User_Comments							,
		[Azure_Block_Blob_Reference] = @Azure_Block_Blob_Reference		,
		[Record_Last_Updated_By_User_Id] = @Updating_User_Id			,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()				
WHERE	[Invoice_Record_Id] = @Invoice_Record_Id

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_Supplier_Details]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_Supplier_Details]
@Supplier_Id Int, @User_Id int, @Company_Name nvarchar(100),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Telephone varchar(40), @Mobile_Phone varchar(40), 
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number nvarchar(20),
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100),
@Main_Contact_Phone_Number nvarchar(50), 
@Record_Updated_By_User_Id int

As

UPDATE	[dbo].[t_TLBoard_Suppliers]
SET		[Company_Name] = @Company_Name,
		[Website_URL] = @Website_URL,
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City, 
		[Address] = @Address,
		[ZipCode] = @ZipCode,
		[Telephone] = @Telephone,
		[Mobile_Phone] = @Mobile_Phone, 
		[Supplier_Type_Id] = @Supplier_Type_Id, 
		[Supplier_Tax_Reference_Number] = @Supplier_Tax_Reference_Number,
		[Main_Contact_FullName] = @Main_Contact_FullName, 
		[Main_Contact_Email_Address] = @Main_Contact_Email_Address,
		[Main_Contact_Phone_Number] = @Main_Contact_Phone_Number,
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()
WHERE Supplier_Id = @Supplier_Id And [User_Id] = @Record_Updated_By_User_Id

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_Supplier_Details_Is_Active]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_Supplier_Details_Is_Active]
@Supplier_Id Int, 
@Is_Active Bit, 
@Active_Last_Updated_Comments NVarChar(500), 
@Record_Updated_By_User_Id int
As

UPDATE	[dbo].[t_TLBoard_Suppliers]
SET		[Is_Active] = @Is_Active, 
		[Active_Last_Updated_Comments] = @Active_Last_Updated_Comments,
		[Record_Last_Updated_By_User_Id] = @Record_Updated_By_User_Id,
		[Record_Last_Updated_DateTime_UTC] = GetUTCDate()
WHERE Supplier_Id = @Supplier_Id And [User_Id] = @Record_Updated_By_User_Id

GO
/****** Object:  StoredProcedure [dbo].[p_TLBoard_Update_User_Details_Administrative_Side]    Script Date: 19/01/2021 21:02:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [dbo].[p_TLBoard_Update_User_Details_Administrative_Side]
@User_Id Int								, 
@Username varchar(50)						, 
@EncryptedPassword varchar(120)				, 
@EncryptionRandomSalt varchar(120)			, 
@First_Name varchar(120)					, 
@Middle_Name nvarchar(60)					, 
@Last_Name nvarchar(60)						, 
@User_Email varchar(100)					, 
@Country_Id SmallInt						,
@State_Id SmallInt							,
@City nvarchar(80)							,
@Address nvarchar(120)						,
@ZipCode nvarchar(10)						,
@Mobile_Phone varchar(20)					,
@Additional_Phone_Number varchar(20)		,
@Record_Last_Updated_DateTime_UTC DateTime	,
@Record_Last_Updated_By_User_Id	Int	
As

UPDATE	[dbo].[t_TLBoard_Users]
SET		[Username] = @Username,
		[EncryptedPassword] = @EncryptedPassword,
		[EncryptionRandomSalt] = @EncryptionRandomSalt,
		[First_Name] = @First_Name ,
		[Middle_Name] = @Middle_Name ,
		[Last_Name] = @Last_Name ,
		[User_Email] = @User_Email , 
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City,
		[Address] = @Address,
		[ZipCode] = @ZipCode,
		[Mobile_Phone] = @Mobile_Phone,
		[Additional_Phone_Number] = @Additional_Phone_Number,
		[Record_Last_Updated_DateTime_UTC] = @Record_Last_Updated_DateTime_UTC, 
		[Record_Last_Updated_By_User_Id] = @Record_Last_Updated_By_User_Id
WHERE	[User_Id] = @User_Id

GO
