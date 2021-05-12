Use [DashboardTimeLine]; 

Go

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-------  ABILITY TO Search/Connect with documents/expenses/invoices ect  ------- 
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

/* Todo: 
    
    1) Enable to search / filter manually system documents/invoices/expenses
    2) Enable to select few of them and click "Connect" / "Save" and they will apear as connected documents
    3) Enable to remove / hide connected documents/expenses/invoices
    4) Show documents suggestions for the transaction

*/

Go

-- Transaction Connected Documents / Suggested documents
-- Should have: 
/*

- ID (Hidden)
- Type ( Invoice / Expense / Receipt / Document / Letter / ect.. )
- Title ( Document Title )
- Document file name (Original file name that was uploaded)
- Date (Date upload of the document)
- Operations (Operations for the connected transaction - Privacy Settings/Download/View/Edit/Disconnect )

Suggested documents list show show all the relavant documents based on the day of the transaction.
The suggested document that it's amount is the same like the transaction should be highlighted 
It should be also possible to auto connect a document for a transaction during adding a document process (only if the total sum is matched)

*/

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Suggested_Documents_For_Bank_Account_Transaction'  ))
Begin
	Drop Proc [p_TLBoard_Get_Suggested_Documents_For_Bank_Account_Transaction]
End

Go

Create Proc p_TLBoard_Get_Suggested_Documents_For_Bank_Account_Transaction
@User_Id Int, @Bank_Account_Transaction_Id BigInt
As

-- Validate User_Id against the bank account transaction id
Declare @Expected_User_Id Int; 
Set     @Expected_User_Id = 
            (   Select  bankAccount.[User_Id]
                From    t_TLBoard_Bank_Accounts_Transactions transactionDetails
                Join    t_TLBoard_Bank_Accounts bankAccount On bankAccount.Bank_Account_Id = transactionDetails.Bank_Account_Id
                Where   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id );

If ( @Expected_User_Id != @User_Id )
Begin
    Declare @ErrorMessage NVarChar(500) = N'Error validating owner user ' + Convert(VarChar, @User_Id) + ' against transaction id ' + Convert(VarChar, @Bank_Account_Transaction_Id) +'.';
    Throw 500011, @ErrorMessage, 1;
End

-- Selecting suggested documents
-- Get the date of the transaction
Declare @Bank_Account_Transaction_Date SmallDateTime = 
    (   Select  transactionDetails.Transaction_Actual_DateTime 
        From    t_TLBoard_Bank_Accounts_Transactions transactionDetails
        Join    t_TLBoard_Bank_Accounts bankAccount on bankAccount.Bank_Account_Id = transactionDetails.Bank_Account_Id
        Where   transactionDetails.Bank_Account_Transaction_Id = @Bank_Account_Transaction_Id );


Select  expenses.Expense_Record_Id                              As Suggested_Document_Id                                    , 
        'Expense'                                               As Suggested_Document_Type                                  , 
        expenses.Currency_Id                                    As Suggested_Document_Currency_Id                           ,
        expenses.Total_Amount                                   As Suggested_Document_Total_Amount                          ,
        expenses.Expense_Invoice_DateTime                       As Suggested_Document_Date                                  ,
        expenses.Original_File_Name                             As Suggested_Document_Original_File_Name                    ,
        expenses.Is_Visible_To_Anonymous_Users                  As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
        expenses.Is_Available_For_Download_For_Anonymous_Users  As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
        expenses.Is_Visible_To_Followers_Users                  As Suggested_Document_Is_Visible_To_Followers_Users         ,
        expenses.Is_Available_For_Download_For_Followers_Users  As Suggested_Document_Is_Downloadable_For_Followers_Users   
From    t_TLBoard_Expenses expenses
Where   expenses.[User_Id] = @User_Id 
        And Convert(Varchar, expenses.Expense_Invoice_DateTime , 103) = Convert(Varchar, @Bank_Account_Transaction_Date , 103)
