Use [DashboardTimeLine];
Go


Alter Proc [dbo].[p_TLBoard_Get_Users_Administration_List]
@User_Id_Authorized_Employee_Searching_Users Int
As

Select	users.[User_Id],  users.Email, users.First_Name, users.Middle_Name , users.Last_Name, Username
From	t_TLBoard_Users users
Where	users.Is_Active = 1 and users.Is_Deleted = 0


GO

Alter Proc [dbo].[p_TLBoard_Insert_Currency]
@Currency_Name NVarChar(50), @Currency_Code VarChar(10) , @Currency_Symbol NVarChar(10)
As

Declare @Currency_Id TinyInt; 
Set @Currency_Id = ( Select (Max(Currency_Id)+1) from t_TLBoard_Currencies)

If (@Currency_Name Is Not Null)
Begin

	Insert Into t_TLBoard_Currencies (Currency_Id, Currency_Name, Currency_Code, Currency_Symbol )
	Values ( @Currency_Id, @Currency_Name, @Currency_Code, @Currency_Symbol )

	Select @Currency_Id;

End

Go

Alter Proc [dbo].[p_TLBoard_Get_Currencies_List]
As

Select		currencies.* 
From		t_TLBoard_Currencies currencies
Order By	currencies.Wiki_Daily_Trades_Stats_2019 desc


GO

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_t_TLBoard_Insert_Currency'  ))
Begin
	Drop Proc p_t_TLBoard_Insert_Currency
End

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_Get_Users_Administration_List'  ))
Begin
	Drop Proc p_Get_Users_Administration_List
End

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_Get_Currencies_List'  ))
Begin
	Drop Proc p_Get_Currencies_List
End

Go


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

Alter Proc p_TLBoard_Get_Expense_Types
As

Select		* 
From		t_TLBoard_Expense_Types
Where		[Is_Active] = 1 And [Is_Visible] = 1
Order By	Sort_Order ASC

Go

/*

CREATE TABLE [dbo].[t_TLBoard_Invoice_Types](
	[Invoice_Type_Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Invoice_Type_Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Record_Created_By_User_Id] [int] NOT NULL,
	[Record_Creation_DateTime_UTC] [datetime] NOT NULL,
	[Record_Last_Updated_By_User_Id] [int] NOT NULL,
	[Record_Last_Updated_DateTime_UTC] [datetime] NOT NULL,
	[Is_Active] [bit] NOT NULL,
	[Is_Visible] [bit] NOT NULL,
	[Sort_Order] [smallint] NOT NULL,
 CONSTRAINT [PK_t_TLBoard_Invoice_Types] PRIMARY KEY CLUSTERED 
(
	[Invoice_Type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Record_Creation_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Creation_DateTime_UTC]
GO

ALTER TABLE [dbo].[t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Record_Last_Updated_DateTime_UTC]  DEFAULT (getutcdate()) FOR [Record_Last_Updated_DateTime_UTC]
GO

ALTER TABLE [dbo].[t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO

ALTER TABLE [dbo].[t_TLBoard_Invoice_Types] ADD  CONSTRAINT [DF_t_TLBoard_Invoice_Types_Is_Visible]  DEFAULT ((1)) FOR [Is_Visible]
GO

*/

Alter Proc p_TLBoard_Get_Invoice_Types
As

Select		* 
From		t_TLBoard_Invoice_Types
Where		[Is_Active] = 1 And [Is_Visible] = 1
Order By	Sort_Order ASC

Go

--Select * from t_TLBoard_Invoice_Types

Alter Proc p_TLBoard_Insert_Expense_Details
@User_Id int, @Supplier_Id Int, @Expense_Invoice_DateTime DateTime,
@Currency_Id TinyInt, @Total_Amount Decimal(18,3), @Vat_Percentage Decimal(6,2),
@Total_Without_Vat Decimal(18,3), @Total_Vat Decimal(18,3), @Invoiced_Client_On_User_Location_Id int,
@Invoiced_Client_To_CompanyName NVarChar(150), @Invoiced_Client_To_PersonName NVarchar(100),
@Invoiced_Client_To_PhoneNumber NVarChar(50), @Invoiced_Client_To_Address NVarChar(120),
@Expense_Type_Id TinyInt, @Invoice_Number NVarChar(30), @Invoice_Reference_Number NVarChar(50),
@Invoice_Supplier_Company_Details NVarChar(120), 
@Invoice_Supplier_Tax_Reference NVarChar(50), @Invoice_Supplier_Country_Id SmallInt,
@Invoice_Supplier_StateId SmallInt, @Invoice_Supplier_City NVarChar(100),
@Invoice_Supplier_Address_Description NVarChar(255),
@Invoice_Supplier_ZipCode NVarChar(10),
@Invoice_Supplier_WebAddress NVarChar(120), @Invoice_Supplier_Phone_Number NVarChar(50),
@Invoice_Supplier_Contact_FullName NVarChar(80), @Invoice_Content_Long_Description NVarChar(2000),
@User_Description NVarChar(1000), @User_Comments NVarChar(1000), @Original_File_Name nvarchar(255),
@Azure_Block_Blob_Reference NVarchar(255), @Is_Visible_To_Anonymous_Users bit,
@Is_Available_For_Download_For_Anonymous_Users bit, @Is_Visible_To_Followers_Users bit,
@Is_Available_For_Download_For_Followers_Users bit, @Record_Created_By_User_Id int,
@Record_Creation_DateTime_UTC DateTime,
@Record_Last_Updated_By_User_Id Int,
@Record_Last_Updated_DateTime_UTC DateTime,
@Is_Active bit
As

