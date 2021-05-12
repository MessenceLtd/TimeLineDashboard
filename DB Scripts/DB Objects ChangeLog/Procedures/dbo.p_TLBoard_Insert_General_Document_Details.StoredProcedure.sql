SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Proc [p_TLBoard_Insert_General_Document_Details]
@User_Id int, @General_Document_Type SmallInt, @Title nvarchar(200),
@Description nvarchar(1500), @Document_Creation_DateTime datetime,
@Sent_By_Entity_Name nvarchar(100), @Sent_By_Entity_Country_Id smallint,
@Sent_By_Entity_State_Id smallint, @Sent_By_Entity_City nvarchar(100),
@Sent_By_Entity_Address nvarchar(150), @Sent_By_Entity_ZipCode nvarchar(20),
@Sent_By_Entity_DateTime datetime, @Sent_By_Entity_Email_Address nvarchar(100),
@Sent_To_Entity_Name nvarchar(100), @Sent_To_Entity_Country_Id smallint,
@Sent_To_Entity_State_Id smallint, @Sent_To_Entity_City nvarchar(100),
@Sent_To_Entity_Address nvarchar(150), @Sent_To_Entity_ZipCode nvarchar(20),
@Sent_To_Entity_Email_Address nvarchar(150), @Recieved_Document_DateTime datetime,
@Recieved_In_Country_Id smallint, @Recieved_In_State_Id smallint,
@Recieved_In_City nvarchar(100), @Recieved_In_Address nvarchar(150),
@Recieved_In_ZipCode nvarchar(20), @Recieved_In_Email_Address nvarchar(100),
@User_Comments nvarchar(500), @Recieved_By_User_Id int, @Recieved_DateTime datetime,
@Original_File_Name nvarchar(255), @Azure_Block_Blob_Reference nvarchar(255),
@Is_Visible_To_Anonymous_Users bit, @Is_Available_For_Download_For_Anonymous_Users bit,
@Is_Visible_To_Followers_Users bit, @Is_Available_For_Download_For_Followers_Users bit,
@Record_Created_By_User_Id int, @Record_Creation_DateTime_UTC datetime,
@Record_Last_Updated_By_User_Id int, @Record_Last_Updated_DateTime_UTC datetime,
@Is_Active bit
As

INSERT INTO [dbo].[t_TLBoard_General_Documents]
				([User_Id]
				,[General_Document_Type]
				,[Title]
				,[Description]
				,[Document_Creation_DateTime]
				,[Sent_By_Entity_Name]
				,[Sent_By_Entity_Country_Id]
				,[Sent_By_Entity_State_Id]
				,[Sent_By_Entity_City]
				,[Sent_By_Entity_Address]
				,[Sent_By_Entity_ZipCode]
				,[Sent_By_Entity_DateTime]
				,[Sent_By_Entity_Email_Address]
				,[Sent_To_Entity_Name]
				,[Sent_To_Entity_Country_Id]
				,[Sent_To_Entity_State_Id]
				,[Sent_To_Entity_City]
				,[Sent_To_Entity_Address]
				,[Sent_To_Entity_ZipCode]
				,[Sent_To_Entity_Email_Address]
				,[Recieved_Document_DateTime]
				,[Recieved_In_Country_Id]
				,[Recieved_In_State_Id]
				,[Recieved_In_City]
				,[Recieved_In_Address]
				,[Recieved_In_ZipCode]
				,[Recieved_In_Email_Address]
				,[User_Comments]
				,[Recieved_By_User_Id]
				,[Recieved_DateTime]
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
				,[Is_Active] )
     VALUES  (	@User_Id , @General_Document_Type , @Title ,
				@Description, @Document_Creation_DateTime ,
				@Sent_By_Entity_Name, @Sent_By_Entity_Country_Id,
				@Sent_By_Entity_State_Id, @Sent_By_Entity_City,
				@Sent_By_Entity_Address, @Sent_By_Entity_ZipCode,
				@Sent_By_Entity_DateTime, @Sent_By_Entity_Email_Address,
				@Sent_To_Entity_Name, @Sent_To_Entity_Country_Id,
				@Sent_To_Entity_State_Id, @Sent_To_Entity_City,
				@Sent_To_Entity_Address, @Sent_To_Entity_ZipCode,
				@Sent_To_Entity_Email_Address, 
				@Recieved_Document_DateTime,
				@Recieved_In_Country_Id, @Recieved_In_State_Id,
				@Recieved_In_City, @Recieved_In_Address,
				@Recieved_In_ZipCode, @Recieved_In_Email_Address,
				@User_Comments, @Recieved_By_User_Id , @Recieved_DateTime ,
				@Original_File_Name, @Azure_Block_Blob_Reference,
				@Is_Visible_To_Anonymous_Users, @Is_Available_For_Download_For_Anonymous_Users,
				@Is_Visible_To_Followers_Users, @Is_Available_For_Download_For_Followers_Users,
				@Record_Created_By_User_Id, @Record_Creation_DateTime_UTC,
				@Record_Last_Updated_By_User_Id, @Record_Last_Updated_DateTime_UTC,
				@Is_Active)

Select @@IDENTITY;

GO