Union 
Select  invoices.Invoice_Record_Id                              As Suggested_Document_Id                                    , 
        'Invoice'                                               As Suggested_Document_Type                                  , 
        invoices.Currency_Id                                    As Suggested_Document_Currency_Id                           ,
        invoices.Total_Amount                                   As Suggested_Document_Total_Amount                          ,
        invoices.Invoice_DateTime                               As Suggested_Document_Date                                  ,
        invoices.Original_File_Name                             As Suggested_Document_Original_File_Name                    ,
        invoices.Is_Visible_To_Anonymous_Users                  As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
        invoices.Is_Available_For_Download_For_Anonymous_Users  As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
        invoices.Is_Visible_To_Followers_Users                  As Suggested_Document_Is_Visible_To_Followers_Users         ,
        invoices.Is_Available_For_Download_For_Followers_Users  As Suggested_Document_Is_Downloadable_For_Followers_Users   
From    t_TLBoard_Invoices invoices
Where   invoices.[User_Id] = @User_Id 
        And Convert(Varchar, invoices.Invoice_DateTime , 103) = Convert(Varchar, @Bank_Account_Transaction_Date , 103)
Union 
Select  gdocuments.General_Document_Id                              As Suggested_Document_Id                                    , 
        'General_Document'                                          As Suggested_Document_Type                                  , 
        Null                                                        As Suggested_Document_Currency_Id                           ,
        Null                                                        As Suggested_Document_Total_Amount                          ,
        gdocuments.Document_Creation_DateTime                       As Suggested_Document_Date                                  ,
        gdocuments.Original_File_Name                               As Suggested_Document_Original_File_Name                    ,
        gdocuments.Is_Visible_To_Anonymous_Users                    As Suggested_Document_Is_Visible_To_Anonymous_Users         ,
        gdocuments.Is_Available_For_Download_For_Anonymous_Users    As Suggested_Document_Is_Downloadable_For_Anonymous_Users   ,
        gdocuments.Is_Visible_To_Followers_Users                    As Suggested_Document_Is_Visible_To_Followers_Users         ,
        gdocuments.Is_Available_For_Download_For_Followers_Users    As Suggested_Document_Is_Downloadable_For_Followers_Users   
From    t_TLBoard_General_Documents gdocuments
Where   gdocuments.[User_Id] = @User_Id 
        And Convert(Varchar, gdocuments.Document_Creation_DateTime , 103) = Convert(Varchar, @Bank_Account_Transaction_Date , 103)
Order By Suggested_Document_Date Desc

Go

--Exec p_TLBoard_Get_Suggested_Documents_For_Bank_Account_Transaction 1, 413
--Select Convert(varchar , GetDate(), 103)

-- 28.04.2021 -- Implamenting actual azure store save 
--update t_TLBoard_Users set Azure_Container_Ref = 'dashboard-timeline-1-vadim-rasin'  where [user_id] = 1

/*

29.04.2021 -- Azure integration // upload actual documents to test all the connections with the transactions
ToDos -- Rewrite/Refactor app to support: 
1) Uploading expense file to azure
2) Uploading invoice file to azure
3) Uploading general documents to azure
4) Enable delete expense/invoice/documents -- should delete the actual file from the azure but modify delete=0 the DB record
*/

---------------

--Delete from t_TLBoard_Expenses;
--Delete from t_TLBoard_General_Documents
--Delete from t_TLBoard_Invoices

Go

--exec p_TLBoard_Get_Users_Search 'dummy_FirstName'
--select * from t_TLBoard_Users

Go

ALTER Proc [dbo].[p_TLBoard_Get_Users_Search]
@Search_Criteria NVarChar(50)
As

Select	[User_Id]                           ,
        [Username]							,
		[App_Permission_Type_Id]			,
		[First_Name]						,
		[Middle_Name]						,
		[Last_Name]							,
		[Email]								,
		[Country_Id]						,
		[State_Id]							,
		[City]								,
		[Address]							,
		[ZipCode]							,
		[Mobile_Phone]						,
		[Additional_Phone_Number]			,
        [Birth_Date]                        ,
		[Record_Creation_DateTime_UTC]		,
		[Record_Last_Updated_DateTime_UTC]	,
        [Gender]                            ,
        [Registration_DateTime_UTC]         ,
        [Is_Deleted]                        ,
        [Is_Active]                         ,
		[Record_Last_Updated_By_User_Id]    
