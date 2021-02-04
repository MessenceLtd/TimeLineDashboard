SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Insert_Invoice_Details]
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
