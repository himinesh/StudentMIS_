USE [master]
GO
/****** Object:  Database [GoodWoodDB]    Script Date: 5/4/2016 2:52:52 PM ******/
CREATE DATABASE [GoodWoodDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'goodwooddb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\goodwooddb.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'goodwooddb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\goodwooddb_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GoodWoodDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GoodWoodDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GoodWoodDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GoodWoodDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GoodWoodDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GoodWoodDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GoodWoodDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GoodWoodDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GoodWoodDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GoodWoodDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GoodWoodDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GoodWoodDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GoodWoodDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GoodWoodDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GoodWoodDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GoodWoodDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GoodWoodDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GoodWoodDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GoodWoodDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GoodWoodDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GoodWoodDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GoodWoodDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GoodWoodDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GoodWoodDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GoodWoodDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GoodWoodDB] SET RECOVERY FULL 
GO
ALTER DATABASE [GoodWoodDB] SET  MULTI_USER 
GO
ALTER DATABASE [GoodWoodDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GoodWoodDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GoodWoodDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GoodWoodDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GoodWoodDB', N'ON'
GO
USE [GoodWoodDB]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBatch]    Script Date: 5/4/2016 2:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteBatch]
@Id int
AS
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM Batches WHERE Id = @Id;
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[DeleteBatchStudent]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteBatchStudent]
@Id int
AS
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM BatcheStudents WHERE Id = @Id;
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[DeleteCourse]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteCourse]
@Id int
AS
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM Courses WHERE Id = @Id;
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteStudent]
@Id int
AS
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM Students WHERE Id = @Id;
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUser]
@Id int
AS
	BEGIN TRY
		BEGIN TRAN
			DELETE FROM Users WHERE Id = @Id;
		COMMIT
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
		ROLLBACK
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[EditBatch]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditBatch]
@Id int,
	@CID int,
	@Code varchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		UPDATE Batches SET CID = @CID, Code = @Code, StartDate = @StartDate, EndDate = @EndDate, @IsActive = @IsActive WHERE Id = @Id;
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[EditBatchStudent]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditBatchStudent]
@Id int,
	@BID int,
	@SID int,
	@EnrollmentDate datetime,
	@Completed bit,
	@CompletionDate datetime,
	@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		UPDATE BatcheStudents SET BID = @BID, SID = @SID, @EnrollmentDate = @EnrollmentDate, Completed = @Completed, CompletionDate = @CompletionDate, IsActive = @IsActive WHERE Id = @Id;
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[EditCourse]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditCourse]
@Id int,
@Name varchar(50),
@Description varchar(250),
@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		UPDATE Courses SET Name = @Name, Description = @Description, IsActive = @IsActive WHERE Id = @Id;
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[EditStudent]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditStudent]
@Id int,
@Name varchar(50),
@Email varchar(250)
AS
BEGIN TRY
	BEGIN TRAN
		UPDATE Students SET Name = @Name, Email = @Email WHERE Id = @Id;
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditUser]
@Id int,
@UserName varchar(50),
@Password varchar(50),
@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		UPDATE Users SET UserName = @UserName, Password = @Password, IsActive = @IsActive WHERE Id = @Id;
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[InsertBatch]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBatch]
	@CID int,
	@Code varchar(50),
	@StartDate datetime,
	@EndDate datetime,
	@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		INSERT INTO Batches(CID, Code, Startdate, EndDate,IsActive )
					 VALUES(@CID, @Code, @StartDate, @EndDate, @IsActive);
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH	

