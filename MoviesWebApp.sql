USE [master]
GO
/****** Object:  Database [MoviesWebAppContext]    Script Date: 11/9/2024 1:00:38 PM ******/
CREATE DATABASE [MoviesWebAppContext]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MoviesWebAppContext', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MoviesWebAppContext.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MoviesWebAppContext_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MoviesWebAppContext_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MoviesWebAppContext] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoviesWebAppContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoviesWebAppContext] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET ARITHABORT OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MoviesWebAppContext] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MoviesWebAppContext] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MoviesWebAppContext] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MoviesWebAppContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MoviesWebAppContext] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MoviesWebAppContext] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MoviesWebAppContext] SET  MULTI_USER 
GO
ALTER DATABASE [MoviesWebAppContext] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MoviesWebAppContext] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MoviesWebAppContext] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MoviesWebAppContext] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MoviesWebAppContext] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MoviesWebAppContext] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MoviesWebAppContext] SET QUERY_STORE = ON
GO
ALTER DATABASE [MoviesWebAppContext] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MoviesWebAppContext]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/9/2024 1:00:39 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [int] NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UserComment] [nvarchar](3000) NOT NULL,
	[DateOfComment] [datetime2](7) NOT NULL,
	[DateOfEdit] [datetime2](7) NOT NULL,
	[ToCommentId] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentLikeDislike]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentLikeDislike](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CommentLikeDislike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryMovie]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryMovie](
	[CountryId] [int] NOT NULL,
	[MoviesId] [int] NOT NULL,
 CONSTRAINT [PK_CountryMovie] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC,
	[MoviesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenreMovie]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenreMovie](
	[GenreId] [int] NOT NULL,
	[MoviesId] [int] NOT NULL,
 CONSTRAINT [PK_GenreMovie] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC,
	[MoviesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageUrl] [nvarchar](2000) NULL,
	[DurationMinutes] [time](7) NOT NULL,
	[Budget] [decimal](18, 2) NULL,
	[PriceCurrency] [tinyint] NOT NULL,
	[BudgetCurrency] [tinyint] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[MovieUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[UserRating] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViewCount]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewCount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_ViewCount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchList]    Script Date: 11/9/2024 1:00:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_WatchList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240919150245_First', N'6.0.33')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240921064601_Second', N'6.0.33')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240921081545_Third', N'6.0.33')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240925111912_Fourth', N'6.0.33')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240930140744_Fifth', N'6.0.33')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240930150542_Six', N'6.0.33')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'Admin', N'ADMIN', N'e7f2df04-dddd-40f3-8a76-bd2b45ec5951')
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (18, 1)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (18, N'Musa', N'MUSA', N'musabaxsiyev2005@gmail.com', N'MUSABAXSIYEV2005@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEA7k4W90sP2LRd/K9H6bNLtmwsxKUdPbT3YxSkVGa6s8PD4/RI4WMG0PLU3Z7m056A==', N'IUTI72V6QIGPVCKA62EB2Q4HAXKL4OFG', N'8f743da1-0e53-40c1-a050-ef3f9a68a2ac', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (19, N'MusaBakhshiyev', N'MUSABAKHSHIYEV', N'musabakhshiyev2005@gmail.com', N'MUSABAKHSHIYEV2005@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEOfINiv6P5w0G0LKoQJurP24ViCCmTYxQSNiuIGwLoWPoGiAD+WlQPJj2Yfq383jow==', N'627W7W5BNUJ2KOXVU3XY7IFUATBY26QP', N'e74b58b9-c58d-4c9a-a696-90bb8614d0e9', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([Id], [MovieId], [UserId], [UserComment], [DateOfComment], [DateOfEdit], [ToCommentId]) VALUES (14, 1, 18, N'I hope the number this movies will increase in the future. ', CAST(N'2024-09-22T16:14:18.6548389' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Comment] ([Id], [MovieId], [UserId], [UserComment], [DateOfComment], [DateOfEdit], [ToCommentId]) VALUES (15, 1, 19, N'It is the best movies of Azerbaijan film studio after our old movies.', CAST(N'2024-09-22T16:15:29.2622602' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
GO
INSERT [dbo].[Comment] ([Id], [MovieId], [UserId], [UserComment], [DateOfComment], [DateOfEdit], [ToCommentId]) VALUES (16, 1, 18, N'Yes you are right.', CAST(N'2024-09-22T16:38:06.5962091' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 15)
GO
INSERT [dbo].[Comment] ([Id], [MovieId], [UserId], [UserComment], [DateOfComment], [DateOfEdit], [ToCommentId]) VALUES (18, 1, 19, N'I hope too.', CAST(N'2024-09-22T16:52:47.1118207' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 14)
GO
INSERT [dbo].[Comment] ([Id], [MovieId], [UserId], [UserComment], [DateOfComment], [DateOfEdit], [ToCommentId]) VALUES (19, 2, 19, N'Music of this movie is best!!!!', CAST(N'2024-11-09T12:27:19.4966670' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[CommentLikeDislike] ON 
GO
INSERT [dbo].[CommentLikeDislike] ([Id], [CommentId], [UserId], [Type]) VALUES (21, 15, 18, N'Like')
GO
INSERT [dbo].[CommentLikeDislike] ([Id], [CommentId], [UserId], [Type]) VALUES (22, 14, 19, N'Like')
GO
INSERT [dbo].[CommentLikeDislike] ([Id], [CommentId], [UserId], [Type]) VALUES (23, 16, 19, N'Like')
GO
INSERT [dbo].[CommentLikeDislike] ([Id], [CommentId], [UserId], [Type]) VALUES (24, 15, 19, N'Like')
GO
SET IDENTITY_INSERT [dbo].[CommentLikeDislike] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (1, N'Australia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (2, N'Austria')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (3, N'Azerbaijan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (4, N'Bangladesh')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (5, N'Belarus')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (6, N'Belgium')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (7, N'Bolivia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (8, N'Brazil')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (9, N'Bulgaria')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (10, N'Canada')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (11, N'China')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (12, N'Czech Republic')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (13, N'Denmark')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (14, N'Egypt')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (15, N'Estonia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (16, N'Finland')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (17, N'France')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (18, N'Georgia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (19, N'Germany')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (20, N'Greece')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (21, N'Hungary')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (22, N'Iceland')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (23, N'India')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (24, N'Indonesia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (25, N'Iran')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (26, N'Iraq')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (27, N'Ireland')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (28, N'Israel')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (29, N'Italy')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (30, N'Japan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (31, N'Kazakhstan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (32, N'Kenya')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (33, N'Korea, South')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (34, N'Kyrgyzstan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (35, N'Latvia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (36, N'Liberia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (37, N'Libya')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (38, N'Malaysia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (39, N'Mexico')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (40, N'Moldova')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (41, N'Monaco')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (42, N'Morocco')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (43, N'Netherlands')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (44, N'New Zealand')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (45, N'Norway')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (46, N'Oman')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (47, N'Pakistan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (48, N'Poland')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (49, N'Portugal')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (50, N'Qatar')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (51, N'Romania')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (52, N'Russia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (53, N'Saudi Arabia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (54, N'Singapore')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (55, N'Slovakia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (56, N'Slovenia')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (57, N'Spain')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (58, N'Sweden')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (59, N'Switzerland')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (60, N'Tajikistan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (61, N'Turkey')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (62, N'Turkmenistan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (63, N'Ukraine')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (64, N'United Arab Emirates')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (65, N'United Kingdom')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (66, N'United States')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (67, N'Uzbekistan')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (68, N'Vatican City')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (69, N'Venezuela')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (70, N'Vietnam')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (71, N'Yemen')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (72, N'Zambia')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
INSERT [dbo].[CountryMovie] ([CountryId], [MoviesId]) VALUES (3, 1)
GO
INSERT [dbo].[CountryMovie] ([CountryId], [MoviesId]) VALUES (3, 2)
GO
INSERT [dbo].[CountryMovie] ([CountryId], [MoviesId]) VALUES (3, 4)
GO
INSERT [dbo].[CountryMovie] ([CountryId], [MoviesId]) VALUES (3, 6)
GO
INSERT [dbo].[CountryMovie] ([CountryId], [MoviesId]) VALUES (3, 7)
GO
INSERT [dbo].[CountryMovie] ([CountryId], [MoviesId]) VALUES (3, 8)
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (1, N'Action')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (2, N'Adventure')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (3, N'Animation')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (4, N'Comedy')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (5, N'Crime')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (6, N'Documentary')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (7, N'Drama')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (8, N'Family')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (9, N'Fantasy')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (10, N'History')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (11, N'Horror')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (12, N'Music')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (13, N'Mystery')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (14, N'Romance')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (15, N'Science Fiction')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (16, N'TV Movie')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (17, N'Thriller')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (18, N'War')
GO
INSERT [dbo].[Genre] ([Id], [Name]) VALUES (19, N'Western')
GO
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (7, 1)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (10, 1)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (18, 1)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (7, 2)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (18, 2)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (4, 4)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (12, 4)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (14, 4)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (7, 6)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (18, 6)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (10, 7)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (18, 7)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (10, 8)
GO
INSERT [dbo].[GenreMovie] ([GenreId], [MoviesId]) VALUES (18, 8)
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [ReleaseDate], [Price], [ImageUrl], [DurationMinutes], [Budget], [PriceCurrency], [BudgetCurrency], [CreationTime], [MovieUrl]) VALUES (1, N'Yarımchig Khatiralar', N'The film is about a soldier who fought in the Battle of Brest in 1941 and took up arms again 50 years later during the Nagorno-Karabakh War. The events in the film reflect a Russian officer''s perspective on the Nagorno-Karabakh conflict.

Filming took place in Baku, Brest, Minsk, and the town of Vileyka in Belarus. The film is dedicated to the 70th anniversary of the Victory over Fascism in World War II. The working title of the film was "The Soldier''s Valor."

Director: Elxan Cəfərov
Screenwriters: Konstantin Vorobyov, Yavər Rzayev
Cinematographer: Nadir Mehdiyev
Artists: Vadim Şafranski, Rafiq Nəsirov
Composer: Polad Bülbüloğlu
Cast: Bəhruz Vaqifoğlu (Azər), Mixail Kaminski (Captain Ivanov), Georgi Tsaava (Artavazd), Gülzar Qurbanova (Janna), Andrey Milyuxin (Stankeviç), Zurab Nijaradze (Rantik), Veronika Plyaşkeviç (Nadya)', CAST(N'2015-05-09T00:00:00.0000000' AS DateTime2), 50, N'48cc59cb-16d2-463e-b841-43cd2279caeb.jpg', CAST(N'01:51:35' AS Time), CAST(2000000.00 AS Decimal(18, 2)), 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'https://www.youtube.com/embed/9RC5KJRxN6Q?si=NTWfIwT4Rv917u6Y')
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [ReleaseDate], [Price], [ImageUrl], [DurationMinutes], [Budget], [PriceCurrency], [BudgetCurrency], [CreationTime], [MovieUrl]) VALUES (2, N'Sharikli Chorek', N'The film tells the story of the difficult lives of children during the final days of World War II and the first months after the war.

Director: Shamil Mahmudbeyov
Screenwriter: Alla Akhundova
Cinematographer: Teyyub Akhundov
Artist: Fikret Baghirov
Composer: Vasif Adigozalov
Cast: Kamran Rajabli (Vagif), Tuna Namazova (Leyla), Firuz Aliyev (Tofiq), Khosrov Mamayev (Ashraf), Mirzaaga Mirzayev II (Kenka), Chingiz Guliyev (Mishka), Jamila Mammadova (Jamila), Adila Mammadova II (Adila), Yelena Inyakina (Lina), Sədaya Mustafayeva (Shamama)', CAST(N'1969-10-30T00:00:00.0000000' AS DateTime2), 50, N'a830051a-28ac-4d69-a11b-19111511d32e.jpg', CAST(N'01:06:01' AS Time), NULL, 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'https://www.youtube.com/embed/88uxFYb1354?si=4mtQ-0iUYjp3BXU3')
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [ReleaseDate], [Price], [ImageUrl], [DurationMinutes], [Budget], [PriceCurrency], [BudgetCurrency], [CreationTime], [MovieUrl]) VALUES (4, N'O Olmasin, Bu Olsun', N'The film is set in Baku in 1910 and tells the story of the pure love between two young people, Servant and Gulnaz. It explores how their love triumphs over money, ignorance, and feudal remnants. Alongside the main characters, the film features a range of secondary characters, including merchants, traders, strongmen, reactionaries, and traitorous journalists.

The film is based on the motifs from Uzeyir Hajibeyov''s operetta "O Olmasın, Bu Olsun." It is notable for being the first color feature film in Azerbaijani cinema.

Director: Hüseyn Seyidzadə
Screenplay: Sabit Rəhman
Cinematographer: Əlisəttar Atakişiyev
Artists: Cəbrayıl Əzimov, Nadir Zeynalov
Cast: Əliağa Ağayev (Məşədi İbad), Arif Mirzəquliyev (Servant), Tamara Gözəlova (Gulnaz), Ağasadıq Gəraybəyli (Rüstəm bəy), Barat Şəkinskaya (Sənəm), İsmayıl Əfəndiyev (Həsənqulu bəy)
Producer: Baku Film Studio
Release Date: June 4, 1957
Genre: Musical Comedy', CAST(N'1956-06-04T00:00:00.0000000' AS DateTime2), 70, N'1ffe329e-70eb-4a80-8f48-6b489059882d.jpg', CAST(N'01:27:06' AS Time), NULL, 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'https://www.youtube.com/embed/mZTbGUGk7Rc?si=DMsINbHmWYAJR_Dv')
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [ReleaseDate], [Price], [ImageUrl], [DurationMinutes], [Budget], [PriceCurrency], [BudgetCurrency], [CreationTime], [MovieUrl]) VALUES (6, N'Bizim Cabish Muellim', N'The events in the film take place in Baku during the years of World War II. The story highlights the moral values of ordinary people who endured all kinds of hardships for the sake of victory, worked hard to support their families, and considered the freedom of their homeland above all else.

Director: Hasan Seyidbeyli
Screenwriter: Maqsud Ibrahimbeyov
Cinematographer: Arif Narimanbeyov
Art Director: Mammad Huseynov
Composer: Emin Sabitoglu
Cast: Suleyman Alasgarov (Jabish), Shafiqa Mammadova (Jabish''s wife), Mukhtar Maniyev (Najafov), Safura Ibrahimova (Najafov''s wife), Ziya Seyidbeyli (Namig), Nasiba Zeynalova (Sugra khala), Aliaga Aghayev (Abulfaz), Aqil Aghajanov (Makedon)

Production Company: Azerbaijanfilm
Genre: Lyrical-psychological drama, war
Premiere Date: December 30, 1969', CAST(N'1969-10-21T00:00:00.0000000' AS DateTime2), 20, N'5dd11f2c-53d3-4e1a-9e64-8c7c2d52bb0a.jpg', CAST(N'01:12:24' AS Time), CAST(60000.00 AS Decimal(18, 2)), 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'https://www.youtube.com/embed/br9zD5f-c4A?si=8mvRm2lOgrtL-B6V')
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [ReleaseDate], [Price], [ImageUrl], [DurationMinutes], [Budget], [PriceCurrency], [BudgetCurrency], [CreationTime], [MovieUrl]) VALUES (7, N'Dolu', N'The film is dedicated to the Karabakh war and to those who fought until their last drop of blood. More than 200 soldiers and officers from the Internal Troops participated in the mass scenes. The film is based on Aqil Abbas'' novel Dolu. The filming took place in Ismayilli, Aghjabadi, Aghdam, Khizi, Sumgayit, Shamkir, and Baku.

Director: Elkhan Jafarov
Screenwriter: Aqil Abbas
Cinematographer: Nadir Mehdiyev
Art Director: Rafiq Nasirov
Composer: Polad Bulbuloglu
Cast: MammadSafa Qasimov (Commander), Rza Rzayev (Drakon), Elvin Ahmadov (Pələng), Fuad Poladov (Secretary), Gulzar Qurbanova (Pələng’s mother), Shamil Suleymanov (Teacher), Farhad Israfilov (Police Chief)

Production Company: Azerbaijanfilm
Premiere Date: August 2, 2012
Genre: Action, War', CAST(N'2012-08-02T00:00:00.0000000' AS DateTime2), 20, N'c7d041e6-d996-4081-9255-be66fe61326b.jpg', CAST(N'01:24:32' AS Time), CAST(1300000.00 AS Decimal(18, 2)), 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'https://www.youtube.com/embed/xYcT3-9W1f0?si=ThKZjIMUy_Rla7IH')
GO
INSERT [dbo].[Movie] ([Id], [Title], [Description], [ReleaseDate], [Price], [ImageUrl], [DurationMinutes], [Budget], [PriceCurrency], [BudgetCurrency], [CreationTime], [MovieUrl]) VALUES (8, N'Babek', N'The film is dedicated to the hero of the Azerbaijani people, the prominent commander and political figure Babak. It portrays the hero''s life and activities.

Director: Eldar Guliyev
Screenwriters: Anvar Mammadkhanli
Cinematographer: Rasim Ismayilov
Composer: Polad Bulbuloglu
Art Director: Mayis Agabayov

Starring: Rasim Balayev, Hasanaga Turabov, Amaliya Panahova, Tamara Yandiyeva, Shahmar Alekperov', CAST(N'1980-01-16T00:00:00.0000000' AS DateTime2), 10, N'd3e85484-2ab1-422b-a38b-55a34c389c8e.jpg', CAST(N'02:09:38' AS Time), NULL, 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'https://www.youtube.com/embed/Q_pw4eOm3wI?si=PI2TANLQpIHMSId0')
GO
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[Rating] ON 
GO
INSERT [dbo].[Rating] ([Id], [MovieId], [UserId], [UserRating]) VALUES (3, 1, 19, 9)
GO
INSERT [dbo].[Rating] ([Id], [MovieId], [UserId], [UserRating]) VALUES (4, 6, 19, 10)
GO
INSERT [dbo].[Rating] ([Id], [MovieId], [UserId], [UserRating]) VALUES (5, 8, 19, 10)
GO
INSERT [dbo].[Rating] ([Id], [MovieId], [UserId], [UserRating]) VALUES (6, 7, 19, 9)
GO
INSERT [dbo].[Rating] ([Id], [MovieId], [UserId], [UserRating]) VALUES (7, 1, 18, 10)
GO
SET IDENTITY_INSERT [dbo].[Rating] OFF
GO
SET IDENTITY_INSERT [dbo].[ViewCount] ON 
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (1, 6, 19)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (2, 2, 19)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (3, 1, 18)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (4, 6, 18)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (5, 8, 18)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (6, 7, 18)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (7, 2, 18)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (8, 4, 18)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (9, 8, 19)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (10, 7, 19)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (11, 4, 19)
GO
INSERT [dbo].[ViewCount] ([Id], [MovieId], [UserId]) VALUES (12, 1, 19)
GO
SET IDENTITY_INSERT [dbo].[ViewCount] OFF
GO
SET IDENTITY_INSERT [dbo].[WatchList] ON 
GO
INSERT [dbo].[WatchList] ([Id], [MovieId], [UserId]) VALUES (3, 2, 18)
GO
INSERT [dbo].[WatchList] ([Id], [MovieId], [UserId]) VALUES (7, 6, 18)
GO
INSERT [dbo].[WatchList] ([Id], [MovieId], [UserId]) VALUES (9, 4, 18)
GO
INSERT [dbo].[WatchList] ([Id], [MovieId], [UserId]) VALUES (22, 1, 19)
GO
INSERT [dbo].[WatchList] ([Id], [MovieId], [UserId]) VALUES (23, 2, 19)
GO
SET IDENTITY_INSERT [dbo].[WatchList] OFF
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_MovieId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_MovieId] ON [dbo].[Comment]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_UserId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_UserId] ON [dbo].[Comment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CommentLikeDislike_CommentId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_CommentLikeDislike_CommentId] ON [dbo].[CommentLikeDislike]
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CommentLikeDislike_UserId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_CommentLikeDislike_UserId] ON [dbo].[CommentLikeDislike]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CountryMovie_MoviesId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_CountryMovie_MoviesId] ON [dbo].[CountryMovie]
(
	[MoviesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GenreMovie_MoviesId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_GenreMovie_MoviesId] ON [dbo].[GenreMovie]
(
	[MoviesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rating_MovieId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rating_MovieId] ON [dbo].[Rating]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rating_UserId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rating_UserId] ON [dbo].[Rating]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViewCount_MovieId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_ViewCount_MovieId] ON [dbo].[ViewCount]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViewCount_UserId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_ViewCount_UserId] ON [dbo].[ViewCount]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WatchList_MovieId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_WatchList_MovieId] ON [dbo].[WatchList]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WatchList_UserId]    Script Date: 11/9/2024 1:00:39 PM ******/
CREATE NONCLUSTERED INDEX [IX_WatchList_UserId] ON [dbo].[WatchList]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DateOfEdit]
GO
ALTER TABLE [dbo].[Comment] ADD  DEFAULT ((0)) FOR [ToCommentId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Movie_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Movie_MovieId]
GO
ALTER TABLE [dbo].[CommentLikeDislike]  WITH CHECK ADD  CONSTRAINT [FK_CommentLikeDislike_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[CommentLikeDislike] CHECK CONSTRAINT [FK_CommentLikeDislike_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CommentLikeDislike]  WITH CHECK ADD  CONSTRAINT [FK_CommentLikeDislike_Comment_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comment] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CommentLikeDislike] CHECK CONSTRAINT [FK_CommentLikeDislike_Comment_CommentId]
GO
ALTER TABLE [dbo].[CountryMovie]  WITH CHECK ADD  CONSTRAINT [FK_CountryMovie_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CountryMovie] CHECK CONSTRAINT [FK_CountryMovie_Country_CountryId]
GO
ALTER TABLE [dbo].[CountryMovie]  WITH CHECK ADD  CONSTRAINT [FK_CountryMovie_Movie_MoviesId] FOREIGN KEY([MoviesId])
REFERENCES [dbo].[Movie] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CountryMovie] CHECK CONSTRAINT [FK_CountryMovie_Movie_MoviesId]
GO
ALTER TABLE [dbo].[GenreMovie]  WITH CHECK ADD  CONSTRAINT [FK_GenreMovie_Genre_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenreMovie] CHECK CONSTRAINT [FK_GenreMovie_Genre_GenreId]
GO
ALTER TABLE [dbo].[GenreMovie]  WITH CHECK ADD  CONSTRAINT [FK_GenreMovie_Movie_MoviesId] FOREIGN KEY([MoviesId])
REFERENCES [dbo].[Movie] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GenreMovie] CHECK CONSTRAINT [FK_GenreMovie_Movie_MoviesId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Movie_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Movie_MovieId]
GO
ALTER TABLE [dbo].[ViewCount]  WITH CHECK ADD  CONSTRAINT [FK_ViewCount_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ViewCount] CHECK CONSTRAINT [FK_ViewCount_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ViewCount]  WITH CHECK ADD  CONSTRAINT [FK_ViewCount_Movie_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ViewCount] CHECK CONSTRAINT [FK_ViewCount_Movie_MovieId]
GO
ALTER TABLE [dbo].[WatchList]  WITH CHECK ADD  CONSTRAINT [FK_WatchList_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WatchList] CHECK CONSTRAINT [FK_WatchList_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[WatchList]  WITH CHECK ADD  CONSTRAINT [FK_WatchList_Movie_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WatchList] CHECK CONSTRAINT [FK_WatchList_Movie_MovieId]
GO
USE [master]
GO
ALTER DATABASE [MoviesWebAppContext] SET  READ_WRITE 
GO