From	t_TLBoard_Users 
Where	Len (   @Search_Criteria ) > 0 
		And (	[First_Name]    = @Search_Criteria		OR 
				[Middle_Name]   = @Search_Criteria	    OR
				[Last_Name]     = @Search_Criteria		OR 
				[Email]         = @Search_Criteria		OR 
				[City]          = @Search_Criteria		OR 
				[ZipCode]       = @Search_Criteria		    )

Go

--------  manage_User.aspx is not even implamented >_< !!!
--Select * From t_TLBoard_App_Permission_Types

Go

If ( Not Exists (   Select  App_Permission_Type_Id 
                    From    t_TLBoard_App_Permission_Types 
                    where   App_Permission_Type_Code = 'DashboardTimeLine_Company_Employee') )
Begin

    INSERT INTO [dbo].[t_TLBoard_App_Permission_Types]
           ([App_Permission_Type_Id]
           ,[App_Permission_Type_Name]
           ,[App_Permission_Type_Code]
           ,[App_Permission_Type_Description])
     VALUES
           (2
           ,'Company employee'
           ,'DashboardTimeLine_Company_Employee'
           ,'Company employee with regular permissions');
End

If ( Not Exists (   Select  App_Permission_Type_Id 
                    From    t_TLBoard_App_Permission_Types 
                    where   App_Permission_Type_Code = 'DashboardTimeLine_User') )
Begin

    INSERT INTO [dbo].[t_TLBoard_App_Permission_Types]
           ([App_Permission_Type_Id]
           ,[App_Permission_Type_Name]
           ,[App_Permission_Type_Code]
           ,[App_Permission_Type_Description])
     VALUES
           (3
           ,'DashboardTimeLine User'
           ,'DashboardTimeLine_User'
           ,'DashboardTimeLine regular user');
End

Go

-- Select * From t_TLBoard_App_Permission_Types

Go

--Username
----App_Permission_Type_Id
--First_Name
--Middle_Name

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_User_Details_Administrative_Side'  ))
Begin
	Drop Proc [p_TLBoard_Update_User_Details_Administrative_Side]
End

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_User_Details_With_New_Password'  ))
Begin
	Drop Proc [p_TLBoard_Update_User_Details_With_New_Password]
End

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_User_Details'  ))
Begin
	Drop Proc [p_TLBoard_Update_User_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Update_User_Details]
@User_Id                        Int				, 
@Username                       varchar(50)		, 
@First_Name                     nvarchar(60)	, 
@Middle_Name                    nvarchar(60)	, 
@Last_Name                      nvarchar(60)	, 
@Email                          varchar(100)	, 
@Country_Id                     SmallInt		,
@State_Id                       SmallInt		,
@City                           nvarchar(80)	,
@Address                        nvarchar(120)	,
@ZipCode                        nvarchar(10)	,
@Default_Currency_Id            TinyInt         ,
@Mobile_Phone                   varchar(20)		,
@Additional_Phone_Number        varchar(20)		, 
@Birth_Date                     DateTime        ,
@Gender                         TinyInt         ,
@Registration_DateTime_UTC      DateTime        ,
@Azure_Container_Ref            nvarchar(60)    , 
@Heard_About_Application_From   nvarchar(500)   ,   
@Our_Administrative_Side_Notes  nvarchar(500)   ,
@Is_Active                      Bit             ,
@Updating_User_Id               Int
As

UPDATE	[dbo].[t_TLBoard_Users]
SET		[Username] = @Username,
		[First_Name] = @First_Name ,
		[Middle_Name] = @Middle_Name ,
		[Last_Name] = @Last_Name ,
		[Email] = @Email , 
		[Country_Id] = @Country_Id,
		[State_Id] = @State_Id,
		[City] = @City,
		[Address] = @Address,
		[ZipCode] = @ZipCode,
        [Default_Currency_Id] = @Default_Currency_Id,
		[Mobile_Phone] = @Mobile_Phone,
		[Additional_Phone_Number] = @Additional_Phone_Number,
        Birth_Date = @Birth_Date,
        Gender = @Gender,
        Registration_DateTime_UTC = @Registration_DateTime_UTC,
        Azure_Container_Ref = @Azure_Container_Ref,
        Is_Active = @Is_Active,
        Heard_About_Application_From = @Heard_About_Application_From,
        Our_Administrative_Side_Notes = @Our_Administrative_Side_Notes,
        Record_Last_Updated_DateTime_UTC = GetUtcDate(),
        Record_Last_Updated_By_User_Id = @Updating_User_Id
