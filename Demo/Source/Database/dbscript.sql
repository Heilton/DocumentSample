USE [master]
GO
/****** Object:  Database [DocumentDb]    Script Date: 7/5/2022 10:27:13 AM ******/
CREATE DATABASE [DocumentDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DocumentDb', FILENAME = N'E:\Programs\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DocumentDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DocumentDb_log', FILENAME = N'E:\Programs\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DocumentDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DocumentDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DocumentDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DocumentDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DocumentDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DocumentDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DocumentDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DocumentDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DocumentDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DocumentDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DocumentDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DocumentDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DocumentDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DocumentDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DocumentDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DocumentDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DocumentDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DocumentDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DocumentDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DocumentDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DocumentDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DocumentDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DocumentDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DocumentDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DocumentDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DocumentDb] SET RECOVERY FULL 
GO
ALTER DATABASE [DocumentDb] SET  MULTI_USER 
GO
ALTER DATABASE [DocumentDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DocumentDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DocumentDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DocumentDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DocumentDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DocumentDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DocumentDb', N'ON'
GO
ALTER DATABASE [DocumentDb] SET QUERY_STORE = OFF
GO
USE [DocumentDb]
GO
/****** Object:  Schema [doc]    Script Date: 7/5/2022 10:27:14 AM ******/
CREATE SCHEMA [doc]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/5/2022 10:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [doc].[Document]    Script Date: 7/5/2022 10:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[Document](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FileKey] [uniqueidentifier] NOT NULL,
	[DocumentName] [nvarchar](100) NOT NULL,
	[DownloadCount] [int] NOT NULL,
	[DocumentTypeId] [int] NOT NULL,
	[RegistrationDate] [datetime2](3) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [doc].[DocumentType]    Script Date: 7/5/2022 10:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [doc].[DocumentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[FileExtension] [nvarchar](50) NOT NULL,
	[MaximomSizeKB] [int] NOT NULL,
	[ContentType] [nvarchar](50) NOT NULL,
	[IconName] [nvarchar](50) NOT NULL,
	[IsUploadClosed] [bit] NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[CreatorUserId] [bigint] NULL,
	[DeleterUserId] [bigint] NULL,
	[DeletionDate] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220705175153_12_', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220705175737_125', N'6.0.0')
GO
SET IDENTITY_INSERT [doc].[Document] ON 

INSERT [doc].[Document] ([Id], [FileKey], [DocumentName], [DownloadCount], [DocumentTypeId], [RegistrationDate], [CreatorUserId], [DeleterUserId], [DeletionDate], [IsDeleted]) VALUES (1, N'a81bd1f0-0a42-40ea-b029-ff05e2f998b8', N'original.png', 1, 2, CAST(N'2022-07-05T10:03:41.3200000' AS DateTime2), 1, NULL, NULL, 0)
INSERT [doc].[Document] ([Id], [FileKey], [DocumentName], [DownloadCount], [DocumentTypeId], [RegistrationDate], [CreatorUserId], [DeleterUserId], [DeletionDate], [IsDeleted]) VALUES (2, N'1a7f2ca9-fc83-4cff-a3ce-4f39e8742a38', N'link.txt', 0, 4, CAST(N'2022-07-05T10:04:23.7200000' AS DateTime2), 1, NULL, NULL, 0)
SET IDENTITY_INSERT [doc].[Document] OFF
GO
SET IDENTITY_INSERT [doc].[DocumentType] ON 

INSERT [doc].[DocumentType] ([Id], [TypeName], [FileExtension], [MaximomSizeKB], [ContentType], [IconName], [IsUploadClosed], [RegistrationDate], [CreatorUserId], [DeleterUserId], [DeletionDate], [IsDeleted]) VALUES (2, N'png File', N'png', 100, N'image/png', N'image.png', 0, CAST(N'2022-07-05T10:01:00.0000000' AS DateTime2), 1, NULL, NULL, 0)
INSERT [doc].[DocumentType] ([Id], [TypeName], [FileExtension], [MaximomSizeKB], [ContentType], [IconName], [IsUploadClosed], [RegistrationDate], [CreatorUserId], [DeleterUserId], [DeletionDate], [IsDeleted]) VALUES (4, N'Text  File', N'txt', 200, N'text/plain', N'txt.jpg', 0, CAST(N'2022-07-05T10:01:00.0000000' AS DateTime2), 1, NULL, NULL, 0)
INSERT [doc].[DocumentType] ([Id], [TypeName], [FileExtension], [MaximomSizeKB], [ContentType], [IconName], [IsUploadClosed], [RegistrationDate], [CreatorUserId], [DeleterUserId], [DeletionDate], [IsDeleted]) VALUES (5, N'jpg File', N'jpg', 150, N'image/jpeg', N'image.png', 1, CAST(N'2022-07-05T10:01:00.0000000' AS DateTime2), 1, NULL, NULL, 0)
SET IDENTITY_INSERT [doc].[DocumentType] OFF
GO
/****** Object:  Index [IX_Document_DocumentTypeId]    Script Date: 7/5/2022 10:27:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_Document_DocumentTypeId] ON [doc].[Document]
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [doc].[Document] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [doc].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_DocumentType_DocumentTypeId] FOREIGN KEY([DocumentTypeId])
REFERENCES [doc].[DocumentType] ([Id])
GO
ALTER TABLE [doc].[Document] CHECK CONSTRAINT [FK_Document_DocumentType_DocumentTypeId]
GO
USE [master]
GO
ALTER DATABASE [DocumentDb] SET  READ_WRITE 
GO
