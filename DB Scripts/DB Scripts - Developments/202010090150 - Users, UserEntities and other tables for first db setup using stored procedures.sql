
Alter Proc spTLDB_SelectUsers
As

Select * 
From Users

Go


Alter Proc spTLDB_InsertUser
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

Go

Alter Proc spTLDB_SelectUserDetailsByUsername
@Username nvarchar(100)
As

Select * 
From [dbo].[Users]
Where Username = @Username

Go


Alter Proc spTLDB_SelectUserDetailsByUserId
@UserId Int
As

Select * 
From [dbo].[Users]
Where UserId = @UserId

Go