WHERE	[User_Id] = @User_Id And (Is_Deleted = 0 Or Is_Deleted Is Null )

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Update_User_Details_Set_New_Password'  ))
Begin
	Drop Proc [p_TLBoard_Update_User_Details_Set_New_Password]
End

Go

Create Proc [dbo].[p_TLBoard_Update_User_Details_Set_New_Password]
@User_Id                        Int				, 
@Encrypted_Password             varchar(120)	, 
@Encryption_Random_Salt         varchar(120)	,
@Updating_User_Id               Int             
As

Update  [t_TLBoard_Users]
Set     Encrypted_Password      = @Encrypted_Password , 
        Encryption_Random_Salt  = @Encryption_Random_Salt
Where   [User_Id] = @User_Id And (Is_Deleted = 0 Or Is_Deleted Is Null )

Go

--Select * from t_TLBoard_Users

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_User_Details'  ))
Begin
	Drop Proc [p_TLBoard_Get_User_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Get_User_Details]
@User_Id Int
As

Select	[usr].[User_Id]							    ,
		[usr].[Username]							,
		[usr].[Encrypted_Password]				    ,
		[usr].[Encryption_Random_Salt]			    ,
		[usr].[App_Permission_Type_Id]			    ,
		[usr].[First_Name]						    ,
		[usr].[Middle_Name]						    ,
		[usr].[Last_Name]							,
		[usr].[Email]							    ,
		[usr].[Country_Id]						    ,
		[usr].[State_Id]							,
		[usr].[City]								,
		[usr].[Address]							    ,
		[usr].[ZipCode]							    ,
        [usr].[Default_Currency_Id]					,
		[usr].[Mobile_Phone]						,
		[usr].[Additional_Phone_Number]			    ,
		[usr].[Birth_Date]						    ,
		[usr].[Gender]							    ,
		[usr].[Registration_DateTime_UTC]			,
        [usr].Azure_Container_Ref                   ,
        [usr].Heard_About_Application_From          ,
        [usr].Our_Administrative_Side_Notes         ,
		[usr].[Record_Creation_DateTime_UTC]		,
		[usr].[Record_Created_By_User_Id]			,
		[usr].[Record_Last_Updated_DateTime_UTC]	,
		[usr].[Record_Last_Updated_By_User_Id]	    ,
		[usr].[Is_Deleted]						    ,
		[usr].[Is_Active]                           ,
        createdBy.First_Name As Created_By_First_Name, 
        createdBy.Last_Name As Created_By_Last_Name , 
		lastUpdatedBy.First_Name As Last_Updated_By_First_Name , 
        lastUpdatedBy.Last_Name As Last_Updated_By_Last_Name 
From	[dbo].[t_TLBoard_Users] [usr]
Join	t_TLBoard_Users createdBy On createdBy.[User_Id] = [usr].Record_Created_By_User_Id
Join	t_TLBoard_Users lastUpdatedBy On lastUpdatedBy.[User_Id] = [usr].Record_Last_Updated_By_User_Id
Where	[usr].[User_Id] = @User_Id

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_Expense_Details'  ))
Begin
	Drop Proc [p_TLBoard_Insert_Expense_Details]
End

Go