INSERT INTO [dbo].[t_TLBoard_Expenses]
			   ([User_Id]
			   ,[Supplier_Id]
			   ,[Expense_Invoice_DateTime]
			   ,[Currency_Id]
			   ,[Total_Amount]
			   ,[Vat_Percentage]
			   ,[Total_Without_Vat]
			   ,[Total_Vat]
			   ,[Invoiced_Client_On_User_Location_Id]
			   ,[Invoiced_Client_To_CompanyName]
			   ,[Invoiced_Client_To_PersonName]
			   ,[Invoiced_Client_To_PhoneNumber]
			   ,[Invoiced_Client_To_Address]
			   ,[Expense_Type_Id]
			   ,[Invoice_Number]
			   ,[Invoice_Reference_Number]
			   ,[Invoice_Supplier_Company_Details]
			   ,[Invoice_Supplier_Tax_Reference]
			   ,[Invoice_Supplier_Country_Id]
			   ,[Invoice_Supplier_StateId]
			   ,[Invoice_Supplier_City]
			   ,[Invoice_Supplier_Address_Description]
			   ,[Invoice_Supplier_ZipCode]
			   ,[Invoice_Supplier_WebAddress]
			   ,[Invoice_Supplier_Phone_Number]
			   ,[Invoice_Supplier_Contact_FullName]
			   ,[Invoice_Content_Long_Description]
			   ,[User_Description]
			   ,[User_Comments]
			   ,[Original_File_Name]
			   ,[Azure_Block_Blob_Reference]
			   ,[Is_Visible_To_Anonymous_Users]
			   ,[Is_Available_For_Download_For_Anonymous_Users]
			   ,[Is_Visible_To_Followers_Users]
			   ,[Is_Available_For_Download_For_Followers_Users]
			   ,[Record_Created_By_User_Id]
			   ,[Record_Creation_DateTime_UTC]
			   ,[Record_Last_Updated_By_User_Id]
			   ,[Record_Last_Updated_DateTime_UTC]
			   ,[Is_Active]
			   )
     VALUES	(	@User_Id , @Supplier_Id , @Expense_Invoice_DateTime ,
				@Currency_Id, @Total_Amount, @Vat_Percentage,
				@Total_Without_Vat, @Total_Vat, @Invoiced_Client_On_User_Location_Id,
				@Invoiced_Client_To_CompanyName, @Invoiced_Client_To_PersonName,
				@Invoiced_Client_To_PhoneNumber, @Invoiced_Client_To_Address,
				@Expense_Type_Id, @Invoice_Number, @Invoice_Reference_Number,
				@Invoice_Supplier_Company_Details, 
				@Invoice_Supplier_Tax_Reference, @Invoice_Supplier_Country_Id,
				@Invoice_Supplier_StateId, @Invoice_Supplier_City,
				@Invoice_Supplier_Address_Description,
				@Invoice_Supplier_ZipCode,
				@Invoice_Supplier_WebAddress, @Invoice_Supplier_Phone_Number,
				@Invoice_Supplier_Contact_FullName, @Invoice_Content_Long_Description,
				@User_Description, @User_Comments, @Original_File_Name,
				@Azure_Block_Blob_Reference, @Is_Visible_To_Anonymous_Users,
				@Is_Available_For_Download_For_Anonymous_Users, @Is_Visible_To_Followers_Users,
				@Is_Available_For_Download_For_Followers_Users, 
				@Record_Created_By_User_Id, @Record_Creation_DateTime_UTC,
				@Record_Last_Updated_By_User_Id, @Record_Last_Updated_DateTime_UTC , @Is_Active )

Select @@IDENTITY;

GO

Alter Proc p_TLBoard_Get_Expense_Details
@Expense_Record_Id Int, 
@User_Id_Expense_Owner Int, 
@User_Id_Searching_For_Expense_Details Int
As 

Select	expense.*
From	t_TLBoard_Expenses expense
Where	expense.[Expense_Record_Id] = @Expense_Record_Id
		And ( expense.Is_Deleted Is Null Or expense.Is_Deleted = 0 )  

Go