GO
/****** Object:  StoredProcedure [dbo].[InsertBatchStudent]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBatchStudent]
	@BID int,
	@SID int,
	@EnrollmentDate datetime,
	@Completed bit,
	@CompletionDate datetime,
	@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		INSERT INTO BatcheStudents(BID, SID, EnrollementDate, Completed, CompletionDate, IsActive )
					 VALUES(@BID, @SID, @EnrollmentDate, @Completed, @CompletionDate, @IsActive);
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH	

GO
/****** Object:  StoredProcedure [dbo].[InsertCourse]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCourse]
	@Name varchar(50),
	@Description varchar(250),
	@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		INSERT INTO Courses(Name,Description,IsActive ) VALUES (@Name,@Description,@IsActive);
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH	

GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudent]
	@Name varchar(50),
	@Email varchar(250)
AS
BEGIN TRY
	BEGIN TRAN
		INSERT INTO Students(Name,Email) VALUES (@Name,@Email);
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH	

GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--use GoodWoodDB;
CREATE PROCEDURE [dbo].[InsertUser]
	@UserName varchar(50),
	@Password varchar(50),
	@IsActive bit
AS
BEGIN TRY
	BEGIN TRAN
		INSERT INTO Users(UserName,Password,IsActive ) VALUES (@UserName,@Password,@IsActive);
	COMMIT
END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
	ROLLBACK
END CATCH	

GO
/****** Object:  StoredProcedure [dbo].[SelectBatchById]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectBatchById]
@Id int
AS
	BEGIN
		BEGIN TRAN
			SELECT * FROM Batches WHERE Id = @Id;
		COMMIT
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectBatchByLimit]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBatchByLimit]

@From int,
@Until int
AS
	BEGIN
		IF @From = 0 AND @Until = 0
			SELECT * FROM Batches;	
		ELSE
			SELECT * FROM Batches WHERE Id BETWEEN @From AND @Until;
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectBatchStudentById]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBatchStudentById]
@Id int
AS
	BEGIN
		BEGIN TRAN
			SELECT * FROM BatchesStudents WHERE Id = @Id;
		COMMIT
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectBatchStudentByLimit]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBatchStudentByLimit]

@From int,
@Until int
AS
	BEGIN
		IF @From = 0 AND @Until = 0
			SELECT * FROM BatcheStudents;	
		ELSE
			SELECT * FROM BatcheStudents WHERE Id BETWEEN @From AND @Until;
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectCourseById]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectCourseById]
@Id int
AS
	BEGIN
		BEGIN TRAN
			SELECT * FROM Courses WHERE Id = @Id;
		COMMIT
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectCourseByLimit]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectCourseByLimit]
@From int,
@Until int
AS
	BEGIN
		IF @From = 0 AND @Until = 0
			SELECT * FROM Courses;	
		ELSE
			SELECT * FROM Courses WHERE Id BETWEEN @From AND @Until;
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectStudentById]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectStudentById]
@Id int
AS
	BEGIN
		BEGIN TRAN
			SELECT * FROM Students WHERE Id = @Id;
		COMMIT
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectStudentByLimit]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectStudentByLimit]

@From int,
@Until int
AS
	BEGIN
		IF @From = 0 AND @Until = 0
			SELECT * FROM Students;	
		ELSE
			SELECT * FROM Students WHERE Id BETWEEN @From AND @Until;
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectUserById]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectUserById]
@Id int
AS
	BEGIN
		BEGIN TRAN
			SELECT * FROM users WHERE Id = @Id;
		COMMIT
	END

GO
/****** Object:  StoredProcedure [dbo].[SelectUserByLimit]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectUserByLimit]
@From int,
@Until int
AS
	BEGIN
		IF @From = 0 AND @Until = 0
			SELECT * FROM Users;	
		ELSE
			SELECT * FROM Users WHERE Id BETWEEN @From AND @Until;
	END

GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Batches]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Batches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CID] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BatchStudents]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchStudents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BID] [int] NULL,
	[SID] [int] NULL,
	[EnrollmentDate] [datetime] NULL,
	[Completed] [bit] NULL,
	[CompletionDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_BatchStudents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BatchViewModels]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchViewModels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SelectedValue] [int] NOT NULL,
	[Course_Id] [int] NULL,
 CONSTRAINT [PK_dbo.BatchViewModels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [text] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/4/2016 2:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/4/2016 2:52:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/4/2016 2:52:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/4/2016 2:52:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 5/4/2016 2:52:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 5/4/2016 2:52:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/4/2016 2:52:53 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course_Id]    Script Date: 5/4/2016 2:52:53 PM ******/
CREATE NONCLUSTERED INDEX [IX_Course_Id] ON [dbo].[BatchViewModels]
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Batches]  WITH CHECK ADD  CONSTRAINT [FK_Batch_Course] FOREIGN KEY([CID])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Batches] CHECK CONSTRAINT [FK_Batch_Course]
GO
ALTER TABLE [dbo].[BatchStudents]  WITH CHECK ADD  CONSTRAINT [FK_BatchStudents_Batches] FOREIGN KEY([BID])
REFERENCES [dbo].[Batches] ([Id])
GO
ALTER TABLE [dbo].[BatchStudents] CHECK CONSTRAINT [FK_BatchStudents_Batches]
GO
ALTER TABLE [dbo].[BatchStudents]  WITH CHECK ADD  CONSTRAINT [FK_BatchStudents_Students] FOREIGN KEY([SID])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[BatchStudents] CHECK CONSTRAINT [FK_BatchStudents_Students]
GO
ALTER TABLE [dbo].[BatchViewModels]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BatchViewModels_dbo.Courses_Course_Id] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[BatchViewModels] CHECK CONSTRAINT [FK_dbo.BatchViewModels_dbo.Courses_Course_Id]
GO
USE [master]
GO
ALTER DATABASE [GoodWoodDB] SET  READ_WRITE 
GO