Create Proc [dbo].[p_TLBoard_Insert_Expense_Details]
@User_Id int, @Supplier_Id Int, @Expense_Invoice_DateTime DateTime,
@Currency_Id TinyInt, @Total_Amount Decimal(18,3), @Vat_Percentage Decimal(6,2),
@Total_Without_Vat Decimal(18,3), @Total_Vat Decimal(18,3), @Invoiced_Client_On_User_Location_Id int,
@Invoiced_Client_To_CompanyName NVarChar(150), @Invoiced_Client_To_Tax_Reference nvarchar(50),
@Invoiced_Client_To_PersonName NVarchar(100), @Invoiced_Client_To_PhoneNumber NVarChar(50), 
@Invoiced_Client_To_Country_Id SmallInt, @Invoiced_Client_To_State_Id SmallInt, @Invoiced_Client_To_City NVarChar(100), 
@Invoiced_Client_To_Address NVarChar(120), @Invoiced_Client_To_Zip NVarChar(10), @Invoiced_Client_To_EmailAddress NVarChar(120),
@Expense_Type_Id TinyInt, @Invoice_Number NVarChar(30), @Invoice_Reference_Number NVarChar(50),
@Invoice_Supplier_Company_Details NVarChar(120), 
@Invoice_Supplier_Tax_Reference NVarChar(50), @Invoice_Supplier_Country_Id SmallInt,
@Invoice_Supplier_State_Id SmallInt, @Invoice_Supplier_City NVarChar(100),
@Invoice_Supplier_Address_Description NVarChar(255),
@Invoice_Supplier_ZipCode NVarChar(10),
@Invoice_Supplier_WebAddress NVarChar(120), @Invoice_Supplier_Phone_Number NVarChar(50),
@Invoice_Supplier_Contact_FullName NVarChar(80), @Invoice_Content_Long_Description NVarChar(2000),
@User_Description NVarChar(1000), @User_Comments NVarChar(1000), @Original_File_Name nvarchar(255),
@Azure_Block_Blob_Reference NVarchar(256), @Is_Visible_To_Anonymous_Users bit,
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
			   ,[Invoiced_Client_To_Tax_Reference]
			   ,[Invoiced_Client_To_PersonName]
			   ,[Invoiced_Client_To_PhoneNumber]
			   ,[Invoiced_Client_To_Country_Id]
			   ,[Invoiced_Client_To_State_Id]
			   ,[Invoiced_Client_To_City]
			   ,[Invoiced_Client_To_Address]
			   ,[Invoiced_Client_To_Zip]
			   ,[Invoiced_Client_To_EmailAddress]
			   ,[Expense_Type_Id]
			   ,[Invoice_Number]
			   ,[Invoice_Reference_Number]
			   ,[Invoice_Supplier_Company_Details]
			   ,[Invoice_Supplier_Tax_Reference]
			   ,[Invoice_Supplier_Country_Id]
			   ,[Invoice_Supplier_State_Id]
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
				@Invoiced_Client_To_CompanyName, 
				@Invoiced_Client_To_Tax_Reference,
				@Invoiced_Client_To_PersonName,
				@Invoiced_Client_To_PhoneNumber, 
				@Invoiced_Client_To_Country_Id,
				@Invoiced_Client_To_State_Id,
			    @Invoiced_Client_To_City,
				@Invoiced_Client_To_Address,
				@Invoiced_Client_To_Zip, 
				@Invoiced_Client_To_EmailAddress,
				@Expense_Type_Id, @Invoice_Number, @Invoice_Reference_Number,
				@Invoice_Supplier_Company_Details, 
				@Invoice_Supplier_Tax_Reference, @Invoice_Supplier_Country_Id,
				@Invoice_Supplier_State_Id, @Invoice_Supplier_City,
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

Go


--Select * From [t_TLBoard_Expenses]

--delete from t_TLBoard_Suppliers

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Insert_User_Details_Administrative_Registration_Process'  ))
Begin
	Drop Proc [p_TLBoard_Insert_User_Details_Administrative_Registration_Process]
End

Go

