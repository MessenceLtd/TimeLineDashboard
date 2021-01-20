USE [DashboardTimeLine]
GO

/****** Object:  Table [dbo].[UserEntities]    Script Date: 19/01/2021 21:06:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserEntities](
	[UserEntityId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreationDateTime] [datetime2](7) NOT NULL,
	[EntityName] [nvarchar](100) NOT NULL,
	[EntityEmail] [nvarchar](100) NOT NULL,
	[EntityType] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UserDetailsUserId] [int] NULL,
 CONSTRAINT [PK_UserEntities] PRIMARY KEY CLUSTERED 
(
	[UserEntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UserEntitySpotifyLibrarySongs]    Script Date: 19/01/2021 21:06:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserEntitySpotifyLibrarySongs](
	[UserLibrarySongId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserDetailsUserId] [int] NULL,
	[SongName] [nvarchar](200) NOT NULL,
	[addedOn] [datetime2](7) NOT NULL,
	[Artists] [nvarchar](300) NOT NULL,
	[StreamUrl] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_UserEntitySpotifyLibrarySongs] PRIMARY KEY CLUSTERED 
(
	[UserLibrarySongId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UserEntityBankAccounts]    Script Date: 19/01/2021 21:06:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserEntityBankAccounts](
	[UserEntityBankAccountId] [int] IDENTITY(1,1) NOT NULL,
	[UserEntityId] [int] NOT NULL,
	[UserEntityDetailsUserEntityId] [int] NULL,
	[BankAccountNumber] [nvarchar](15) NOT NULL,
	[BankBranchNumber] [nvarchar](10) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[BankNumber] [int] NOT NULL,
	[BankName] [nvarchar](50) NOT NULL,
	[BankAccountIBANNumber] [nvarchar](50) NOT NULL,
	[BankAccountSwiftCode] [nvarchar](50) NOT NULL,
	[BankAccountCreationDateTime] [datetime2](7) NULL,
	[BankAccountRecordCreationDateTime] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsBankAccountClosed] [bit] NOT NULL,
	[BankAccountClosureDateTime] [datetime2](7) NULL,
 CONSTRAINT [PK_UserEntityBankAccounts] PRIMARY KEY CLUSTERED 
(
	[UserEntityBankAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[UserEntityBankAccountEntries]    Script Date: 19/01/2021 21:06:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserEntityBankAccountEntries](
	[UserEntityBankAccountEntryId] [int] IDENTITY(1,1) NOT NULL,
	[UserEntityBankAccountId] [int] NOT NULL,
	[BankAccountDetailsUserEntityBankAccountId] [int] NULL,
	[CurrentEntryBalanceCredit] [float] NULL,
	[CurrentEntryValueDateTime] [datetime2](7) NULL,
	[PositiveCreditToBalance] [float] NULL,
	[NagativeCreditToBalance] [float] NULL,
	[BankAccountEntryDateTime] [datetime2](7) NOT NULL,
	[EntryReference1] [nvarchar](20) NOT NULL,
	[EntryReferenceDescription] [nvarchar](40) NOT NULL,
	[EntryReference2] [nvarchar](20) NOT NULL,
	[EntryUserEntityDescription] [nvarchar](250) NULL,
	[BankAccountEntryRowCreationDateTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserEntityBankAccountEntries] PRIMARY KEY CLUSTERED 
(
	[UserEntityBankAccountEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 19/01/2021 21:06:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[EcryptedPassword] [nvarchar](100) NULL,
	[EncryptionRandomSalt] [nvarchar](100) NULL,
	[LastPasswordChangeDate] [datetime] NULL,
	[BirthDate] [smalldatetime] NOT NULL,
	[CountryCode] [nvarchar](20) NOT NULL,
	[CountryName] [nvarchar](80) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchived] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[UserEntities]  WITH CHECK ADD  CONSTRAINT [FK_UserEntities_Users_UserDetailsUserId] FOREIGN KEY([UserDetailsUserId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[UserEntities] CHECK CONSTRAINT [FK_UserEntities_Users_UserDetailsUserId]
GO

ALTER TABLE [dbo].[UserEntitySpotifyLibrarySongs]  WITH CHECK ADD  CONSTRAINT [FK_UserEntitySpotifyLibrarySongs_Users_UserDetailsUserId] FOREIGN KEY([UserDetailsUserId])
REFERENCES [dbo].[Users] ([UserId])
GO

ALTER TABLE [dbo].[UserEntitySpotifyLibrarySongs] CHECK CONSTRAINT [FK_UserEntitySpotifyLibrarySongs_Users_UserDetailsUserId]
GO

ALTER TABLE [dbo].[UserEntityBankAccounts]  WITH CHECK ADD  CONSTRAINT [FK_UserEntityBankAccounts_UserEntities_UserEntityDetailsUserEntityId] FOREIGN KEY([UserEntityDetailsUserEntityId])
REFERENCES [dbo].[UserEntities] ([UserEntityId])
GO

ALTER TABLE [dbo].[UserEntityBankAccounts] CHECK CONSTRAINT [FK_UserEntityBankAccounts_UserEntities_UserEntityDetailsUserEntityId]
GO

ALTER TABLE [dbo].[UserEntityBankAccountEntries]  WITH CHECK ADD  CONSTRAINT [FK_UserEntityBankAccountEntries_UserEntityBankAccounts_BankAccountDetailsUserEntityBankAccountId] FOREIGN KEY([BankAccountDetailsUserEntityBankAccountId])
REFERENCES [dbo].[UserEntityBankAccounts] ([UserEntityBankAccountId])
GO

ALTER TABLE [dbo].[UserEntityBankAccountEntries] CHECK CONSTRAINT [FK_UserEntityBankAccountEntries_UserEntityBankAccounts_BankAccountDetailsUserEntityBankAccountId]
GO



CREATE Proc [dbo].[spTLDB_SelectUserDetailsByUserId]
@UserId Int
As

Select * 
From [dbo].[Users]
Where UserId = @UserId

GO

/****** Object:  StoredProcedure [dbo].[spTLDB_SelectUserDetailsByUsername]    Script Date: 19/01/2021 21:06:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[spTLDB_SelectUserDetailsByUsername]
@Username nvarchar(100)
As

Select * 
From [dbo].[Users]
Where Username = @Username

GO

/****** Object:  StoredProcedure [dbo].[spTLDB_InsertUser]    Script Date: 19/01/2021 21:06:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE Proc [dbo].[spTLDB_InsertUser]
@Firstname nvarchar(50) , @LastName nvarchar(50) , @MiddleName nvarchar(50) ,
@Username nvarchar(100), @Email nvarchar(100) , @EcryptedPassword nvarchar(100) ,
@EncryptionRandomSalt NVarchar(100), @BirthDate SmallDatetime, @CountryCode nvarchar(20),
@CountryName NVarchar(80), @RegistrationDate DateTime, @IsActive Bit
As

INSERT INTO [dbo].[Users]
           (	[FirstName] , [LastName] , [MiddleName] ,
				[Username] , [Email] , [EcryptedPassword] , [EncryptionRandomSalt] , 
				[BirthDate] , [CountryCode] , [CountryName] , [RegistrationDate], [IsActive], [IsArchived] , [IsDeleted] )
     VALUES (	@FirstName , @LastName , @MiddleName, 
				@Username , @Email, @EcryptedPassword, @EncryptionRandomSalt, @BirthDate,@CountryCode,
				@CountryName , @RegistrationDate , @IsActive, 0 , 0 )

Declare @UserId Int = @@IDENTITY;

Exec spTLDB_SelectUserDetailsByUserId @UserId;

GO

/****** Object:  StoredProcedure [dbo].[spTLDB_SelectUsers]    Script Date: 19/01/2021 21:06:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[spTLDB_SelectUsers]
As

Select * 
From Users

GO