Create Proc [dbo].[p_TLBoard_Insert_User_Details_Administrative_Registration_Process]
@Username varchar(50), 
@Encrypted_Password varchar(120), 
@Encryption_Random_Salt varchar(50),
@App_Permission_Type_Id TinyInt,
@First_Name nvarchar(60), 
@Middle_Name nvarchar(60),
@Last_Name nvarchar(60),
@Email varchar(100),
@Country_Id smallint,
@State_Id smallint,
@City nvarchar(80), 
@Address nvarchar(120),
@ZipCode varchar(10), 
@Default_Currency_Id TinyInt,
@Mobile_Phone varchar(20), 
@Additional_Phone_Number varchar(20),
@Birth_Date DateTime, 
@Gender TinyInt, 
@Heard_About_Application_From NVarChar(500), 
@Our_Administrative_Side_Notes NVarChar(500),
@Record_Created_By_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Users]
    ([Username]
    ,[Encrypted_Password]
    ,[Encryption_Random_Salt]
	,[App_Permission_Type_Id]
    ,[First_Name]
    ,[Middle_Name]
    ,[Last_Name]
    ,[Email]
    ,[Country_Id]
    ,[State_Id]
    ,[City]
    ,[Address]
    ,[ZipCode]
    ,[Default_Currency_Id]
    ,[Mobile_Phone]
    ,[Additional_Phone_Number]
	,[Birth_Date]
	,[Gender]
	,[Registration_DateTime_UTC]
	,[Heard_About_Application_From]
	,[Our_Administrative_Side_Notes]
    ,[Record_Creation_DateTime_UTC]
	,[Record_Created_By_User_Id]
    ,[Record_Last_Updated_DateTime_UTC]
    ,[Record_Last_Updated_By_User_Id])
VALUES (
	@Username , 
	@Encrypted_Password, 
	@Encryption_Random_Salt,
	@App_Permission_Type_Id, 
	@First_Name, 
	@Middle_Name,
	@Last_Name,
    @Email,
	@Country_Id, 
	@State_Id,
	@City,
	@Address,
	@ZipCode,
    @Default_Currency_Id,
	@Mobile_Phone,
	@Additional_Phone_Number,
	@Birth_Date , 
	@Gender , 
	GETUTCDATE(),
	@Heard_About_Application_From, 
	@Our_Administrative_Side_Notes, 
	GETUTCDATE(),
	@Record_Created_By_User_Id,
	GETUTCDATE(),
	@Record_Created_By_User_Id )


Select @@Identity;

Go

If (Exists ( Select id From sysobjects where xtype = 'P' and name = 'p_TLBoard_Get_Suppliers_List_By_User_Id'  ))
Begin
	Drop Proc [p_TLBoard_Get_Suppliers_List_By_User_Id]
End

Go

Create Proc [dbo].[p_TLBoard_Get_Suppliers_List_By_User_Id]
@User_Id Int, @Searching_User_Id Int
As

Select	Supplier_Id, [User_Id], Company_Name As Company_Name, Default_Currency_Id, Default_Vat_Percentage
From	t_TLBoard_Suppliers suppliers
Where	suppliers.[User_Id] = @User_Id And 
		suppliers.Is_Active = 1 And 
		suppliers.Is_Deleted = 0 

Go

--------------------- Added Default_Vat_Percentage for suppliers 

Go

ALTER Proc [dbo].[p_TLBoard_Update_Supplier_Details]
@Supplier_Id int, @Company_Name nvarchar(150),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt , @Default_Vat_Percentage Decimal(6,2),
@Telephone varchar(40), @Mobile_Phone varchar(40),
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number NVarChar(50),  
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100), 
@Main_Contact_Phone_Number nvarchar(50),
@Supplier_From_Date DateTime , @Supplier_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Updating_User_Id Int
As

Update	[dbo].[t_TLBoard_Suppliers]
Set		[Company_Name] = @Company_Name , 
		[Website_URL] = @Website_URL , 
		[Country_Id] = @Country_Id , 
		[State_Id] = @State_Id , 
		[City] = @City , 
		[Address] = @Address , 
		[ZipCode] = @ZipCode , 
		[Default_Currency_Id] = @Default_Currency_Id ,
        [Default_Vat_Percentage] = @Default_Vat_Percentage ,
		[Telephone] = @Telephone ,
		[Mobile_Phone] = @Mobile_Phone , 
		[Supplier_Type_Id] = @Supplier_Type_Id, 
		[Supplier_Tax_Reference_Number] = @Supplier_Tax_Reference_Number, 
		[Main_Contact_FullName] = @Main_Contact_FullName, 
		[Main_Contact_Email_Address] = @Main_Contact_Email_Address , 
		[Main_Contact_Phone_Number] = @Main_Contact_Phone_Number,
		[Supplier_From_Date] = @Supplier_From_Date, 
		[Supplier_To_Date] = @Supplier_To_Date, 
		[First_Contract_Date] = @First_Contract_Date,
		[First_Contract_Signed_With_Contact_Full_Name] = @First_Contract_Signed_With_Contact_Full_Name ,  
		[First_Contract_Signed_In_Location_Description] = @First_Contract_Signed_In_Location_Description,
		Is_Active = @Is_Active, 
		Record_Last_Updated_By_User_Id = @Updating_User_Id , 
		Record_Last_Updated_DateTime_UTC = GETUTCDATE() 
Where	Supplier_Id = @Supplier_Id And Is_Deleted = 0

Go


ALTER Proc [dbo].[p_TLBoard_Insert_Supplier_Details]
@User_Id int, @Company_Name nvarchar(100),
@Website_URL nvarchar(150), @Country_Id smallint,
@State_Id smallint, @City nvarchar(100),
@Address nvarchar(150), @ZipCode varchar(10),
@Default_Currency_Id TinyInt, @Default_Vat_Percentage Decimal(6,2), 
@Telephone varchar(40), @Mobile_Phone varchar(40), 
@Supplier_Type_Id smallint, @Supplier_Tax_Reference_Number nvarchar(20),
@Main_Contact_FullName nvarchar(100), @Main_Contact_Email_Address nvarchar(100),
@Main_Contact_Phone_Number nvarchar(50), 
@Client_From_Date DateTime , @Client_To_Date DateTime , @First_Contract_Date DateTime,
@First_Contract_Signed_With_Contact_Full_Name NVarChar(200) , 
@First_Contract_Signed_In_Location_Description	NVarChar(400) , 
@Is_Active Bit, @Record_Created_By_User_Id int
As

INSERT INTO [dbo].[t_TLBoard_Suppliers]
           ([User_Id] , [Company_Name], [Website_URL], 
		   [Country_Id], [State_Id], [City], [Address], [ZipCode],
		   [Default_Currency_Id],[Default_Vat_Percentage], 
           [Telephone]
           ,[Mobile_Phone]
           ,[Supplier_Type_Id]
           ,[Supplier_Tax_Reference_Number]
           ,[Main_Contact_FullName]
           ,[Main_Contact_Email_Address]
           ,[Main_Contact_Phone_Number]
		   ,[Supplier_From_Date], [Supplier_To_Date], [First_Contract_Date]
		   ,[First_Contract_Signed_With_Contact_Full_Name]  
		   ,[First_Contract_Signed_In_Location_Description] 
		   ,Is_Active
           ,[Record_Created_By_User_Id]
           ,[Record_Creation_DateTime_UTC]
           ,[Record_Last_Updated_By_User_Id]
           ,[Record_Last_Updated_DateTime_UTC]
           )
     VALUES
           (@User_Id , @Company_Name, @Website_URL, @Country_Id, @State_Id, @City,
			@Address, @ZipCode, @Default_Currency_Id, @Default_Vat_Percentage, 
			@Telephone, 
			@Mobile_Phone, @Supplier_Type_Id, @Supplier_Tax_Reference_Number,
			@Main_Contact_FullName, @Main_Contact_Email_Address, 
			@Main_Contact_Phone_Number, 
			@Client_From_Date, @Client_To_Date, @First_Contract_Date,
			@First_Contract_Signed_With_Contact_Full_Name, 
			@First_Contract_Signed_In_Location_Description,
			@Is_Active,
			@Record_Created_By_User_Id, 
			GETUTCDATE(), 
			@Record_Created_By_User_Id,
			GETUTCDATE()
           )

Select @@IDENTITY;

Go

--Select default_vat_percentage, *  From t_TLBoard_Suppliers

--Select *  From t_TLBoard_Expenses

Go