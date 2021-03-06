USE [master]
GO
/****** Object:  Database [NU_DB]    Script Date: 07/09/2018 12:18:46 AM ******/
CREATE DATABASE [NU_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NU_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGUYENNTT\MSSQL\DATA\NU_DB.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NU_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGUYENNTT\MSSQL\DATA\NU_DB_log.ldf' , SIZE = 11200KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NU_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NU_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NU_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NU_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NU_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NU_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NU_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NU_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NU_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NU_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NU_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NU_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NU_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NU_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NU_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NU_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NU_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NU_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NU_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NU_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NU_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NU_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NU_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NU_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NU_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NU_DB] SET  MULTI_USER 
GO
ALTER DATABASE [NU_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NU_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NU_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NU_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NU_DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [NU_DB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[isAdmin] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bookmark]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookmark](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [nvarchar](50) NULL,
	[project_id] [int] NULL,
	[last_check] [datetime] NULL,
 CONSTRAINT [PK_Bookmark] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[genre_id] [nvarchar](50) NOT NULL,
	[genre] [nvarchar](150) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[genre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GenreMap]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenreMap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NULL,
	[genre_id] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[project_name] [nvarchar](3000) NOT NULL,
	[project_alter_name] [nvarchar](4000) NULL,
	[project_publish_date] [date] NULL,
	[project_author] [nvarchar](500) NULL,
	[project_illustrator] [nvarchar](500) NULL,
	[project_synopsis] [nvarchar](4000) NULL,
	[project_hash] [nvarchar](500) NOT NULL,
	[project_tag] [int] NULL,
	[project_view] [int] NULL,
	[project_point] [int] NULL,
	[project_last_update] [datetime] NULL,
	[project_total_update] [int] NULL,
	[project_link] [nvarchar](500) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransGroup]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransGroup](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](200) NULL,
	[group_contact] [nvarchar](500) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UpdateChap]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UpdateChap](
	[update_id] [int] IDENTITY(1,1) NOT NULL,
	[update_name] [nvarchar](500) NULL,
	[update_vol] [int] NULL,
	[update_date] [datetime] NULL,
	[update_group] [int] NULL,
	[update_link] [nvarchar](500) NULL,
 CONSTRAINT [PK_Updates] PRIMARY KEY CLUSTERED 
(
	[update_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UpdateVol]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UpdateVol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vol_name] [nvarchar](50) NULL,
	[vol_no] [int] NULL,
	[vol_cover] [varchar](200) NULL,
	[project_id] [int] NULL,
	[vol_hash] [nvarchar](100) NULL,
 CONSTRAINT [PK_UpdateVol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([username], [password], [isAdmin]) VALUES (N'admin', N'12345', 1)
INSERT [dbo].[Account] ([username], [password], [isAdmin]) VALUES (N'ass', N'123', 0)
INSERT [dbo].[Account] ([username], [password], [isAdmin]) VALUES (N'kaka', N'123456', 0)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'action', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'adventure', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'comedy', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'demons', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'drama', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'ecchi', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'fantasy', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'game', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'gender bender', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'harem', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'hentai', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'historical', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'horror', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'josei', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'magic', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'mecha', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'military', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'mystery', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'psychological', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'romance', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'school', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'sci-fi', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'seinen', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'shoujo', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'shoujo ai', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'shounen', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'shounen ai', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'slice of life', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'super power', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'supernatural', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'vampire', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'yaoi', NULL)
INSERT [dbo].[Genre] ([genre_id], [genre]) VALUES (N'yuri', NULL)
SET IDENTITY_INSERT [dbo].[GenreMap] ON 

INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (1, 2, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (2, 2, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (3, 2, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (4, 3, N'slice of life')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (5, 4, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (6, 5, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (7, 6, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (8, 6, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (9, 7, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (10, 7, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (11, 8, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (12, 9, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (13, 10, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (14, 11, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (15, 11, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (16, 12, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (17, 12, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (18, 13, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (19, 13, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (20, 13, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (21, 14, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (22, 15, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (23, 16, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (24, 17, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (25, 17, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (26, 17, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (27, 17, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (28, 17, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (29, 18, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (30, 18, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (31, 18, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (32, 18, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (33, 18, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (34, 18, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (35, 19, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (36, 19, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (37, 19, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (38, 19, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (39, 19, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (40, 20, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (41, 20, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (42, 20, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (43, 20, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (44, 21, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (45, 21, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (46, 21, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (47, 22, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (48, 22, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (49, 22, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (50, 22, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (51, 23, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (52, 23, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (53, 23, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (54, 23, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (55, 23, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (56, 24, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (57, 24, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (58, 25, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (59, 25, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (60, 26, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (61, 26, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (62, 27, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (63, 28, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (64, 28, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (65, 29, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (66, 29, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (67, 29, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (68, 29, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (69, 29, N'slice of life')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (70, 30, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (71, 31, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (72, 31, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (73, 32, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (74, 32, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (75, 33, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (76, 33, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (77, 33, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (78, 33, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (79, 33, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (80, 33, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (81, 34, N'demons')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (82, 34, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (83, 35, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (84, 35, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (85, 36, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (86, 36, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (87, 36, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (88, 37, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (89, 38, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (90, 39, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (91, 40, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (92, 40, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (93, 41, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (94, 41, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (95, 41, N'magic')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (96, 41, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (97, 42, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (98, 42, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (99, 43, N'romance')
GO
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (100, 43, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (101, 43, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (102, 44, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (103, 44, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (104, 44, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (105, 44, N'slice of life')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (106, 45, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (107, 45, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (108, 46, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (109, 46, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (110, 46, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (111, 47, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (112, 47, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (113, 47, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (114, 48, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (115, 48, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (116, 49, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (117, 50, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (118, 50, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (119, 50, N'shounen')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (120, 51, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (121, 52, N'yaoi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (122, 53, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (123, 53, N'shoujo ai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (124, 53, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (125, 54, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (126, 54, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (127, 54, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (128, 55, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (129, 56, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (130, 57, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (131, 57, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (132, 57, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (133, 58, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (134, 58, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (135, 58, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (136, 59, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (137, 59, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (138, 59, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (139, 60, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (140, 60, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (141, 60, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (142, 60, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (143, 61, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (144, 61, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (145, 61, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (146, 62, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (147, 62, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (148, 56, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (149, 56, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (150, 63, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (151, 63, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (152, 63, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (153, 63, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (154, 64, N'vampire')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (155, 64, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (156, 65, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (157, 65, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (158, 65, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (159, 65, N'super power')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (160, 66, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (161, 66, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (162, 66, N'super power')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (163, 66, N'military')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (164, 67, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (165, 67, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (166, 67, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (167, 67, N'super power')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (168, 67, N'military')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (169, 68, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (170, 68, N'slice of life')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (171, 70, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (172, 70, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (173, 71, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (174, 71, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (175, 72, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (176, 73, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (177, 73, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (178, 73, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (179, 74, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (180, 74, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (181, 74, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (182, 75, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (183, 76, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (184, 76, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (185, 77, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (186, 77, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (187, 77, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (188, 77, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (189, 77, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (190, 77, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (191, 78, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (192, 78, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (193, 79, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (194, 80, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (195, 81, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (196, 81, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (197, 81, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (198, 82, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (199, 82, N'game')
GO
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (200, 82, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (201, 82, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (202, 82, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (203, 83, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (204, 83, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (205, 83, N'shoujo ai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (206, 83, N'slice of life')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (207, 84, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (208, 84, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (209, 85, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (210, 85, N'mecha')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (211, 85, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (212, 85, N'military')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (213, 86, N'mecha')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (214, 86, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (215, 86, N'shounen')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (216, 86, N'military')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (217, 87, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (218, 88, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (219, 88, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (220, 88, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (221, 89, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (222, 89, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (223, 89, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (224, 88, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (225, 90, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (226, 90, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (227, 91, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (228, 91, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (229, 92, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (230, 92, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (231, 92, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (232, 92, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (233, 92, N'shounen')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (234, 92, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (235, 93, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (236, 93, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (237, 93, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (238, 94, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (239, 94, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (240, 94, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (241, 94, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (242, 95, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (243, 95, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (244, 96, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (245, 96, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (246, 96, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (247, 97, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (248, 97, N'shounen ai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (249, 97, N'yaoi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (250, 98, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (251, 98, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (252, 99, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (253, 99, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (254, 100, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (255, 101, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (256, 101, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (257, 102, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (258, 102, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (259, 102, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (260, 102, N'yaoi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (261, 103, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (262, 103, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (263, 104, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (264, 105, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (265, 105, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (266, 106, N'shounen ai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (267, 107, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (268, 107, N'sci-fi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (269, 108, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (270, 108, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (271, 108, N'yaoi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (272, 109, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (273, 109, N'super power')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (274, 110, N'yuri')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (275, 111, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (276, 111, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (277, 112, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (278, 112, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (279, 113, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (280, 113, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (281, 114, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (282, 114, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (283, 115, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (284, 115, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (285, 116, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (286, 116, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (287, 117, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (288, 117, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (289, 118, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (290, 118, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (291, 119, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (292, 119, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (293, 120, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (294, 121, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (295, 121, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (296, 122, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (297, 122, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (298, 123, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (299, 123, N'josei')
GO
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (300, 124, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (301, 125, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (302, 125, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (303, 125, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (304, 126, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (305, 126, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (306, 127, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (307, 128, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (308, 129, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (309, 129, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (310, 130, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (311, 130, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (312, 131, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (313, 131, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (314, 132, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (315, 132, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (316, 133, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (317, 134, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (318, 134, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (319, 135, N'yaoi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (320, 136, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (321, 136, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (322, 137, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (323, 137, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (324, 138, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (325, 139, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (326, 140, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (327, 140, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (328, 140, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (329, 141, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (330, 141, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (331, 141, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (332, 142, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (333, 142, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (334, 142, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (335, 143, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (336, 144, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (337, 145, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (338, 145, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (339, 146, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (340, 146, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (341, 147, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (342, 147, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (343, 148, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (344, 148, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (345, 149, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (346, 149, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (347, 150, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (348, 150, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (349, 151, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (350, 151, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (351, 152, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (352, 152, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (353, 153, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (354, 153, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (355, 154, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (356, 154, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (357, 155, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (358, 155, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (359, 155, N'horror')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (360, 155, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (361, 155, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (362, 156, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (363, 156, N'gender bender')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (364, 157, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (365, 157, N'shoujo ai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (366, 157, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (367, 158, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (368, 158, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (369, 158, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (370, 159, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (371, 159, N'shoujo')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (372, 160, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (373, 160, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (374, 161, N'game')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (375, 161, N'psychological')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (376, 162, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (377, 162, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (378, 163, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (379, 163, N'shoujo')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (380, 164, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (381, 164, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (382, 164, N'magic')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (383, 164, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (384, 165, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (385, 165, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (386, 166, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (387, 166, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (388, 167, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (389, 167, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (390, 168, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (391, 169, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (392, 169, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (393, 169, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (394, 169, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (395, 170, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (396, 170, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (397, 171, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (398, 171, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (399, 172, N'mystery')
GO
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (400, 172, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (401, 172, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (402, 172, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (403, 173, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (404, 173, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (405, 174, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (406, 174, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (407, 174, N'slice of life')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (408, 174, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (409, 175, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (410, 175, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (411, 175, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (412, 175, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (413, 175, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (414, 175, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (415, 176, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (416, 176, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (417, 176, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (418, 177, N'military')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (419, 178, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (420, 178, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (421, 179, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (422, 179, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (423, 180, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (424, 180, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (425, 181, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (426, 181, N'vampire')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (427, 182, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (428, 182, N'historical')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (429, 182, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (430, 182, N'shoujo')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (431, 183, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (432, 183, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (433, 184, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (434, 184, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (435, 185, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (436, 185, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (437, 186, N'horror')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (438, 187, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (439, 187, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (440, 187, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (441, 188, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (442, 188, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (443, 188, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (444, 188, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (445, 189, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (446, 189, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (447, 190, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (448, 191, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (449, 191, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (450, 192, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (451, 192, N'magic')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (452, 192, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (453, 192, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (454, 193, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (455, 193, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (456, 193, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (457, 193, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (458, 193, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (459, 194, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (460, 194, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (461, 195, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (462, 195, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (463, 195, N'gender bender')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (464, 196, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (465, 196, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (466, 196, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (467, 196, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (468, 196, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (469, 197, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (470, 197, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (471, 197, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (472, 197, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (473, 197, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (474, 197, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (475, 198, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (476, 199, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (477, 199, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (478, 199, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (479, 200, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (480, 200, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (481, 200, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (482, 201, N'drama')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (483, 201, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (484, 201, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (485, 202, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (486, 203, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (487, 203, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (488, 203, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (489, 204, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (490, 204, N'demons')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (491, 204, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (492, 205, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (493, 205, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (494, 205, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (495, 205, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (496, 205, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (497, 206, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (498, 206, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (499, 206, N'shoujo')
GO
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (500, 207, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (501, 207, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (502, 207, N'gender bender')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (503, 208, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (504, 208, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (505, 209, N'demons')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (506, 209, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (507, 209, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (508, 210, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (509, 210, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (510, 211, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (511, 211, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (512, 212, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (513, 212, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (514, 212, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (515, 213, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (516, 213, N'shoujo')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (517, 214, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (518, 214, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (519, 215, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (520, 215, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (521, 216, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (522, 216, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (523, 217, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (524, 218, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (525, 218, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (526, 219, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (527, 219, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (528, 220, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (529, 220, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (530, 221, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (531, 221, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (532, 221, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (533, 222, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (534, 222, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (535, 223, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (536, 223, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (537, 223, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (538, 224, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (539, 224, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (540, 225, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (541, 225, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (542, 225, N'gender bender')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (543, 226, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (544, 226, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (545, 226, N'shoujo')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (546, 226, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (547, 227, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (548, 227, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (549, 227, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (550, 227, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (551, 227, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (552, 227, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (553, 228, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (554, 228, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (555, 229, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (556, 229, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (557, 230, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (558, 230, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (559, 230, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (560, 231, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (561, 232, N'hentai')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (562, 233, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (563, 233, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (564, 234, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (565, 234, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (566, 235, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (567, 235, N'josei')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (568, 236, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (569, 237, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (570, 237, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (571, 237, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (572, 237, N'shoujo')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (573, 238, N'action')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (574, 238, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (575, 238, N'ecchi')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (576, 238, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (577, 238, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (578, 238, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (579, 238, N'harem')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (580, 238, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (581, 239, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (582, 239, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (583, 239, N'school')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (584, 240, N'adventure')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (585, 240, N'mystery')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (586, 240, N'fantasy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (587, 240, N'seinen')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (588, 241, N'supernatural')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (589, 242, N'comedy')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (590, 242, N'romance')
INSERT [dbo].[GenreMap] ([id], [project_id], [genre_id]) VALUES (591, 243, N'hentai')
SET IDENTITY_INSERT [dbo].[GenreMap] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (1, N'Bungaku Shoujo Minarai', N'Synonyms: Book Girl: Apprentice, Literature Girl: An Apprentice, Japanese: “文学少女”見習い, ', CAST(N'2009-04-30' AS Date), N'Nomura, Mizuki', N'Takeoka, Miho', NULL, N'-1719556092', NULL, 431, 7, CAST(N'2018-07-09 00:07:56.090' AS DateTime), 0, N'https://myanimelist.net/manga/18072/Bungaku_Shoujo_Minarai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (2, N'Bungaku Shoujo Series', N'English: Book Girl, Synonyms: Literature Girl, Book Girl and the Suicidal Mime, Book Girl and the Famished Spirit, Japanese: “文学少女”シリーズ, ;Synonyms: Bungaku Shoujo to Koisuru Souwashuu, Japanese: “文学少女”と恋する挿話集【エピソード】, ;Bungaku Shoujo to Koisuru Episode', CAST(N'2006-04-28' AS Date), N'Nomura, Mizuki', N'Takeoka, Miho', NULL, N'828269482', NULL, 2076, 7, CAST(N'2018-07-09 00:07:56.120' AS DateTime), 0, N'https://myanimelist.net/manga/10000/Bungaku_Shoujo_Series;https://myanimelist.net/manga/67349/Bungaku_Shoujo_to_Koisuru_Episode')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (3, N'Chikatetsu ni Noru Series: Kyo Girls Days - Uzumasa Moe no Tsukumo Gikyoku', N'Japanese: 「地下鉄に乗るっ」シリーズ 京・ガールズデイズ ~太秦萌の九十九戯曲~, ', CAST(N'2015-09-02' AS Date), N'Motoki', N'Kamogawa', NULL, N'-558167863', NULL, 76, 5, CAST(N'2018-07-09 00:07:56.230' AS DateTime), 0, N'https://myanimelist.net/manga/95891/Chikatetsu_ni_Noru_Series__Kyo_Girls_Days_-_Uzumasa_Moe_no_Tsukumo_Gikyoku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (4, N'Chou Rouhou Tonaribeya no Bijinzuma ga Amayakashi Gohoushi shite Kureru Rashii www', N'Japanese: 【超朗報】隣部屋の美人妻が甘やかしご奉仕してくれるらしいwww, ', CAST(N'2017-03-10' AS Date), N'Aiuchi, Nano', N'Poruno, Ibuki', NULL, N'-1669776980', NULL, 62, 5, CAST(N'2018-07-09 00:07:56.273' AS DateTime), 0, N'https://myanimelist.net/manga/104632/Chou_Rouhou_Tonaribeya_no_Bijinzuma_ga_Amayakashi_Gohoushi_shite_Kureru_Rashii_www')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (5, N'Eiyuu Kaitai', N'Synonyms: &quot;Heroes&quot; Dismissed, Japanese: 「英雄」解体, ', CAST(N'2015-01-01' AS Date), N'Oyama, Kyouhei', N'Kazeno', NULL, N'-530529801', NULL, 70, 5, CAST(N'2018-07-09 00:07:56.320' AS DateTime), 0, N'https://myanimelist.net/manga/101385/Eiyuu_Kaitai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (6, N'Fushigi Toriatsukaimasu: Tsukumodou Kottouten', N'Synonyms: Tsukumodo Antique Shop - We Handle &quot;Mysteriosities&quot;, Japanese: “不思議”取り扱います 付喪堂骨董店, ', CAST(N'2006-10-10' AS Date), N'Takeshima, Satoshi', N'Odou, Akihiko', NULL, N'7584230', NULL, 1000, 8, CAST(N'2018-07-09 00:07:56.370' AS DateTime), 0, N'https://myanimelist.net/manga/62841/Fushigi_Toriatsukaimasu__Tsukumodou_Kottouten')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (7, N'Hello Work Guild e Youkoso!', N'English: Welcome to &quot;Hello Work Guild&quot;, Japanese: 《ハローワーク・ギルド》へようこそ！, ', CAST(N'2017-01-10' AS Date), N'Kobayashi, Miruku', N'Kazutake, Hazano', NULL, N'-1438512005', NULL, 65, 5, CAST(N'2018-07-09 00:07:56.400' AS DateTime), 0, N'https://myanimelist.net/manga/104283/Hello_Work_Guild_e_Youkoso')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (8, N'Hon no Hime wa Utau', N'Japanese: 〈本の姫〉は謳う, ', NULL, N'Yamamoto, Yamato', N'Tasaki, Rei', NULL, N'818229804', NULL, 44, 5, CAST(N'2018-07-09 00:07:56.447' AS DateTime), 0, N'https://myanimelist.net/manga/73765/Hon_no_Hime_wa_Utau')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (9, N'Kanchigai Shinaide yo ne! Anta no Koto nanka Daisuki Nan Dakara! Noroi de Honne shika Ienaku Natta Tsundere Ojousama', N'Japanese: 「勘違いしないでよね!アンタの事なんか大好きなんだから!」呪いで本音しか言えなくなったツンデレお嬢様, ', CAST(N'2013-11-15' AS Date), N'SAIPACo.', N'Ueda, Nagano', NULL, N'486619957', NULL, 91, 5, CAST(N'2018-07-09 00:07:56.497' AS DateTime), 0, N'https://myanimelist.net/manga/85331/Kanchigai_Shinaide_yo_ne_Anta_no_Koto_nanka_Daisuki_Nan_Dakara_Noroi_de_Honne_shika_Ienaku_Natta_Tsundere_Ojousama')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (10, N'Motesuki Chuui Saikou no Bishoujo-tachi wo Tsugou Yoku Choukyou shitemita', N'Japanese: 【モテすぎ注意】最高の美少女たちを都合よく調教してみた, ', CAST(N'2016-02-26' AS Date), N'Maihara, Matsuge', N'Sakamoto, Neko', NULL, N'1116890979', NULL, 49, 5, CAST(N'2018-07-09 00:07:56.527' AS DateTime), 0, N'https://myanimelist.net/manga/96552/Motesuki_Chuui_Saikou_no_Bishoujo-tachi_wo_Tsugou_Yoku_Choukyou_shitemita')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (11, N'Mou Ichido, Ubatte: Senya no Ai wo Ouji wa Musaboru', N'Japanese: 「もう一度、奪って」　千夜の愛を王子は貪る, ', CAST(N'2014-04-17' AS Date), N'Himeno, Yuri', N'Shiina, Satsuki', NULL, N'-1734487215', NULL, 28, 5, CAST(N'2018-07-09 00:07:56.560' AS DateTime), 0, N'https://myanimelist.net/manga/101406/Mou_Ichido_Ubatte__Senya_no_Ai_wo_Ouji_wa_Musaboru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (12, N'Nakadashi Igai wa Kousoku Ihan!! Joshikousai Nottori Keikaku', N'Japanese: “中出し”以外は校則違反!! ～女子校祭・乗っ取り計画～, ', CAST(N'2006-11-25' AS Date), N'MBS Truth', N'Mochizuki, Nozomu', NULL, N'-729934948', NULL, 48, 5, CAST(N'2018-07-09 00:07:56.623' AS DateTime), 0, N'https://myanimelist.net/manga/86134/Nakadashi_Igai_wa_Kousoku_Ihan_Joshikousai_Nottori_Keikaku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (13, N'Renai Taishougai na Ore no 2-jigen Dasshutsu Keikaku', N'Japanese: 「恋愛対象外」な俺の２次元脱出計画, ', CAST(N'2014-01-24' AS Date), N'Yamaguchi', N'Nanamiya, Rin', NULL, N'-2041571068', NULL, 45, 5, CAST(N'2018-07-09 00:07:56.653' AS DateTime), 0, N'https://myanimelist.net/manga/95288/Renai_Taishougai_na_Ore_no_2-jigen_Dasshutsu_Keikaku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (14, N'Saikou Bijin Maid ni Yoru Gokujou Gohoushi www', N'Japanese: 【最高】美人メイドによる極上ご奉仕www, ', CAST(N'2016-11-11' AS Date), N'Ai, Mai', N'Kasei', NULL, N'1204104017', NULL, 43, 5, CAST(N'2018-07-09 00:07:56.697' AS DateTime), 0, N'https://myanimelist.net/manga/102168/Saikou_Bijin_Maid_ni_Yoru_Gokujou_Gohoushi_www')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (15, N'(Aruiwa) SF no Aru Fuukei', N'Synonyms: The &#039;Something&#039; (includes Science Fiction), Japanese: （あるいは）SFのある風景, ', CAST(N'2015-07-30' AS Date), N'Fumino, Hajime', N'Hebitsukai', NULL, N'-2019596061', NULL, 15, 5, CAST(N'2018-07-09 00:07:56.713' AS DateTime), 0, N'https://myanimelist.net/manga/91780/Aruiwa_SF_no_Aru_Fuukei')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (16, N'(Kono Sekai wa Mou Ore ga Sukutte Tomi to Kenryoku wo Te ni Iretashi, Onna Kishi ya Onna Maou to Shiro de Tanoshiku Kurashiteru kara, Ore Igai no Yuusha wa) Mou Isekai ni Konaide Kudasai.', N'Synonyms: I have already saved this world, took all the riches, and gained all the power, I&#039;m living a fun life in a castle with a woman knight and a female Demon Lord, so, please, we don&#039;t need more heroes here!, Japanese: （この世界はもう俺が救って富と権力を手に入れたし、女騎士や女魔王と城で楽しく暮らしてるから、俺以外の勇者は）もう異世界に来ないでください。, ', CAST(N'2017-03-25' AS Date), N'Itou, Hiro', N'Ogipote', NULL, N'505509509', NULL, 476, 8, CAST(N'2018-07-09 00:07:56.743' AS DateTime), 0, N'https://myanimelist.net/manga/105108/Kono_Sekai_wa_Mou_Ore_ga_Sukutte_Tomi_to_Kenryoku_wo_Te_ni_Iretashi_Onna_Kishi_ya_Onna_Maou_to_Shiro_de_Tanoshiku_Kurashiteru_kara_Ore_Igai_no_Yuusha_wa_Mou_Isekai_ni_Konaide_Kudasai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (17, N'.hack//AI Buster', N'English: .hack//AI buster, Japanese: .hack//AI buster, ', CAST(N'2002-10-01' AS Date), N'Hamazaki, Tatsuya', N'Izumi, Rei', NULL, N'-1365294598', NULL, 3089, 8, CAST(N'2018-07-09 00:07:56.760' AS DateTime), 0, N'https://myanimelist.net/manga/955/hack__AI_Buster')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (18, N'.hack//Another Birth', N'English: .hack//Another Birth, Synonyms: .hack//Mou Hitotsu no Tanjou, Japanese: .hack//ANOTHER BIRTH, ', NULL, N'Kawasaki, Miu', N'Ito, Kazunori', NULL, N'-893859741', NULL, 2692, 7, CAST(N'2018-07-09 00:07:56.790' AS DateTime), 0, N'https://myanimelist.net/manga/1355/hack__Another_Birth')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (19, N'.hack//Bullet', N'Japanese: .hack//bullet, ', CAST(N'2012-06-15' AS Date), N'', N'', NULL, N'564278416', NULL, 310, 5, CAST(N'2018-07-09 00:07:56.823' AS DateTime), 0, N'https://myanimelist.net/manga/40293/hack__Bullet')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (20, N'.hack//Cell', N'English: .hack//Cell, Japanese: .hack//CELL, ', CAST(N'2006-09-01' AS Date), N'Suzukaze, Ryou', N'Mutsuki, Akira', NULL, N'-178385234', NULL, 907, 7, CAST(N'2018-07-09 00:07:56.867' AS DateTime), 0, N'https://myanimelist.net/manga/12547/hack__Cell')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (21, N'.hack//GU', N'English: .hack//G.U., Japanese: .hack//G.U., ', CAST(N'2007-04-01' AS Date), N'Hamazaki, Tatsuya', N'Morita, Yuzuka', NULL, N'-1502709035', NULL, 1472, 7, CAST(N'2018-07-09 00:07:56.883' AS DateTime), 0, N'https://myanimelist.net/manga/11350/hack__GU')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (22, N'.hack//Quantum: Kokoro no Soushi', N'Synonyms: .hack//Quantum: Twins of the Heart, .hack//Quantum: Kokoro no Futago, Japanese: .hack//Quantum 心ノ双子【ココロノソウシ】, ', CAST(N'2011-01-29' AS Date), N'Hamazaki, Tatsuya', N'Hasebe, Atsushi', NULL, N'-1900141078', NULL, 215, 5, CAST(N'2018-07-09 00:07:56.900' AS DateTime), 0, N'https://myanimelist.net/manga/57367/hack__Quantum__Kokoro_no_Soushi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (23, N'.hack//Tasogare no Hibun', N'Synonyms: .hack//Epitaph of Twilight, Japanese: .hack//黄昏の碑文, ', CAST(N'2008-04-26' AS Date), N'Kawasaki, Miu', N'Shiina, Asako', NULL, N'-2130662865', NULL, 683, 7, CAST(N'2018-07-09 00:07:56.930' AS DateTime), 0, N'https://myanimelist.net/manga/17635/hack__Tasogare_no_Hibun')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (24, N'.hack//Zero', N'Japanese: .hack//ZERO, ', NULL, N'Yokote, Michiko', N'Kawashima, Ryojun', NULL, N'1806965150', NULL, 615, 7, CAST(N'2018-07-09 00:07:56.963' AS DateTime), 0, N'https://myanimelist.net/manga/15077/hack__Zero')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (25, N'0-kyori kara no Hatsukoi Moyou', N'Japanese: ０距離からの初恋模様, ', CAST(N'2016-09-30' AS Date), N'Nakata, Megumi', N'Nomura, Neon', NULL, N'-1056089287', NULL, 23, 5, CAST(N'2018-07-09 00:07:56.977' AS DateTime), 0, N'https://myanimelist.net/manga/106654/0-kyori_kara_no_Hatsukoi_Moyou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (26, N'0.000000001% Derenai Shiroi Neko', N'Japanese: 0.000000001%デレない白い猫, ', CAST(N'2015-02-25' AS Date), N'Fukahire', N'Masayuki, Nobeno', NULL, N'-2123397532', NULL, 142, 5, CAST(N'2018-07-09 00:07:57.010' AS DateTime), 0, N'https://myanimelist.net/manga/85297/0000000001_Derenai_Shiroi_Neko')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (27, N'1/2 Undead Series', N'Synonyms: Half Undead Series, Japanese: 1/2アンデッドシリーズ, ', CAST(N'2011-02-28' AS Date), N'kyo', N'Sasahara, Shio', NULL, N'-258917226', NULL, 63, 5, CAST(N'2018-07-09 00:07:57.040' AS DateTime), 0, N'https://myanimelist.net/manga/64111/1_2_Undead_Series')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (28, N'10-nengoshi no Hiki-NEET wo Yamete Gaishutsu shitara', N'Synonyms: When I was going out from my house to stop become a Recluse-NEET after 10 years I was transported to another world, Japanese: 10年ごしの引きニートを辞めて外出したら, ', CAST(N'2016-04-25' AS Date), N'Benio', N'Bandou, Tarou', NULL, N'-812858886', NULL, 282, 7, CAST(N'2018-07-09 00:07:57.087' AS DateTime), 0, N'https://myanimelist.net/manga/97872/10-nengoshi_no_Hiki-NEET_wo_Yamete_Gaishutsu_shitara')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (29, N'10-sai no Hoken Taiiku', N'Synonyms: Juusai no Hoken Taiiku, Japanese: 10歳の保健体育, ', CAST(N'2010-06-19' AS Date), N'Takami, Akio', N'Takei, Touka', NULL, N'727120378', NULL, 72, 5, CAST(N'2018-07-09 00:07:57.103' AS DateTime), 0, N'https://myanimelist.net/manga/56135/10-sai_no_Hoken_Taiiku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (30, N'100 Gold Shop Usagiya', N'Japanese: 100ゴールドショップ『ウサギ屋』, ', CAST(N'2016-01-30' AS Date), N'Murakami, Yuichi', N'Nekonomiya, Origami', NULL, N'1382296026', NULL, 57, 5, CAST(N'2018-07-09 00:07:57.133' AS DateTime), 0, N'https://myanimelist.net/manga/95888/100_Gold_Shop_Usagiya')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (31, N'100-en Shop Tenin ga Isekai Trip shita Kekka.', N'Synonyms: Hyakuen Shop Tenin ga Isekai Trip shita Kekka., 100 Yen Shop Tenin ga Isekai Trip shita Kekka., Japanese: 100円ショップ店員が異世界トリップした結果。, ', CAST(N'2015-11-01' AS Date), N'Gaou', N'Miyamoto, Sensya', NULL, N'1199398772', NULL, 112, 5, CAST(N'2018-07-09 00:07:57.167' AS DateTime), 0, N'https://myanimelist.net/manga/94111/100-en_Shop_Tenin_ga_Isekai_Trip_shita_Kekka')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (32, N'100-nin no Yome: Ojousama no Shoujo Butai vs Ohimesama no Maid-Gun', N'Synonyms: Hyakunin no Yome, Japanese: 100人の嫁 お嬢様の少女部隊VSお姫様のメイド軍, ', CAST(N'2012-11-21' AS Date), N'Hinata, Momo', N'Tsukino, Otogi', NULL, N'754102630', NULL, 88, 5, CAST(N'2018-07-09 00:07:57.197' AS DateTime), 0, N'https://myanimelist.net/manga/67365/100-nin_no_Yome__Ojousama_no_Shoujo_Butai_vs_Ohimesama_no_Maid-Gun')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (33, N'101-banme no Hyaku Monogatari', N'Synonyms: Hundred-one no Hyaku Monogatari, Japanese: 101番目の百物語, ', CAST(N'2010-07-23' AS Date), N'Ryohka', N'Saitou, Kenji', NULL, N'-1680344995', NULL, 243, 5, CAST(N'2018-07-09 00:07:57.230' AS DateTime), 0, N'https://myanimelist.net/manga/56079/101-banme_no_Hyaku_Monogatari')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (34, N'12 Demons', N'Japanese: 12DEMONS, ', CAST(N'2005-09-25' AS Date), N'Takeshima, Satoshi', N'Odou, Akihiko', NULL, N'-1923616012', NULL, 84, 5, CAST(N'2018-07-09 00:07:57.273' AS DateTime), 0, N'https://myanimelist.net/manga/88612/12_Demons')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (35, N'12 no Jubaku: Bukiyou na Toshi no Sarenai', N'Japanese: 12の呪縛　不器用な年の差恋愛, ', CAST(N'2016-05-27' AS Date), N'Kunihara', N'Mito, Kei', NULL, N'-1119537723', NULL, 20, 5, CAST(N'2018-07-09 00:07:57.307' AS DateTime), 0, N'https://myanimelist.net/manga/106777/12_no_Jubaku__Bukiyou_na_Toshi_no_Sarenai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (36, N'12-gatsu no Veronica', N'Synonyms: Juunigatsu no Veronica, Japanese: 12月のベロニカ, ', CAST(N'2003-01-20' AS Date), N'Tomozo', N'Takane, Junichirou', NULL, N'1816662642', NULL, 37, 5, CAST(N'2018-07-09 00:07:57.337' AS DateTime), 0, N'https://myanimelist.net/manga/87971/12-gatsu_no_Veronica')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (37, N'13-banme no Alice', N'Synonyms: Alice XIII, Japanese: 十三番目のアリス, ', CAST(N'2006-08-10' AS Date), N'Fushimi, Tsukasa', N'Sikorsky', NULL, N'-1511804370', NULL, 90, 5, CAST(N'2018-07-09 00:07:57.367' AS DateTime), 0, N'https://myanimelist.net/manga/57013/13-banme_no_Alice')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (38, N'13-banme no Boku no Majo', N'Synonyms: The Thirteenth My Witch, XIII Maria, Juusanbanme no Boku no Majo, Japanese: 13番目の僕の魔女, ', CAST(N'2013-12-03' AS Date), N'Uno, Makoto', N'Hasegawa, Miyabi', NULL, N'1340284205', NULL, 74, 5, CAST(N'2018-07-09 00:07:57.400' AS DateTime), 0, N'https://myanimelist.net/manga/63235/13-banme_no_Boku_no_Majo')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (39, N'14-sai to Illustrator', N'English: A fourteen and an illustrator., Japanese: 14歳とイラストレーター, ', CAST(N'2016-11-25' AS Date), N'Mizoguchi, Keiji', N'Murasaki, Yukiya', NULL, N'-1298812041', NULL, 82, 5, CAST(N'2018-07-09 00:07:57.430' AS DateTime), 0, N'https://myanimelist.net/manga/102416/14-sai_to_Illustrator')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (40, N'15x24', N'Japanese: 15×24, ', CAST(N'2009-09-25' AS Date), N'Hashii, Chizu', N'Shinjou, Kazuma', NULL, N'424455722', NULL, 29, 5, CAST(N'2018-07-09 00:07:57.460' AS DateTime), 0, N'https://myanimelist.net/manga/91958/15x24')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (41, N'16:00 no Shoukan Mahou', N'English: Summon Magic at 16:00, Japanese: 16:00の召喚魔法, ', CAST(N'2013-04-25' AS Date), N'refeia', N'Kio, Nachi', NULL, N'404496101', NULL, 99, 5, CAST(N'2018-07-09 00:07:57.493' AS DateTime), 0, N'https://myanimelist.net/manga/55827/16_00_no_Shoukan_Mahou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (42, N'17-banme no Higgs: Ijigen Sekai no Wakaki Ou', N'English: Higgs: The Seventeenth A Young King of Different Dimension World, Japanese: 17番目のヒッグス 異次元世界の若き王, ', CAST(N'2014-12-10' AS Date), N'Hirosaki, Ryu', N'Yuzuki, Kihiro', NULL, N'47324492', NULL, 62, 5, CAST(N'2018-07-09 00:07:57.523' AS DateTime), 0, N'https://myanimelist.net/manga/83517/17-banme_no_Higgs__Ijigen_Sekai_no_Wakaki_Ou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (43, N'18-kin Otome Game no Sekai de Harem Shuuchaku Saremashita', N'Japanese: 18禁乙女ゲームの世界でハーレム執着されました, ', CAST(N'2015-03-25' AS Date), N'Yuzuhara, Tail', N'Honda, Tamanosuke', NULL, N'1772869867', NULL, 48, 5, CAST(N'2018-07-09 00:07:57.557' AS DateTime), 0, N'https://myanimelist.net/manga/100520/18-kin_Otome_Game_no_Sekai_de_Harem_Shuuchaku_Saremashita')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (44, N'1x10 Fujimiya Tokiko wa Natsukanai', N'Japanese: 1×10 藤宮十貴子は懐かない, ', CAST(N'2009-09-19' AS Date), N'Suzuki, Daisuke', N'Panda', NULL, N'-860799703', NULL, 88, 5, CAST(N'2018-07-09 00:07:57.587' AS DateTime), 0, N'https://myanimelist.net/manga/54653/1x10_Fujimiya_Tokiko_wa_Natsukanai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (45, N'2 Weeks', N'Japanese: 2WEEKS, ', CAST(N'2012-05-16' AS Date), N'Eihi', N'Nonaka, Misato', NULL, N'-1892862280', NULL, 58, 5, CAST(N'2018-07-09 00:07:57.617' AS DateTime), 0, N'https://myanimelist.net/manga/91680/2_Weeks')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (46, N'29 to JK', N'Japanese: 29とJK, ', CAST(N'2016-06-15' AS Date), N'Yuuji, Yuuji', N'Yan-Yam', NULL, N'-1948277800', NULL, 179, 5, CAST(N'2018-07-09 00:07:57.663' AS DateTime), 0, N'https://myanimelist.net/manga/98359/29_to_JK')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (47, N'29-sai Dokushin wa Isekai de Jiyuu ni Ikita......katta.', N'Japanese: 29歳独身は異世界で自由に生きた……かった。, ', CAST(N'2014-06-17' AS Date), N'Kuwashima, Rein', N'Ryuto', NULL, N'1779857992', NULL, 258, 5, CAST(N'2018-07-09 00:07:57.697' AS DateTime), 0, N'https://myanimelist.net/manga/75075/29-sai_Dokushin_wa_Isekai_de_Jiyuu_ni_Ikitakatta')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (48, N'3-nen B-gumi: Necromancer-sensei', N'Japanese: 3年B組 ネクロマンサー先生, ', CAST(N'2017-11-15' AS Date), N'SOW', N'Gaou', NULL, N'-655069858', NULL, 35, 5, CAST(N'2018-07-09 00:07:57.727' AS DateTime), 0, N'https://myanimelist.net/manga/109898/3-nen_B-gumi__Necromancer-sensei')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (49, N'3-punkan demo Ikemasu ka? Haruka Kanata no Chousen', N'Synonyms: Sanpunkan demo Ikemasu ka? Haruka Kanata no Chousen, Japanese: ３分間でも逝けますか？~はるかかなたの挑戦~, ', CAST(N'2015-08-14' AS Date), N'Saika, Tasuku', N'Uiroutsuji, Yumihiko', NULL, N'918390401', NULL, 31, 5, CAST(N'2018-07-09 00:07:57.757' AS DateTime), 0, N'https://myanimelist.net/manga/92128/3-punkan_demo_Ikemasu_ka_Haruka_Kanata_no_Chousen')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (50, N'3-Z Class''s Ginpachi-sensei', N'Japanese: ３年Ｚ組銀八先生, ', CAST(N'2006-02-03' AS Date), N'Sorachi, Hideaki', N'Oosaki, Tomohito', NULL, N'1844574681', NULL, 1154, 8, CAST(N'2018-07-09 00:09:42.403' AS DateTime), 0, N'https://myanimelist.net/manga/14022/3-Z_Classs_Ginpachi-sensei')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (51, N'3/16 Jiken', N'Synonyms: 3/16 Incident: Outside the Universe, 3/16 Jiken: Chu no Soto, Magnituning, 3-gatsu 16-nichi Jiken, Japanese: 3/16事件, ', CAST(N'2011-03-01' AS Date), N'Nasu, Kinoko', N'Enomoto, Shunji', NULL, N'1119257309', NULL, 59, 5, CAST(N'2018-07-09 00:09:42.560' AS DateTime), 0, N'https://myanimelist.net/manga/92801/3_16_Jiken')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (52, N'37°C', N'English: 37°C, Synonyms: Thirty Seven Degrees Celsius, Japanese: 37°C, ', CAST(N'2008-05-24' AS Date), N'Kitahata, Akeno', N'Sugihara, Rio', NULL, N'1217995229', NULL, 58, 5, CAST(N'2018-07-09 00:09:42.637' AS DateTime), 0, N'https://myanimelist.net/manga/93272/37°C')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (53, N'384,403 km: Anata wo Tsuki ni Sarattara', N'Japanese: 384,403km　あなたを月にさらったら, ', CAST(N'2009-09-03' AS Date), N'Kurogane, Kenn', N'Kousaka, Hio', NULL, N'-500141668', NULL, 33, 5, CAST(N'2018-07-09 00:09:42.670' AS DateTime), 0, N'https://myanimelist.net/manga/100286/384403_km__Anata_wo_Tsuki_ni_Sarattara')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (54, N'3Ping Lovers!☆Ippu Nisai no Sekai e Youkoso♪', N'Synonyms: 3Ping Lovers! Kazuo ni Tsuma no Sekai e Youkoso♪, Japanese: 3Ping Lovers!☆一夫二妻の世界へようこそ♪, ', CAST(N'2014-08-08' AS Date), N'Hinasaki', N'Sakagami, Umi', NULL, N'-1828393428', NULL, 187, 7, CAST(N'2018-07-09 00:09:42.793' AS DateTime), 0, N'https://myanimelist.net/manga/79953/3Ping_Lovers☆Ippu_Nisai_no_Sekai_e_Youkoso♪')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (55, N'5-ji kara Toumei Ningen', N'Japanese: 5時から透明人間, ', NULL, N'Kimio, Tamako', N'Kurenai, Kurisu', NULL, N'1069913281', NULL, 23, 5, CAST(N'2018-07-09 00:09:42.923' AS DateTime), 0, N'https://myanimelist.net/manga/85445/5-ji_kara_Toumei_Ningen')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (56, N'6', N'Japanese: 6 -ゼクス-, ;Synonyms: Eighty Six, Japanese: 86―エイティシックス―,', CAST(N'2012-02-10' AS Date), N'Rairaku, Rei;Shirabi', N'Cosmic;Asato, Asato', NULL, N'-222157243', NULL, 662, 6, CAST(N'2018-07-09 00:09:43.000' AS DateTime), 0, N'https://myanimelist.net/manga/72185/6;https://myanimelist.net/manga/104039/86')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (57, N'6-bansen ni Haru wa Kuru. Soshite Kyou, Kimi wa Inakunaru.', N'Synonyms: Spring comes to line 6. And today you will be gone., Japanese: 6番線に春は来る。そして今日、君はいなくなる。, ', CAST(N'2017-11-01' AS Date), N'Oosawa, Megumi', N'Morichika', NULL, N'348597176', NULL, 27, 5, CAST(N'2018-07-09 00:09:43.063' AS DateTime), 0, N'https://myanimelist.net/manga/110218/6-bansen_ni_Haru_wa_Kuru_Soshite_Kyou_Kimi_wa_Inakunaru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (58, N'7-byougo no Sakata-san to, Ore.', N'English: Sound in the future after seven seconds, Synonyms: Nanabyougo no Sakata-san to, Ore., Japanese: 7秒後の酒多さんと、俺。, ', CAST(N'2010-12-25' AS Date), N'Amezawa, Koma', N'Asanuma, Kouta', NULL, N'-754323525', NULL, 65, 5, CAST(N'2018-07-09 00:09:43.197' AS DateTime), 0, N'https://myanimelist.net/manga/77943/7-byougo_no_Sakata-san_to_Ore')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (59, N'77 Sevens: And, two stars meet again', N'Japanese: 77〈セブンズ〉 ~And, two stars meet again~, ', CAST(N'2010-03-01' AS Date), N'Tenmaso', N'Whirlpool', NULL, N'-1841383406', NULL, 46, 5, CAST(N'2018-07-09 00:09:43.323' AS DateTime), 0, N'https://myanimelist.net/manga/82677/77_Sevens__And_two_stars_meet_again')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (60, N'7th', N'Synonyms: Seventh, Sevens, Japanese: セブンス, ', CAST(N'2015-12-28' AS Date), N'Tomozo', N'Mishima, Yomu', NULL, N'1566075443', NULL, 872, 8, CAST(N'2018-07-09 00:09:43.450' AS DateTime), 0, N'https://myanimelist.net/manga/95109/7th')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (61, N'8-banme no Cafeteria Girl', N'English: The 8th Cafeteria Girl., Synonyms: Hachibanme no Cafeteria Girl, Japanese: 8番目のカフェテリアガール, ', CAST(N'2013-06-25' AS Date), N'029', N'Ishihara, Sola', NULL, N'1457768915', NULL, 43, 5, CAST(N'2018-07-09 00:09:43.613' AS DateTime), 0, N'https://myanimelist.net/manga/91930/8-banme_no_Cafeteria_Girl')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (62, N'8-gatsu 10-nichi', N'Japanese: ８月１０日, ', CAST(N'2012-02-05' AS Date), N'Norihara, Kanan', N'Shiina, Satsuki', NULL, N'-1728557221', NULL, 22, 5, CAST(N'2018-07-09 00:09:43.707' AS DateTime), 0, N'https://myanimelist.net/manga/100905/8-gatsu_10-nichi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (63, N'9 Tails', N'Japanese: ナイン・テイルズ, ', CAST(N'2005-06-18' AS Date), N'Nanbou, Hidehisa', N'Shingo', NULL, N'-906405642', NULL, 52, 5, CAST(N'2018-07-09 00:09:43.880' AS DateTime), 0, N'https://myanimelist.net/manga/56757/9_Tails')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (64, N'99-banme no Kyuuketsuhime', N'English: Ninety-ninth Vampire Princess, Japanese: 99番目の吸血姫, ', CAST(N'2015-10-23' AS Date), N'Saitou, Kenji', N'Zaza', NULL, N'1585544622', NULL, 114, 5, CAST(N'2018-07-09 00:09:44.053' AS DateTime), 0, N'https://myanimelist.net/manga/93503/99-banme_no_Kyuuketsuhime')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (65, N'9S', N'Synonyms: Nine S, Japanese: 9S＜ナインエス＞, ', CAST(N'2003-09-10' AS Date), N'Yamamoto, Yamato', N'Hayama, Tooru', NULL, N'-310167694', NULL, 175, 5, CAST(N'2018-07-09 00:09:44.113' AS DateTime), 0, N'https://myanimelist.net/manga/44469/9S')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (66, N'9S: memories', N'Synonyms: Nine S: memories, Japanese: 9S＜ナインエス＞memories, ', CAST(N'2007-12-10' AS Date), N'Yamamoto, Yamato', N'Hayama, Tooru', NULL, N'1914769647', NULL, 40, 5, CAST(N'2018-07-09 00:09:44.240' AS DateTime), 0, N'https://myanimelist.net/manga/73903/9S__memories')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (67, N'9S? SS', N'Synonyms: 9S SS, 9S Side Stories, Nine S? SS, Japanese: 9S＜ないんえす？＞SS, ', CAST(N'2006-01-10' AS Date), N'Yamamoto, Yamato', N'Hayama, Tooru', NULL, N'-1734137342', NULL, 37, 5, CAST(N'2018-07-09 00:09:44.340' AS DateTime), 0, N'https://myanimelist.net/manga/73901/9S_SS')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (68, N'@Home', N'Synonyms: At Home, Japanese: @HOME, ', CAST(N'2010-11-10' AS Date), N'Yamane, Masato', N'Fujiwara, Yuu', NULL, N'-236470597', NULL, 26, 5, CAST(N'2018-07-09 00:09:44.480' AS DateTime), 0, N'https://myanimelist.net/manga/89012/Home')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (69, N'A Clockwork Ley-Line: Unmei no Mawaru Mori', N'Synonyms: Tokeijikake no Ley-Line, Japanese: A Clockwork Ley-Line 運命の廻る森, ', CAST(N'2012-08-10' AS Date), N'Itou, Noizi', N'', NULL, N'996819507', NULL, 99, 5, CAST(N'2018-07-09 00:09:44.577' AS DateTime), 0, N'https://myanimelist.net/manga/49689/A_Clockwork_Ley-Line__Unmei_no_Mawaru_Mori')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (70, N'A-kun (17) no Sensou', N'Japanese: A君(17)の戦争, ', CAST(N'2001-11-23' AS Date), N'Rei', N'Gouya, Daisuke', NULL, N'-615585376', NULL, 39, 5, CAST(N'2018-07-09 00:09:44.607' AS DateTime), 0, N'https://myanimelist.net/manga/70463/A-kun_17_no_Sensou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (71, N'A=Uchuu Shoujo 2x Tamashii no Sokudo', N'Japanese: A=宇宙少女2×魂の速度, ', CAST(N'2010-01-10' AS Date), N'Amajio, Komeko', N'Hino, Hifumi', NULL, N'1110879841', NULL, 23, 5, CAST(N'2018-07-09 00:09:44.700' AS DateTime), 0, N'https://myanimelist.net/manga/93534/A_Uchuu_Shoujo_2x_Tamashii_no_Sokudo')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (72, N'Aa Yuusha, Kimi no Kurushimu Kao ga Mitainda', N'Japanese: ああ勇者、君の苦しむ顔が見たいんだ, ', CAST(N'2015-11-03' AS Date), N'Narita, Imomushi', N'Yuusha Aiueon', NULL, N'404990463', NULL, 73, 5, CAST(N'2018-07-09 00:09:44.763' AS DateTime), 0, N'https://myanimelist.net/manga/92519/Aa_Yuusha_Kimi_no_Kurushimu_Kao_ga_Mitainda')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (73, N'Aa! Megami-sama!: First End', N'English: Oh My Goddess! First End, Synonyms: Shousetsu-ban Aa! Megami-sama!: Shoshuu, Japanese: 小説版 ああっ女神さまっ 初終－First End－, ', CAST(N'2006-07-20' AS Date), N'Touma, Yumi', N'Matsubara, Hidenori', NULL, N'-58716971', NULL, 605, 7, CAST(N'2018-07-09 00:09:44.827' AS DateTime), 0, N'https://myanimelist.net/manga/4603/Aa_Megami-sama__First_End')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (74, N'Aakuma Detekuuru: Chikashitsu no Akuma', N'Synonyms: Akuma Detekuru: Chikashitsu no Akuma, Japanese: アークマ・デテクール 地下室の悪魔, ', CAST(N'2004-12-10' AS Date), N'Achi, Tarou', N'Mutou, Kurihito', NULL, N'181797212', NULL, 20, 5, CAST(N'2018-07-09 00:09:44.950' AS DateTime), 0, N'https://myanimelist.net/manga/80987/Aakuma_Detekuuru__Chikashitsu_no_Akuma')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (75, N'Abarenbou Maid wa Amaenbou', N'English: My maid is violence but cute., Japanese: 暴れん坊メイドは甘えん坊, ', CAST(N'2010-05-12' AS Date), N'Ishiba, Yoshikazu', N'Yuki, Usagi', NULL, N'908353571', NULL, 53, 5, CAST(N'2018-07-09 00:09:45.060' AS DateTime), 0, N'https://myanimelist.net/manga/61031/Abarenbou_Maid_wa_Amaenbou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (76, N'Abnormal Love', N'Japanese: アブノーマルＬＯＶＥ, ', CAST(N'2017-01-27' AS Date), N'Sameshima, Reiko', N'Toilet', NULL, N'-422783918', NULL, 14, 5, CAST(N'2018-07-09 00:09:45.120' AS DateTime), 0, N'https://myanimelist.net/manga/109657/Abnormal_Love')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (77, N'Absolute Duo', N'Japanese: アブソリュート・デュオ, ', CAST(N'2012-08-23' AS Date), N'Hiiragiboshi, Takumi', N'Asaba, Yuu', NULL, N'-598732257', NULL, 2475, 7, CAST(N'2018-07-09 00:09:45.217' AS DateTime), 0, N'https://myanimelist.net/manga/51025/Absolute_Duo')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (78, N'Abunai Sennyuu Shuzai: Kininaru Kare wa Kawaii Eromen', N'Japanese: アブナイ潜入取材～気になる彼はかわいいＥｒｏＭＥＮ～, ', CAST(N'2014-05-15' AS Date), N'Yozakura, Sakyou', N'Sakurai, Makoto', NULL, N'-1773778652', NULL, 19, 5, CAST(N'2018-07-09 00:09:45.387' AS DateTime), 0, N'https://myanimelist.net/manga/105844/Abunai_Sennyuu_Shuzai__Kininaru_Kare_wa_Kawaii_Eromen')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (79, N'Abunai Sisters', N'Japanese: アブないシスターズ, ', CAST(N'2010-11-12' AS Date), N'Kamishiro, Ryuu', N'Senya, Yomi', NULL, N'1767133539', NULL, 58, 5, CAST(N'2018-07-09 00:09:45.450' AS DateTime), 0, N'https://myanimelist.net/manga/63583/Abunai_Sisters')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (80, N'Abunai Yuuwaku Beach: Bikini Joshidaisei no Doutei Shinan', N'Japanese: あぶない誘惑ビーチ ビキニ女子大生の童貞指南, ', CAST(N'2011-06-22' AS Date), N'Tokumei, Hero', N'Hayase, Mahito', NULL, N'-1582345859', NULL, 57, 5, CAST(N'2018-07-09 00:09:45.513' AS DateTime), 0, N'https://myanimelist.net/manga/67429/Abunai_Yuuwaku_Beach__Bikini_Joshidaisei_no_Doutei_Shinan')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (81, N'Abyss Gate', N'Japanese: アビスゲート, ', CAST(N'2007-10-20' AS Date), N'Kanzaka, Hajime', N'Yoshizumi, Kazuyuki', NULL, N'367103987', NULL, 43, 5, CAST(N'2018-07-09 00:09:45.557' AS DateTime), 0, N'https://myanimelist.net/manga/89904/Abyss_Gate')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (82, N'Accel World', N'English: Accel World, Japanese: アクセル・ワールド, ', CAST(N'2009-02-10' AS Date), N'Kawahara, Reki', N'HIMA', NULL, N'52016969', NULL, 6256, 7, CAST(N'2018-07-09 00:09:45.683' AS DateTime), 0, N'https://myanimelist.net/manga/23116/Accel_World')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (83, N'Adachi to Shimamura', N'Japanese: 安達としまむら, ', CAST(N'2012-10-10' AS Date), N'Iruma, Hitoma', N'Ousaka, Nozomi', NULL, N'-617185337', NULL, 262, 7, CAST(N'2018-07-09 00:09:45.807' AS DateTime), 0, N'https://myanimelist.net/manga/77597/Adachi_to_Shimamura')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (84, N'Adam Head Dorothy', N'Synonyms: Seidanzai Dorothy, Japanese: 聖断罪〈アダムヘッド〉ドロシー, ', CAST(N'2012-08-01' AS Date), N'Jyumonji, Ao', N'Suburi', NULL, N'1591138540', NULL, 76, 5, CAST(N'2018-07-09 00:09:45.870' AS DateTime), 0, N'https://myanimelist.net/manga/55941/Adam_Head_Dorothy')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (85, N'Advance of Z: The Traitor of Destiny', N'Synonyms: Advance of Zeta: The Traitor of Destiny, Advance of Zeta: Toki ni Aragaishi Mono, Kidou Senshi Gundam Advance of Z: Toki ni Aragaishi Mono, Japanese: ADVANCE OF Ζ 刻に抗いし者, ', CAST(N'2010-08-25' AS Date), N'Kamino, Junichi', N'', NULL, N'1696635263', NULL, 91, 5, CAST(N'2018-07-09 00:09:45.967' AS DateTime), 0, N'https://myanimelist.net/manga/42439/Advance_of_Z___The_Traitor_of_Destiny')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (86, N'Advance of Z: Flag of Titans', N'Synonyms: Mobile Suit Gundam - Advance of Zeta: The Flag of Titans, Japanese: アドバンス・オブ・Z～ティターンズの旗のもとに～, ', CAST(N'2002-09-25' AS Date), N'Konno, Bin', N'', NULL, N'1906879273', NULL, 119, 5, CAST(N'2018-07-09 00:09:46.043' AS DateTime), 0, N'https://myanimelist.net/manga/30725/Advance_of_Z__Flag_of_Titans')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (87, N'Aerial City', N'Synonyms: Toshi Series, Japanese: 都市シリーズ エアリアルシティ, ', CAST(N'1997-07-10' AS Date), N'Kawakami, Minoru', N'Nakakita, Kouji', NULL, N'-465013006', NULL, 47, 5, CAST(N'2018-07-09 00:09:46.107' AS DateTime), 0, N'https://myanimelist.net/manga/83919/Aerial_City')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (88, N'After Black', N'Japanese: アフターブラック, ;Japanese: After...,', CAST(N'2015-07-31' AS Date), N'Fal Maro;Taka, Tony', N'Kawada, Kigyoku;Satoda, Mitsuhiko', NULL, N'1589361416', NULL, 92, 5, CAST(N'2018-07-09 00:09:46.167' AS DateTime), 0, N'https://myanimelist.net/manga/91163/After_Black;https://myanimelist.net/manga/76581/After')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (89, N'After School Black Arts', N'Synonyms: Houkago no Mahou Sensou, Japanese: 放課後の魔法戦争〈アフタースクール・ブラックアーツ〉, ', CAST(N'2013-03-10' AS Date), N'Sarachi, Yomi', N'Suzuki, Suzu', NULL, N'324154833', NULL, 127, 5, CAST(N'2018-07-09 00:09:46.273' AS DateTime), 0, N'https://myanimelist.net/manga/59271/After_School_Black_Arts')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (90, N'Afternoon Lavendar', N'Synonyms: Wu Hou Xun Yi Cha, The Little Witch&#039;s Sure-Fire Techniques, The Lavendar Tea, Japanese: 午后薰衣茶, ', NULL, N'Ming, Xiao Xi', N'', NULL, N'794906841', NULL, 52, 5, CAST(N'2018-07-09 00:09:46.507' AS DateTime), 0, N'https://myanimelist.net/manga/69059/Afternoon_Lavendar')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (91, N'Aftipitos Senki', N'English: Record of Aftipitos Wars., Japanese: アフティピトス戦記, ', CAST(N'2014-12-20' AS Date), N'Noyama, Fuuichirou', N'Netsuki', NULL, N'1153504789', NULL, 37, 5, CAST(N'2018-07-09 00:09:46.603' AS DateTime), 0, N'https://myanimelist.net/manga/84797/Aftipitos_Senki')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (92, N'Agharta Fiesta!', N'Japanese: アガルタ・フィエスタ!, ', CAST(N'2004-12-25' AS Date), N'Sanda, Makoto', N'Souryuu', NULL, N'-1861728511', NULL, 58, 5, CAST(N'2018-07-09 00:09:46.697' AS DateTime), 0, N'https://myanimelist.net/manga/55879/Agharta_Fiesta')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (93, N'Ahegao Minai de! Sensei wa Cool Taimashi', N'Japanese: アヘ顔見ないで！　先生はクールな退魔士, ', CAST(N'2010-07-20' AS Date), N'Kino, Hitoshi', N'Takaha, Shin', NULL, N'1658643704', NULL, 46, 5, CAST(N'2018-07-09 00:09:46.910' AS DateTime), 0, N'https://myanimelist.net/manga/65741/Ahegao_Minai_de_Sensei_wa_Cool_Taimashi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (94, N'Aheochi Harem: Houkago Ikigao Keiyakusho', N'Japanese: アヘオチハーレム 放課後イキ顔契約書, ', CAST(N'2014-02-20' AS Date), N'Uehara, Ryou', N'Yukirin', NULL, N'406362635', NULL, 59, 5, CAST(N'2018-07-09 00:09:47.033' AS DateTime), 0, N'https://myanimelist.net/manga/66919/Aheochi_Harem__Houkago_Ikigao_Keiyakusho')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (95, N'Ai Cute!: Kimi ni Koishiteru', N'Japanese: 愛cute！キミに恋してる, ', CAST(N'2004-06-25' AS Date), N'Palette', N'Tamahiyo', NULL, N'-2070954076', NULL, 24, 5, CAST(N'2018-07-09 00:09:47.190' AS DateTime), 0, N'https://myanimelist.net/manga/70635/Ai_Cute__Kimi_ni_Koishiteru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (96, N'Ai da Koi da wo Torishimaru Ore ni, Haru ga Yattekita node Chaos', N'Synonyms: Ai da Koi da wo Torishimaru Ore ni, Haru ga Yattekita node Muchitsujo, Japanese: 愛だ恋だを取り締まる俺に、春がやってきたので無秩序〈カオス〉, ', CAST(N'2014-09-01' AS Date), N'Takei, Touka', N'Saisai', NULL, N'-2137310051', NULL, 43, 5, CAST(N'2018-07-09 00:09:47.273' AS DateTime), 0, N'https://myanimelist.net/manga/79971/Ai_da_Koi_da_wo_Torishimaru_Ore_ni_Haru_ga_Yattekita_node_Chaos')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (97, N'Ai de Kitsuku Shibaritai', N'Synonyms: Gefesselt in Liebe, Bound in Love, Tied Up in Love, Ai de Kitsukushibaritai, Japanese: 愛できつく縛りたい, ', NULL, N'Takanaga, Hinako', N'Kitazawa, Jinko', NULL, N'-1199735118', NULL, 409, 6, CAST(N'2018-07-09 00:09:47.397' AS DateTime), 0, N'https://myanimelist.net/manga/22802/Ai_de_Kitsuku_Shibaritai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (98, N'Ai ga Areba Koibito ni Saiminjutsu wo Kakete mo Mondainai yo ne?', N'Japanese: 愛があれば恋人に催眠術をかけても問題ないよね?, ', CAST(N'2016-04-15' AS Date), N'Jun', N'Giuniu', NULL, N'68367862', NULL, 36, 5, CAST(N'2018-07-09 00:11:33.387' AS DateTime), 0, N'https://myanimelist.net/manga/97742/Ai_ga_Areba_Koibito_ni_Saiminjutsu_wo_Kakete_mo_Mondainai_yo_ne')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (99, N'Ai nante Niawanai', N'Japanese: 愛なんて似合わない, ', CAST(N'2015-10-09' AS Date), N'Araragi, Soushi', N'Suzutsuki, Kanade', NULL, N'1232230753', NULL, 16, 5, CAST(N'2018-07-09 00:11:33.543' AS DateTime), 0, N'https://myanimelist.net/manga/106620/Ai_nante_Niawanai')
GO
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (100, N'Ai ni Nureru Hana to Tsumi', N'Japanese: 愛に濡れる花と罪, ', CAST(N'2016-11-11' AS Date), N'Toilet', N'Shibata, Karen', NULL, N'1973330723', NULL, 4, 5, CAST(N'2018-07-09 00:11:33.717' AS DateTime), 0, N'https://myanimelist.net/manga/109629/Ai_ni_Nureru_Hana_to_Tsumi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (101, N'Ai no Hana: Kizoku ni Amaku Kuchizukerarete', N'Japanese: 愛の華　貴族に甘く口づけられて, ', CAST(N'2011-01-07' AS Date), N'Sakamoto, Akira', N'Nagatanien, Sakura', NULL, N'836428684', NULL, 21, 5, CAST(N'2018-07-09 00:11:33.803' AS DateTime), 0, N'https://myanimelist.net/manga/100492/Ai_no_Hana__Kizoku_ni_Amaku_Kuchizukerarete')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (102, N'Ai no Kusabi', N'English: Ai no Kusabi, Synonyms: Wedge of Interval,  Love&#039;s Wedge, Wedge Between, The Space Between, Japanese: 間の楔, ', NULL, N'Yoshihara, Rieko', N'Michihara, Katsumi', NULL, N'-1599964082', NULL, 2820, 8, CAST(N'2018-07-09 00:11:33.943' AS DateTime), 0, N'https://myanimelist.net/manga/1401/Ai_no_Kusabi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (103, N'Ai no Ori: Kishi ni Midara ni Furerarete', N'Japanese: 愛の檻　騎士に淫らに触れられて, ', CAST(N'2010-09-05' AS Date), N'Sakamoto, Akira', N'Nagatanien, Sakura', NULL, N'-522263948', NULL, 13, 5, CAST(N'2018-07-09 00:11:34.163' AS DateTime), 0, N'https://myanimelist.net/manga/100491/Ai_no_Ori__Kishi_ni_Midara_ni_Furerarete')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (104, N'Ai no Shinjitsu: Kanjisasete', N'Japanese: 愛の真実　感じさせて, ', CAST(N'2016-04-15' AS Date), N'Youmou, Usagi', N'Amamiya, Kouko', NULL, N'-588906260', NULL, 14, 5, CAST(N'2018-07-09 00:11:34.290' AS DateTime), 0, N'https://myanimelist.net/manga/107538/Ai_no_Shinjitsu__Kanjisasete')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (105, N'Ai no Tane', N'Japanese: 愛の種, ', CAST(N'2014-02-03' AS Date), N'Mizuki, Tatsu', N'chi-co', NULL, N'1203437667', NULL, 18, 5, CAST(N'2018-07-09 00:11:34.380' AS DateTime), 0, N'https://myanimelist.net/manga/100239/Ai_no_Tane')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (106, N'Ai sae Areba Toshishita nante', N'Japanese: 愛さえあれば年下なんて, ', NULL, N'Sugahara, Ryuu', N'Mizushima, Shinobu', NULL, N'1145144431', NULL, 22, 5, CAST(N'2018-07-09 00:11:34.520' AS DateTime), 0, N'https://myanimelist.net/manga/87831/Ai_sae_Areba_Toshishita_nante')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (107, N'Ai Senshi Maria: Black Mission 1999', N'Synonyms: Love Warrior Maria, Japanese: 愛戦士マリア BLACKミッション1999, ', NULL, N'Ryuumon, Kazuki', N'Minazuki, Ayu', NULL, N'576532318', NULL, 19, 5, CAST(N'2018-07-09 00:11:34.597' AS DateTime), 0, N'https://myanimelist.net/manga/87573/Ai_Senshi_Maria__Black_Mission_1999')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (108, N'Ai shika Iranee yo.', N'English: All You Need is Love, Japanese: 愛しかいらねえよ。, ', NULL, N'Fuyuno, Jinko', N'Takatsuki, Noboru', NULL, N'1979686946', NULL, 329, 7, CAST(N'2018-07-09 00:11:34.737' AS DateTime), 0, N'https://myanimelist.net/manga/19769/Ai_shika_Iranee_yo')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (109, N'Ai to Kanashimi no Esperman', N'Japanese: 愛と哀しみのエスパーマン, ', CAST(N'2005-10-20' AS Date), N'Akita, Yoshinobu', N'Watari, Masahito', NULL, N'1249262536', NULL, 14, 5, CAST(N'2018-07-09 00:11:34.887' AS DateTime), 0, N'https://myanimelist.net/manga/90154/Ai_to_Kanashimi_no_Esperman')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (110, N'Ai to Seigi no Hokeni Shirakawa Seiko', N'Japanese: 愛と正義の保健医・白河聖子, ', NULL, N'Houshou, Rei', N'Sakaki, Muramasa', NULL, N'-1167455006', NULL, 19, 5, CAST(N'2018-07-09 00:11:35.027' AS DateTime), 0, N'https://myanimelist.net/manga/85443/Ai_to_Seigi_no_Hokeni_Shirakawa_Seiko')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (111, N'Ai wo Tsumugu Kizuato', N'Japanese: 愛を紡ぐ傷痕, ', CAST(N'2015-08-17' AS Date), N'Honoo, Kairyo', N'Aikawa, Serika', NULL, N'-1597965561', NULL, 15, 5, CAST(N'2018-07-09 00:11:35.077' AS DateTime), 0, N'https://myanimelist.net/manga/106502/Ai_wo_Tsumugu_Kizuato')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (112, N'Ai yori mo Fukaku', N'Japanese: 愛よりも深く, ', CAST(N'2016-09-03' AS Date), N'Himeno, Yuri', N'Hachi, Fujiko', NULL, N'-1663569880', NULL, 14, 5, CAST(N'2018-07-09 00:11:35.220' AS DateTime), 0, N'https://myanimelist.net/manga/100838/Ai_yori_mo_Fukaku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (113, N'Ai-Sis!: Anata dake no Idol Imouto', N'Japanese: アイシス！～アナタだけのアイドル妹～, ', CAST(N'2013-07-20' AS Date), N'Tsukino, Otogi', N'Takano, Yuki', NULL, N'-379835971', NULL, 39, 5, CAST(N'2018-07-09 00:11:35.353' AS DateTime), 0, N'https://myanimelist.net/manga/67363/Ai-Sis__Anata_dake_no_Idol_Imouto')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (114, N'Aien no Keiyaku: Oujo wa Ryuu ni Dakareru', N'Japanese: 愛炎の契約 王女は竜に抱かれる, ', CAST(N'2015-07-25' AS Date), N'Shiraishi, Mato', N'Ikegami, Sakyou', NULL, N'-1433321325', NULL, 14, 5, CAST(N'2018-07-09 00:11:35.493' AS DateTime), 0, N'https://myanimelist.net/manga/105218/Aien_no_Keiyaku__Oujo_wa_Ryuu_ni_Dakareru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (115, N'Aigan Koukyuu: Ryuutei to Aoi Hitomi no Kisaki', N'Japanese: 愛玩後宮　龍帝と青い瞳の妃, ', CAST(N'2015-01-17' AS Date), N'Serina, Rise', N'Hayase, Akira', NULL, N'1086646132', NULL, 20, 5, CAST(N'2018-07-09 00:11:35.617' AS DateTime), 0, N'https://myanimelist.net/manga/101405/Aigan_Koukyuu__Ryuutei_to_Aoi_Hitomi_no_Kisaki')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (116, N'Aigan Maid: Ouji to Sugosu Himitsu no Yoru', N'Japanese: 愛玩メイド 王子とすごすヒミツの夜, ', CAST(N'2016-07-29' AS Date), N'Komada, Hachi', N'Amaou, Beni', NULL, N'-1482849351', NULL, 21, 5, CAST(N'2018-07-09 00:11:35.743' AS DateTime), 0, N'https://myanimelist.net/manga/102054/Aigan_Maid__Ouji_to_Sugosu_Himitsu_no_Yoru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (117, N'Aigan Ouji to Himesama', N'Japanese: 愛玩王子と姫さま, ', CAST(N'2015-02-02' AS Date), N'Akino, Shinju', N'gamu', NULL, N'-2049165198', NULL, 11, 5, CAST(N'2018-07-09 00:11:35.883' AS DateTime), 0, N'https://myanimelist.net/manga/102661/Aigan_Ouji_to_Himesama')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (118, N'Aigan Reijou: Inai Kinbaku Romanesque', N'Japanese: 愛玩令嬢　淫愛緊縛ロマネスク, ', CAST(N'2016-01-29' AS Date), N'Kirino, Rino', N'BENIO', NULL, N'1722975904', NULL, 11, 5, CAST(N'2018-07-09 00:11:36.007' AS DateTime), 0, N'https://myanimelist.net/manga/108050/Aigan_Reijou__Inai_Kinbaku_Romanesque')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (119, N'Aigan Reijou: Uruwashi no Bisque Doll', N'Synonyms: Aigan Reijou: Uruwashi no Ningyou, Japanese: 愛玩令嬢 麗しの人形〈ビスクドール〉, ', CAST(N'2012-08-03' AS Date), N'Sugahara, Ryuu', N'Yuzuhara, Tail', NULL, N'384952796', NULL, 18, 5, CAST(N'2018-07-09 00:11:36.133' AS DateTime), 0, N'https://myanimelist.net/manga/87771/Aigan_Reijou__Uruwashi_no_Bisque_Doll')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (120, N'Aigan-hime no Shinya Zangyou', N'Japanese: 愛玩姫の深夜残業, ', CAST(N'2014-04-11' AS Date), N'Aimi, Rui', N'Kouramaru', NULL, N'1608455928', NULL, 9, 5, CAST(N'2018-07-09 00:11:36.323' AS DateTime), 0, N'https://myanimelist.net/manga/108207/Aigan-hime_no_Shinya_Zangyou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (121, N'Aigan: Keiyaku kara Hajimaru Love Romance', N'Japanese: 愛玩 ～契約からはじまるラブロマンス～, ', CAST(N'2012-11-30' AS Date), N'Tachibana, Misaki', N'nira.', NULL, N'-1541253791', NULL, 17, 5, CAST(N'2018-07-09 00:11:36.420' AS DateTime), 0, N'https://myanimelist.net/manga/106297/Aigan__Keiyaku_kara_Hajimaru_Love_Romance')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (122, N'Aihara Soyogi no Nayamigoto: Toki wo Tomeru Nouryokusha ni Douyattara Kateru to Omou?', N'Japanese: 愛原そよぎのなやみごと 時を止める能力者にどうやったら勝てると思う？, ', CAST(N'2017-03-30' AS Date), N'Kagome', N'Yukise, Hiuro', NULL, N'-1848068996', NULL, 34, 5, CAST(N'2018-07-09 00:11:36.577' AS DateTime), 0, N'https://myanimelist.net/manga/104886/Aihara_Soyogi_no_Nayamigoto__Toki_wo_Tomeru_Nouryokusha_ni_Douyattara_Kateru_to_Omou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (123, N'Aiin no Daishou: Toraware no Kotori-hime', N'Japanese: 愛淫の代償　囚われの小鳥姫, ', CAST(N'2014-06-21' AS Date), N'Takano, Yumi', N'Shichifuku, Sayuri', NULL, N'724479895', NULL, 65, 5, CAST(N'2018-07-09 00:11:36.703' AS DateTime), 0, N'https://myanimelist.net/manga/100202/Aiin_no_Daishou__Toraware_no_Kotori-hime')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (124, N'Aijin Keiyaku', N'Japanese: 愛人契約, ', CAST(N'2016-08-05' AS Date), N'Youmou, Usagi', N'Satomi, Hoda', NULL, N'1754898869', NULL, 10, 5, CAST(N'2018-07-09 00:11:36.827' AS DateTime), 0, N'https://myanimelist.net/manga/107612/Aijin_Keiyaku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (125, N'AIKa ZERO: Paradise Blue', N'Japanese: AIKa ZERO パラダイス・ブルー, ', CAST(N'2009-08-21' AS Date), N'Kazushi', N'Shijou, Sadafumi', NULL, N'99852452', NULL, 19, 5, CAST(N'2018-07-09 00:11:36.950' AS DateTime), 0, N'https://myanimelist.net/manga/91089/AIKa_ZERO__Paradise_Blue')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (126, N'Aikagi: Hidamari to Kanojo no Heyagi - Ayane-hen', N'Japanese: あいかぎ～ひだまりと彼女の部屋着～ 彩音編, ;Japanese: あいかぎ～ひだまりと彼女の部屋着～ 千香編, ;Aikagi: Hidamari to Kanojo no Heyagi - Chika-hen', CAST(N'2003-06-20' AS Date), N'Suzuhira, Hiro', N'Murakami, Saki', NULL, N'1798036419', NULL, 20, 5, CAST(N'2018-07-09 00:11:37.183' AS DateTime), 0, N'https://myanimelist.net/manga/94304/Aikagi__Hidamari_to_Kanojo_no_Heyagi_-_Ayane-hen;https://myanimelist.net/manga/97778/Aikagi__Hidamari_to_Kanojo_no_Heyagi_-_Chika-hen')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (127, N'Aimai Lesson: Chimitsu no Leotard', N'Japanese: 愛妹レッスン 恥蜜のレオタード, ', CAST(N'2014-07-02' AS Date), N'Kodou, Kuuji', N'Shoumaru', NULL, N'1835740789', NULL, 25, 5, CAST(N'2018-07-09 00:11:37.497' AS DateTime), 0, N'https://myanimelist.net/manga/80467/Aimai_Lesson__Chimitsu_no_Leotard')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (128, N'Aimai Renai: Kekkon Shitai! Otome no Nijou♪', N'Japanese: 愛妹恋愛　ケッコンしたい！オトメの二乗♪, ', CAST(N'2014-07-31' AS Date), N'Satofuji, Masato', N'Interheart', NULL, N'34038534', NULL, 41, 5, CAST(N'2018-07-09 00:11:37.590' AS DateTime), 0, N'https://myanimelist.net/manga/82393/Aimai_Renai__Kekkon_Shitai_Otome_no_Nijou♪')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (129, N'Aimane!: Idol Is Money!?', N'Japanese: あいまねっ！－Idol is money!?－, ', CAST(N'2014-01-18' AS Date), N'Hirayama, Hiroteru', N'Aka', NULL, N'1484852977', NULL, 35, 5, CAST(N'2018-07-09 00:11:37.667' AS DateTime), 0, N'https://myanimelist.net/manga/80121/Aimane__Idol_Is_Money')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (130, N'Aimite no: Rakka no Shitone', N'Japanese: 逢ひ見ての ～落花の褥～, ', CAST(N'2014-07-25' AS Date), N'Asagi, Miho', N'Oujo, Uko', NULL, N'1499694354', NULL, 11, 5, CAST(N'2018-07-09 00:11:37.800' AS DateTime), 0, N'https://myanimelist.net/manga/105192/Aimite_no__Rakka_no_Shitone')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (131, N'Aimitsu no Fukushuu: Hakushaku to Maid', N'Japanese: 愛蜜の復讐　伯爵とメイド, ', CAST(N'2012-07-05' AS Date), N'Mizushima, Shinobu', N'Hayase, Akira', NULL, N'1697093223', NULL, 22, 5, CAST(N'2018-07-09 00:11:37.950' AS DateTime), 0, N'https://myanimelist.net/manga/100287/Aimitsu_no_Fukushuu__Hakushaku_to_Maid')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (132, N'Aimitsu Splash: Oresama Shachou no Suichuu Lesson', N'Japanese: 愛蜜スプラッシュ　～俺様社長の水中レッスン～, ', CAST(N'2014-07-31' AS Date), N'Tatsumi, Jin', N'Hana, Mizuki', NULL, N'-466911247', NULL, 11, 5, CAST(N'2018-07-09 00:11:38.193' AS DateTime), 0, N'https://myanimelist.net/manga/104979/Aimitsu_Splash__Oresama_Shachou_no_Suichuu_Lesson')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (133, N'Aine: Hagareyuku Dansou no Kamen', N'Japanese: AINE―アイン― 剥がれゆく男装の仮面, ', CAST(N'2016-05-14' AS Date), N'089, Tarou', N'Akame', NULL, N'-606469604', NULL, 20, 5, CAST(N'2018-07-09 00:11:38.347' AS DateTime), 0, N'https://myanimelist.net/manga/99025/Aine__Hagareyuku_Dansou_no_Kamen')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (134, N'Aira Series', N'Synonyms: Aila, Seiria no Kenki, Yurusarenu Omoi, Eien no Chikai, Japanese: アイラシーリス, ', CAST(N'2013-03-02' AS Date), N'Sugahara, Ryuu', N'Yoshida, Tamaki', NULL, N'939836998', NULL, 23, 5, CAST(N'2018-07-09 00:11:38.427' AS DateTime), 0, N'https://myanimelist.net/manga/87761/Aira_Series')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (135, N'Airen no Ori: Shino Tayuu no Hatsukoi', N'Japanese: 愛煉〈あいれん〉の檻 紫乃太夫〈しのだゆう〉の初恋, ', CAST(N'2014-12-03' AS Date), N'Oyamada, Ami', N'Inukai, Nono', NULL, N'1902166162', NULL, 53, 5, CAST(N'2018-07-09 00:11:38.553' AS DateTime), 0, N'https://myanimelist.net/manga/83227/Airen_no_Ori__Shino_Tayuu_no_Hatsukoi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (136, N'Aires no Shisho', N'English: The Book of the Dead Aires, Japanese: アイレスの死書, ', CAST(N'2017-04-25' AS Date), N'RiE', N'Hasumi, Keika', NULL, N'-1905983430', NULL, 37, 5, CAST(N'2018-07-09 00:11:38.630' AS DateTime), 0, N'https://myanimelist.net/manga/105986/Aires_no_Shisho')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (137, N'Aisa no Koukyuu: Hime wa Shinshitsu ni Tsunagareru', N'Japanese: 愛鎖の皇宮　姫は寝室に繋がれる, ', CAST(N'2014-03-17' AS Date), N'Serina, Rise', N'Ichiya', NULL, N'752694241', NULL, 15, 5, CAST(N'2018-07-09 00:11:38.757' AS DateTime), 0, N'https://myanimelist.net/manga/101392/Aisa_no_Koukyuu__Hime_wa_Shinshitsu_ni_Tsunagareru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (138, N'Aisai Nikki', N'Japanese: 愛妻日記, ', CAST(N'2010-12-23' AS Date), N'Kuroda, Akimi', N'Fuse, Haruka', NULL, N'-1686670469', NULL, 113, 5, CAST(N'2018-07-09 00:11:38.880' AS DateTime), 0, N'https://myanimelist.net/manga/68473/Aisai_Nikki')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (139, N'Aisai: Kaikan Massage', N'Japanese: 愛妻　快感マッサージ, ', CAST(N'2014-02-21' AS Date), N'Youmou, Usagi', N'Mint', NULL, N'1863748771', NULL, 14, 5, CAST(N'2018-07-09 00:11:38.957' AS DateTime), 0, N'https://myanimelist.net/manga/107444/Aisai__Kaikan_Massage')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (140, N'Aisaka Suteki na Shoukougun', N'Japanese: 藍坂素敵な症候群, ', CAST(N'2010-01-10' AS Date), N'Toujou, Sakana', N'Minase, Hazuki', NULL, N'-1904792721', NULL, 38, 5, CAST(N'2018-07-09 00:11:39.037' AS DateTime), 0, N'https://myanimelist.net/manga/55153/Aisaka_Suteki_na_Shoukougun')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (141, N'Aisare Roommate', N'Japanese: 愛サレるームメイト, ', CAST(N'2014-06-20' AS Date), N'Ricotta', N'Reon', NULL, N'-1238654555', NULL, 47, 5, CAST(N'2018-07-09 00:11:39.260' AS DateTime), 0, N'https://myanimelist.net/manga/77749/Aisare_Roommate')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (142, N'Aisare World: I really, truly surrender to you. - Fuyumihara Hisamabu no Kaiketsu Nisshi', N'Japanese: アイサレワールド‐I really, truly surrender to you．‐ 冬美原久真部の解決日誌, ', CAST(N'2015-08-22' AS Date), N'Nozomi, Kota', N'Pikazo, Mika', NULL, N'1639596380', NULL, 53, 5, CAST(N'2018-07-09 00:11:39.433' AS DateTime), 0, N'https://myanimelist.net/manga/91702/Aisare_World__I_really_truly_surrender_to_you_-_Fuyumihara_Hisamabu_no_Kaiketsu_Nisshi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (143, N'Aisareru Hodo, Hentai ni', N'Japanese: 愛されるほど、変態に, ', CAST(N'2016-08-05' AS Date), N'Youmou, Usagi', N'Miharu, Nami', NULL, N'979219367', NULL, 9, 5, CAST(N'2018-07-09 00:11:39.607' AS DateTime), 0, N'https://myanimelist.net/manga/107649/Aisareru_Hodo_Hentai_ni')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (144, N'Aisaretagari no Ohimesama', N'Japanese: 愛されたがりのお姫様, ', CAST(N'2015-02-06' AS Date), N'Tsukiya, Kokko', N'Hayase, Sakura', NULL, N'1423592146', NULL, 11, 5, CAST(N'2018-07-09 00:11:39.700' AS DateTime), 0, N'https://myanimelist.net/manga/108943/Aisaretagari_no_Ohimesama')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (145, N'Aishi no Doll', N'Japanese: 愛しのドール, ', CAST(N'2014-05-15' AS Date), N'Yozakura, Sakyou', N'Kanchiku, Izumi', NULL, N'-662892255', NULL, 11, 5, CAST(N'2018-07-09 00:11:39.760' AS DateTime), 0, N'https://myanimelist.net/manga/105782/Aishi_no_Doll')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (146, N'Aishi no Hero wa Toshishita Wanko: Takumashii kedo M nan desu.', N'Japanese: 愛しのヒーローは年下ワンコ　たくましいけどＭなんです。, ', CAST(N'2015-09-25' AS Date), N'Masaki, Mitsuki', N'Nice H', NULL, N'2032575036', NULL, 10, 5, CAST(N'2018-07-09 00:11:39.887' AS DateTime), 0, N'https://myanimelist.net/manga/106911/Aishi_no_Hero_wa_Toshishita_Wanko__Takumashii_kedo_M_nan_desu')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (147, N'Aishi, Aisare, Fumaretai.', N'Japanese: 愛し、愛され、踏まれたい。, ', CAST(N'2014-07-03' AS Date), N'Hitaki', N'Aoto, Aka', NULL, N'34956748', NULL, 12, 5, CAST(N'2018-07-09 00:13:26.787' AS DateTime), 0, N'https://myanimelist.net/manga/105319/Aishi_Aisare_Fumaretai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (148, N'Aishiteru Aishiteru Aishiteru', N'Japanese: 愛してる愛してる愛してる, ', CAST(N'2016-04-08' AS Date), N'Kurohashi, Kirika', N'Nakata, Megumi', NULL, N'599841336', NULL, 10, 5, CAST(N'2018-07-09 00:13:26.987' AS DateTime), 0, N'https://myanimelist.net/manga/105880/Aishiteru_Aishiteru_Aishiteru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (149, N'Aishu Zenchaku', N'Japanese: 愛執染着, ', CAST(N'2017-03-01' AS Date), N'Komada, Hachi', N'Kaori', NULL, N'756889938', NULL, 15, 5, CAST(N'2018-07-09 00:13:27.190' AS DateTime), 0, N'https://myanimelist.net/manga/106291/Aishu_Zenchaku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (150, N'Aishuu no Lesson: Operaza no Yami ni Dakarete', N'Japanese: 愛執のレッスン オペラ座の闇に抱かれ, ', CAST(N'2016-02-22' AS Date), N'Mikazuki, Kougetsu', N'Asahiko', NULL, N'-2077840735', NULL, 21, 5, CAST(N'2018-07-09 00:13:27.340' AS DateTime), 0, N'https://myanimelist.net/manga/100263/Aishuu_no_Lesson__Operaza_no_Yami_ni_Dakarete')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (151, N'Aishuu: Koushaku no Kizu, Hanayome no Uso', N'Japanese: 愛囚～公爵の傷、花嫁の嘘～, ', CAST(N'2015-11-30' AS Date), N'KRN', N'Yashiro, Yoneka', NULL, N'-33851977', NULL, 12, 5, CAST(N'2018-07-09 00:13:27.497' AS DateTime), 0, N'https://myanimelist.net/manga/104808/Aishuu__Koushaku_no_Kizu_Hanayome_no_Uso')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (152, N'Aisuru Musume kara no Kyouikuteki Shidou', N'Synonyms: I Love Musume, Japanese: 愛するムスメからの教育的指導, ', CAST(N'2013-05-10' AS Date), N'Hika', N'Aioi, Ion', NULL, N'364001847', NULL, 48, 5, CAST(N'2018-07-09 00:13:27.670' AS DateTime), 0, N'https://myanimelist.net/manga/66553/Aisuru_Musume_kara_no_Kyouikuteki_Shidou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (153, N'Aiwaku no Ningyohime: Amai Shitto to Koi no Sakuryaku', N'English: Sweet jealousy and deception of love, Japanese: 愛惑の人魚姫～甘い嫉妬と恋の策略～, ', CAST(N'2016-12-15' AS Date), N'Yuzuki, Mia', N'Nekoya, Chaki', NULL, N'-468938017', NULL, 14, 5, CAST(N'2018-07-09 00:13:27.840' AS DateTime), 0, N'https://myanimelist.net/manga/105973/Aiwaku_no_Ningyohime__Amai_Shitto_to_Koi_no_Sakuryaku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (154, N'Aiyoku Choukyou: Ojousama to Toshiue Boukun', N'Japanese: 愛欲調教〜お嬢さまと年上暴君〜, ', CAST(N'2013-10-31' AS Date), N'Kazuki, Ruko', N'JIN-I', NULL, N'-1943979592', NULL, 13, 5, CAST(N'2018-07-09 00:13:27.997' AS DateTime), 0, N'https://myanimelist.net/manga/104928/Aiyoku_Choukyou__Ojousama_to_Toshiue_Boukun')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (155, N'Aiyoku no Eustia', N'Synonyms: Eustia of the Tarnished Wings, Japanese: 穢翼のユースティア, ;Synonyms: Aiyoku no Eustia: Kako-hen, Japanese: 穢翼のユースティア Auld Lang Syne《過去編》, ;Aiyoku no Eustia: Auld Lang Syne', CAST(N'2011-11-25' AS Date), N'bekkankou;August', N'August;Ponjiritsu', NULL, N'673655652', NULL, 68, 5, CAST(N'2018-07-09 00:13:28.183' AS DateTime), 0, N'https://myanimelist.net/manga/85005/Aiyoku_no_Eustia;https://myanimelist.net/manga/85007/Aiyoku_no_Eustia__Auld_Lang_Syne')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (156, N'Aiyoku no Nakaba, In to You no Doukoku: Injoku wa Seifuku no Shita ni', N'Japanese: 愛欲の半ば、陰と陽の慟哭～淫辱は制服の下に～, ', CAST(N'2009-05-23' AS Date), N'Ribahara, Aki', N'Ail', NULL, N'1415583653', NULL, 41, 5, CAST(N'2018-07-09 00:13:28.797' AS DateTime), 0, N'https://myanimelist.net/manga/78947/Aiyoku_no_Nakaba_In_to_You_no_Doukoku__Injoku_wa_Seifuku_no_Shita_ni')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (157, N'Aiyuri Jogakuin e Youkoso', N'Japanese: 愛百合女学院へようこそ, ', CAST(N'2009-06-03' AS Date), N'Chi-Ran', N'Narita, Kuuko', NULL, N'-1128918991', NULL, 28, 5, CAST(N'2018-07-09 00:13:28.903' AS DateTime), 0, N'https://myanimelist.net/manga/100803/Aiyuri_Jogakuin_e_Youkoso')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (158, N'Ajisai no Kisetsu ni Bokura wa Kannou suru', N'Japanese: あじさいの季節に僕らは感応する, ', CAST(N'2014-07-30' AS Date), N'Shimo, Fumihiko', N'Shiina, You', NULL, N'922820444', NULL, 26, 5, CAST(N'2018-07-09 00:13:29.137' AS DateTime), 0, N'https://myanimelist.net/manga/92297/Ajisai_no_Kisetsu_ni_Bokura_wa_Kannou_suru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (159, N'Ajisai Sabou e Youkoso', N'Japanese: 紫陽花茶房へようこそ, ', CAST(N'2013-11-01' AS Date), N'Tagura, Tohru', N'Katayama, Waka', NULL, N'-1709488325', NULL, 44, 5, CAST(N'2018-07-09 00:13:29.353' AS DateTime), 0, N'https://myanimelist.net/manga/89951/Ajisai_Sabou_e_Youkoso')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (160, N'Aka', N'Japanese: 朱-Aka-, ', CAST(N'2004-02-18' AS Date), N'Shimizu, Mariko', N'NekoNeko-Soft', NULL, N'-402598946', NULL, 27, 5, CAST(N'2018-07-09 00:13:29.510' AS DateTime), 0, N'https://myanimelist.net/manga/75693/Aka')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (161, N'Aka no 9-ban [Reijuu]', N'Japanese: 赤の9番【隷従】, ', CAST(N'2010-01-10' AS Date), N'Aihara, Akira', N'Kazuoki', NULL, N'-1988979884', NULL, 22, 5, CAST(N'2018-07-09 00:13:29.713' AS DateTime), 0, N'https://myanimelist.net/manga/93402/Aka_no_9-ban_Reijuu')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (162, N'Aka no Cardinale', N'Japanese: 赫光〈あか〉の護法枢機卿〈カルディナーレ〉, ', CAST(N'2017-08-30' AS Date), N'Ureshino, Akihiko', N'Shindou, Arata', NULL, N'462278571', NULL, 22, 5, CAST(N'2018-07-09 00:13:29.807' AS DateTime), 0, N'https://myanimelist.net/manga/109376/Aka_no_Cardinale')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (163, N'Aka to Kuro no Nali Knights Series', N'Synonyms: Aka to Kuro no Hari Kishi, The Red and Black Knights of Nali, Japanese: 赤と黒の針騎士〈ナーリ・ナイツ〉シリーズ, ', CAST(N'2015-05-01' AS Date), N'Nagase, Sarasa', N'Nagi, Kasumi', NULL, N'-1556725143', NULL, 37, 5, CAST(N'2018-07-09 00:13:29.990' AS DateTime), 0, N'https://myanimelist.net/manga/93920/Aka_to_Kuro_no_Nali_Knights_Series')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (164, N'Aka-Pen Seirei no Shinken Seminar de Class Saikyou no Mahou Kenshi ni Naremashita', N'Japanese: 赤ペン精霊の神剣ゼミでクラス最強の魔法剣士になれました, ', CAST(N'2017-01-23' AS Date), N'Morita, Kisetsu', N'Bonnie', NULL, N'-55620148', NULL, 42, 5, CAST(N'2018-07-09 00:13:30.083' AS DateTime), 0, N'https://myanimelist.net/manga/103842/Aka-Pen_Seirei_no_Shinken_Seminar_de_Class_Saikyou_no_Mahou_Kenshi_ni_Naremashita')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (165, N'Akai Hitomi no Seraph', N'Japanese: 紅い瞳のセラフ, ', CAST(N'1998-08-10' AS Date), N'Bishop', N'Sakuragawa, Arisu', NULL, N'870493091', NULL, 25, 5, CAST(N'2018-07-09 00:13:30.513' AS DateTime), 0, N'https://myanimelist.net/manga/69743/Akai_Hitomi_no_Seraph')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (166, N'Akai Kutsu no Cinderella: Migawari Hanayome no Koi', N'Japanese: 赤い靴のシンデレラ　身代わり花嫁の恋, ', CAST(N'2015-07-22' AS Date), N'Yuzuki, Mia', N'Narumi, Mio', NULL, N'-2011135901', NULL, 16, 5, CAST(N'2018-07-09 00:13:30.700' AS DateTime), 0, N'https://myanimelist.net/manga/101876/Akai_Kutsu_no_Cinderella__Migawari_Hanayome_no_Koi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (167, N'Akai Kutsu to Akuma-hime', N'Synonyms: And Red Shoes Devil Princess, Japanese: 赤いくつと悪魔姫, ', CAST(N'2008-09-13' AS Date), N'Hidou, Ren', N'Shimizu, Mariko', NULL, N'-357723538', NULL, 40, 5, CAST(N'2018-07-09 00:13:30.873' AS DateTime), 0, N'https://myanimelist.net/manga/77971/Akai_Kutsu_to_Akuma-hime')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (168, N'Akai-kun ni wa Kanojo ga Inai', N'Japanese: 赤井くんには彼女がいない, ', CAST(N'2015-02-03' AS Date), N'Akisaka, Asahi', N'Mitaonsya', NULL, N'315427184', NULL, 33, 5, CAST(N'2018-07-09 00:13:31.060' AS DateTime), 0, N'https://myanimelist.net/manga/85215/Akai-kun_ni_wa_Kanojo_ga_Inai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (169, N'Akairo/Romance', N'Japanese: アカイロ/ロマンス, ;Japanese: アカイロ/ロマンス　拾遺譚, ;Akairo/Romance: Shuuitan', CAST(N'2008-08-10' AS Date), N'Kuramoto, Kaya', N'Fujiwara, Yuu', NULL, N'-798195797', NULL, 20, 5, CAST(N'2018-07-09 00:13:31.153' AS DateTime), 0, N'https://myanimelist.net/manga/89013/Akairo_Romance;https://myanimelist.net/manga/89014/Akairo_Romance__Shuuitan')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (170, N'Akaki Hitomi no Vampire', N'English: Crimson Eyes Vampire, Japanese: 紅き瞳のヴァンパイア, ', CAST(N'2005-12-09' AS Date), N'Tenmaso', N'Yamakawa, Isamu', NULL, N'1630532445', NULL, 31, 5, CAST(N'2018-07-09 00:13:31.777' AS DateTime), 0, N'https://myanimelist.net/manga/65009/Akaki_Hitomi_no_Vampire')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (171, N'Akaki Maou no Ikenie: Ruby Eyes Sacrifice', N'Japanese: 紅き魔王の生贄　ルビーアイズ・サクリファイス, ', CAST(N'2014-08-01' AS Date), N'Oosugi, Kazuma', N'Gokugetsu, Momo', NULL, N'-81361973', NULL, 22, 5, CAST(N'2018-07-09 00:13:31.950' AS DateTime), 0, N'https://myanimelist.net/manga/95662/Akaki_Maou_no_Ikenie__Ruby_Eyes_Sacrifice')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (172, N'Akaki Tsuki no Meguru Koro', N'Synonyms: Akaki Tsuki no Mawaru Koro, When the Red Moon Turns Around, Japanese: 赤き月の廻るころ, ', CAST(N'2009-04-01' AS Date), N'Nagi, Kasumi', N'Kigawa, Arata', NULL, N'-995070', NULL, 318, 7, CAST(N'2018-07-09 00:13:32.127' AS DateTime), 0, N'https://myanimelist.net/manga/56465/Akaki_Tsuki_no_Meguru_Koro')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (173, N'Akamurasaki Aoiko no Bunseki wa Detarame', N'Japanese: 赤村崎葵子の分析はデタラメ, ', CAST(N'2013-05-10' AS Date), N'Shimotsuki, Eight', N'Jukkaidou, Ikkei', NULL, N'1553184295', NULL, 24, 5, CAST(N'2018-07-09 00:13:32.433' AS DateTime), 0, N'https://myanimelist.net/manga/86589/Akamurasaki_Aoiko_no_Bunseki_wa_Detarame')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (174, N'Akaoni wa Mou Nakanai', N'Japanese: 赤鬼はもう泣かない, ', CAST(N'2011-06-17' AS Date), N'Horiguchi, Yukiko', N'Akesaka, Tsuzuri', NULL, N'243708599', NULL, 49, 5, CAST(N'2018-07-09 00:13:32.607' AS DateTime), 0, N'https://myanimelist.net/manga/56247/Akaoni_wa_Mou_Nakanai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (175, N'Akarui Kazokuhou Keikaku!', N'Japanese: 明るい家族砲計画っ!, ', CAST(N'2008-06-30' AS Date), N'Sasorigatame', N'Araki, Shin', NULL, N'1025691807', NULL, 47, 5, CAST(N'2018-07-09 00:13:33.043' AS DateTime), 0, N'https://myanimelist.net/manga/56813/Akarui_Kazokuhou_Keikaku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (176, N'Akaruku Tanoshii Saimin Gakuen: Ero Kousoku wo Ippai Tsukuttara Chou Riajuu ni Nareta!', N'Japanese: 明るく楽しい催眠学園～エロ校則をいっぱい作ったら超リア充になれた!～, ', CAST(N'2014-01-24' AS Date), N'Nagayori', N'Harukaze, Shiori', NULL, N'25480171', NULL, 64, 5, CAST(N'2018-07-09 00:13:33.823' AS DateTime), 0, N'https://myanimelist.net/manga/69807/Akaruku_Tanoshii_Saimin_Gakuen__Ero_Kousoku_wo_Ippai_Tsukuttara_Chou_Riajuu_ni_Nareta')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (177, N'Akatsuki no Battlogica', N'Synonyms: Akatsuki no Sentouronsha, Japanese: 暁の戦闘論者〈バトロジカ〉, ', CAST(N'2015-06-25' AS Date), N'Abe, Yoshitoshi', N'Oohoshi, Yuuji', NULL, N'1007849330', NULL, 47, 5, CAST(N'2018-07-09 00:13:34.297' AS DateTime), 0, N'https://myanimelist.net/manga/90541/Akatsuki_no_Battlogica')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (178, N'Akatsuki no Goei: Principal Goei Nikki', N'Japanese: 暁の護衛 プリンシパル護衛日記, ;Japanese: 暁の護衛 プリンシパル・ツキ, ;Akatsuki no Goei: Principal Tsuki', CAST(N'2009-07-31' AS Date), N'Tomose, Shunsaku', N'Syangrila;Shinji, Mao', NULL, N'2122674318', NULL, 66, 5, CAST(N'2018-07-09 00:13:34.423' AS DateTime), 0, N'https://myanimelist.net/manga/61687/Akatsuki_no_Goei__Principal_Goei_Nikki;https://myanimelist.net/manga/64099/Akatsuki_no_Goei__Principal_Tsuki')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (179, N'Akatsuki no Joou to Chiri no Yuusha', N'English: Queen of the dawn and hero of dust, Japanese: 暁の女王と塵の勇者, ', CAST(N'2015-10-02' AS Date), N'Andou, Hakuri', N'Fujishima', NULL, N'-1091093939', NULL, 56, 5, CAST(N'2018-07-09 00:13:34.853' AS DateTime), 0, N'https://myanimelist.net/manga/92868/Akatsuki_no_Joou_to_Chiri_no_Yuusha')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (180, N'Akatsuki no Renka: Hanayome wa Seiya ni Kanaderareru', N'Japanese: 暁の恋歌～花嫁は聖夜に奏でられる～, ', CAST(N'2013-12-03' AS Date), N'Shiina, Satsuki', N'Kamisu, Saya', NULL, N'-1891814217', NULL, 12, 5, CAST(N'2018-07-09 00:13:35.180' AS DateTime), 0, N'https://myanimelist.net/manga/104648/Akatsuki_no_Renka__Hanayome_wa_Seiya_ni_Kanaderareru')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (181, N'Akatsuki no Vampiress: Aglaiarden no Hiyuri', N'Synonyms: Akatsuki no Vampiress: Agreiarden no Hiyuri, Vampiress of the Dawn: Aglaiarden&#039;s Scarlet Lily, Japanese: 暁のヴァンピレス～アグレイアーデンの緋百合～, ', CAST(N'2014-04-19' AS Date), N'PEACH‐PIT', N'Sakurai, Hikaru', NULL, N'1639129719', NULL, 75, 5, CAST(N'2018-07-09 00:13:35.430' AS DateTime), 0, N'https://myanimelist.net/manga/85677/Akatsuki_no_Vampiress__Aglaiarden_no_Hiyuri')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (182, N'Akatsuki no Yona', N'Synonyms: Yona of the Dawn, Akatsuki no Yona: Under the Same Moon, Japanese: 暁のヨナ, ', CAST(N'2015-03-20' AS Date), N'Kusanagi, Mizuho', N'Fujitani, Touko', NULL, N'1205465546', NULL, 4652, 8, CAST(N'2018-07-09 00:13:35.713' AS DateTime), 0, N'https://myanimelist.net/manga/87953/Akatsuki_no_Yona')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (183, N'Akatsuki no Yume Tsukai-tachi', N'English: Dream Maker in Dawn, Japanese: 暁の夢使いたち, ', CAST(N'2014-07-18' AS Date), N'Hasegawa, Miyabi', N'Takano, Yuki', NULL, N'-254466250', NULL, 45, 5, CAST(N'2018-07-09 00:13:36.247' AS DateTime), 0, N'https://myanimelist.net/manga/76111/Akatsuki_no_Yume_Tsukai-tachi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (184, N'Akechi Shounen no Kojitsuke', N'Japanese: 明智少年のこじつけ, ', CAST(N'2012-01-30' AS Date), N'Kasuga, Ayumu', N'Michibata, Satto', NULL, N'-1210050085', NULL, 27, 5, CAST(N'2018-07-09 00:13:36.547' AS DateTime), 0, N'https://myanimelist.net/manga/92257/Akechi_Shounen_no_Kojitsuke')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (185, N'Akiba Senki', N'Japanese: アキバ戦記, ', CAST(N'2016-06-01' AS Date), N'Hisaka, Hazara', N'Yoshikawa, Heiho', NULL, N'1579721882', NULL, 52, 5, CAST(N'2018-07-09 00:13:36.813' AS DateTime), 0, N'https://myanimelist.net/manga/98595/Akiba_Senki')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (186, N'Akibattalion: Sen no Shikabane, Natsu, Owari no#', N'Synonyms: Akibattalion: Thousand of corpses, summer, the end of the #, Japanese: アキバタリアン 千の屍、夏、終わりの#, ', CAST(N'2016-08-12' AS Date), N'Hamazaki, Tatsuya', N'Yuunagi', NULL, N'1142673914', NULL, 28, 5, CAST(N'2018-07-09 00:13:37.093' AS DateTime), 0, N'https://myanimelist.net/manga/99883/Akibattalion__Sen_no_Shikabane_Natsu_Owari_no')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (187, N'Akihabara Dungeon Bouken Kitan', N'English: Adventure Legends in Akihabara Dungeon, Japanese: 秋葉原ダンジョン冒険奇譚, ', CAST(N'2013-12-25' AS Date), N'Kuwashima, Rein', N'Nakano, Kumin', NULL, N'536338640', NULL, 195, 5, CAST(N'2018-07-09 00:13:37.127' AS DateTime), 0, N'https://myanimelist.net/manga/63049/Akihabara_Dungeon_Bouken_Kitan')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (188, N'Akihabara Vampire Night', N'Japanese: アキハバラヴァンパイアナイト, ', CAST(N'2011-08-25' AS Date), N'Anmi', N'Nanai, Renichi', NULL, N'-1480229094', NULL, 70, 5, CAST(N'2018-07-09 00:13:37.557' AS DateTime), 0, N'https://myanimelist.net/manga/62793/Akihabara_Vampire_Night')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (189, N'Akihabara Writer''s Quartet', N'Japanese: アキハバラ・ライターズ・カルテット, ', CAST(N'2014-11-03' AS Date), N'Sagara, Riri', N'Miki, Nazuna', NULL, N'827442817', NULL, 42, 5, CAST(N'2018-07-09 00:13:37.963' AS DateTime), 0, N'https://myanimelist.net/manga/81941/Akihabara_Writers_Quartet')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (190, N'Akihabara∧Denpatou', N'Synonyms: Akihabara Radio Tower, Japanese: アキハバラ∧デンパトウ, ', CAST(N'2015-07-30' AS Date), N'Ranjou, Riku', N'Reia', NULL, N'-1643796600', NULL, 30, 5, CAST(N'2018-07-09 00:13:38.120' AS DateTime), 0, N'https://myanimelist.net/manga/101880/Akihabara∧Denpatou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (191, N'Akikan!', N'Synonyms: Empty Can!, Japanese: アキカン!, ', CAST(N'2007-05-24' AS Date), N'Suzuhira, Hiro', N'Ranjou, Riku', NULL, N'1395563175', NULL, 557, 6, CAST(N'2018-07-09 00:13:38.213' AS DateTime), 0, N'https://myanimelist.net/manga/11913/Akikan')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (192, N'Akitsu Kaede wa Ataranai!', N'Japanese: 秋津楓はアたらない!, ', CAST(N'2010-09-18' AS Date), N'Kimishima, Ao', N'Nishimura, Yuu', NULL, N'1719578089', NULL, 24, 5, CAST(N'2018-07-09 00:13:38.353' AS DateTime), 0, N'https://myanimelist.net/manga/83855/Akitsu_Kaede_wa_Ataranai')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (193, N'Akogare no Anoko ga Totsuzen Sematte Kurunda ga, Doushitara Ii?', N'Japanese: 憧れのあの娘が突然迫ってくるんだが、どうしたらいい？, ', CAST(N'2012-04-20' AS Date), N'Kekocha', N'Amakusa, Shiro', NULL, N'1390259518', NULL, 91, 5, CAST(N'2018-07-09 00:13:38.663' AS DateTime), 0, N'https://myanimelist.net/manga/55939/Akogare_no_Anoko_ga_Totsuzen_Sematte_Kurunda_ga_Doushitara_Ii')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (194, N'Akogare no Ero Ero Kraken-sensei wo Zenshin Zenrei Haramasete Mita!', N'Japanese: 憧れのえろえろクラーケン先生を全身全霊孕ませてみた！, ', CAST(N'2016-02-12' AS Date), N'Gogo 12-ji no Otoko', N'Subeta', NULL, N'930045283', NULL, 30, 5, CAST(N'2018-07-09 00:15:17.057' AS DateTime), 0, N'https://myanimelist.net/manga/96641/Akogare_no_Ero_Ero_Kraken-sensei_wo_Zenshin_Zenrei_Haramasete_Mita')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (195, N'Aku Josou: Shojo wo Motomete Hanazono e', N'Japanese: 悪女装 処女を求めて花園へ, ', CAST(N'2014-05-30' AS Date), N'Kitahara, Minoru', N'Heat-Soft', NULL, N'556857437', NULL, 44, 5, CAST(N'2018-07-09 00:15:17.340' AS DateTime), 0, N'https://myanimelist.net/manga/82681/Aku_Josou__Shojo_wo_Motomete_Hanazono_e')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (196, N'Aku ni Ochitara Bishoujo Mamirede Daishouri!!', N'English: As I am stepped in vice, I am surrounded by beautiful girls, and get a great victory!!, Japanese: 悪に堕ちたら美少女まみれで大勝利! !, ', CAST(N'2012-06-01' AS Date), N'Mutsumi, Masato', N'Okazawa, Rokujuuyon', NULL, N'746344620', NULL, 88, 5, CAST(N'2018-07-09 00:15:17.667' AS DateTime), 0, N'https://myanimelist.net/manga/70789/Aku_ni_Ochitara_Bishoujo_Mamirede_Daishouri')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (197, N'Aku no Himitsu no Kessha Consultant', N'Japanese: 悪の秘密結社コンサルタント, ', CAST(N'2017-11-14' AS Date), N'Mikan.', N'BlackCartel', NULL, N'-504309693', NULL, 43, 5, CAST(N'2018-07-09 00:15:18.183' AS DateTime), 0, N'https://myanimelist.net/manga/110462/Aku_no_Himitsu_no_Kessha_Consultant')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (198, N'Aku no Musume', N'Synonyms: Daughter of Evil, Japanese: 悪ノ娘, ', CAST(N'2010-08-10' AS Date), N'Akuno-P', N'Ichika', NULL, N'1411140066', NULL, 499, 7, CAST(N'2018-07-09 00:15:18.827' AS DateTime), 0, N'https://myanimelist.net/manga/60559/Aku_no_Musume')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (199, N'Aku no Taizai: Akujiki Musume Conchita', N'Synonyms: Evil Food Eater Conchita, Japanese: 悪ノ大罪 悪食娘コンチータ, ', CAST(N'2013-09-21' AS Date), N'Akuno-P', N'Ichika', NULL, N'126767465', NULL, 186, 5, CAST(N'2018-07-09 00:15:18.937' AS DateTime), 0, N'https://myanimelist.net/manga/61875/Aku_no_Taizai__Akujiki_Musume_Conchita')
GO
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (200, N'Aku no Taizai: Nemurase Hime kara no Okurimono', N'Synonyms: Deadly Sins of Evil: Gift from the Princess who Brought Sleep, Japanese: 悪ノ大罪 眠らせ姫からの贈り物, ', CAST(N'2014-08-27' AS Date), N'Akuno-P', N'Ichika', NULL, N'-608043423', NULL, 86, 5, CAST(N'2018-07-09 00:15:19.290' AS DateTime), 0, N'https://myanimelist.net/manga/88565/Aku_no_Taizai__Nemurase_Hime_kara_no_Okurimono')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (201, N'Aku no Taizai: Venomania-kou no Kyouki', N'Synonyms: The Lunacy of Duke Venomania, The Madness of Duke Venomania, Nanatsu no Taizai Series, Japanese: 悪ノ大罪 ヴェノマニア公の狂気, ', CAST(N'2012-12-22' AS Date), N'Kasai, Ayumi', N'Akuno-P', NULL, N'-1886196653', NULL, 311, 7, CAST(N'2018-07-09 00:15:19.607' AS DateTime), 0, N'https://myanimelist.net/manga/61877/Aku_no_Taizai__Venomania-kou_no_Kyouki')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (202, N'Akugyaku Kishidan: Sono Elf, Kyoubou ni Tsuki', N'Synonyms: Knights of Villainy, Japanese: 悪逆騎士団 そのエルフ、凶暴につき, ', CAST(N'2016-12-10' AS Date), N'Minase, Hazuki', N'Momoco', NULL, N'1077331596', NULL, 39, 5, CAST(N'2018-07-09 00:15:19.923' AS DateTime), 0, N'https://myanimelist.net/manga/106903/Akugyaku_Kishidan__Sono_Elf_Kyoubou_ni_Tsuki')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (203, N'Akugyaku Koutei no Black Dress', N'Synonyms: Akugyaku Koutei no Zettai Masou, Japanese: 悪逆皇帝の絶対魔装《ブラックドレス》, ', CAST(N'2014-05-15' AS Date), N'Hazuki, Sou', N'UGUME', NULL, N'658719919', NULL, 64, 5, CAST(N'2018-07-09 00:15:20.050' AS DateTime), 0, N'https://myanimelist.net/manga/72195/Akugyaku_Koutei_no_Black_Dress')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (204, N'Akuma de Akuma!', N'Japanese: あくまで悪魔!, ', CAST(N'2014-08-30' AS Date), N'Wadori, Saiko', N'Miyama, Kiri', NULL, N'689991452', NULL, 56, 5, CAST(N'2018-07-09 00:15:20.393' AS DateTime), 0, N'https://myanimelist.net/manga/87549/Akuma_de_Akuma')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (205, N'Akuma de Fantasy!?', N'Japanese: あくまデふぁんたジー!?, ', CAST(N'2007-05-19' AS Date), N'Kamino, Okina', N'Kajiyama, Hiroshi', NULL, N'-1642205901', NULL, 24, 5, CAST(N'2018-07-09 00:15:20.720' AS DateTime), 0, N'https://myanimelist.net/manga/55813/Akuma_de_Fantasy')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (206, N'Akuma de Knight', N'Synonyms: Akuma de Kishi, Japanese: 悪魔で騎士〈ナイト〉, ', CAST(N'2014-12-15' AS Date), N'Sakano, Keiko', N'Asuka', NULL, N'-1993733613', NULL, 87, 5, CAST(N'2018-07-09 00:15:21.247' AS DateTime), 0, N'https://myanimelist.net/manga/87156/Akuma_de_Knight')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (207, N'Akuma de Shoujo', N'Japanese: AKUMAで少女, ', CAST(N'2007-08-01' AS Date), N'Takashina, Masato', N'Wakatsuki, Hikaru', NULL, N'1211094159', NULL, 103, 5, CAST(N'2018-07-09 00:15:21.597' AS DateTime), 0, N'https://myanimelist.net/manga/31655/Akuma_de_Shoujo')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (208, N'Akuma ga Chigiru Hime to Kishi: Hanayome wo Dakkan Seyo', N'Japanese: 悪魔が契る姫と騎士 花嫁を奪還せよ, ', CAST(N'2013-11-20' AS Date), N'Kumoya, Yukio', N'Asuka', NULL, N'197639188', NULL, 96, 5, CAST(N'2018-07-09 00:15:21.923' AS DateTime), 0, N'https://myanimelist.net/manga/64561/Akuma_ga_Chigiru_Hime_to_Kishi__Hanayome_wo_Dakkan_Seyo')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (209, N'Akuma ga Kitarite AV Satsuei!?', N'Japanese: 悪魔が来たりてＡＶ撮影！？, ', CAST(N'2015-06-18' AS Date), N'Aoi, Nagisa', N'Habara, Tetsu', NULL, N'1883855405', NULL, 49, 5, CAST(N'2018-07-09 00:15:22.247' AS DateTime), 0, N'https://myanimelist.net/manga/89803/Akuma_ga_Kitarite_AV_Satsuei')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (210, N'Akuma Hakushaku no Hanayome: Shiroki Otome to Akai Kajitsu', N'Japanese: 悪魔伯爵の花嫁 白き乙女と赤い果実, ', CAST(N'2014-10-14' AS Date), N'Tsukimori, Aira', N'Ciel', NULL, N'-1869164083', NULL, 41, 5, CAST(N'2018-07-09 00:15:22.557' AS DateTime), 0, N'https://myanimelist.net/manga/89488/Akuma_Hakushaku_no_Hanayome__Shiroki_Otome_to_Akai_Kajitsu')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (211, N'Akuma Maid wa Tsun Tsun Dere Dere!', N'Japanese: 悪魔メイドはツンツンデレデレ!, ', CAST(N'2013-03-21' AS Date), N'Aohashi, Yutaka', N'Arisue, Tsukasa', NULL, N'846086715', NULL, 41, 5, CAST(N'2018-07-09 00:15:22.793' AS DateTime), 0, N'https://myanimelist.net/manga/61567/Akuma_Maid_wa_Tsun_Tsun_Dere_Dere')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (212, N'Akuma na Kanojo, Tenshi na Imouto', N'Japanese: 悪魔な彼女、天使な妹, ', CAST(N'2005-04-20' AS Date), N'Aohashi, Yutaka', N'Misakura, Nankotsu', NULL, N'-602753676', NULL, 48, 5, CAST(N'2018-07-09 00:15:23.027' AS DateTime), 0, N'https://myanimelist.net/manga/61741/Akuma_na_Kanojo_Tenshi_na_Imouto')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (213, N'Akuma na Kisaki no Kiken na Konin', N'Japanese: 悪魔な妃の危険な婚姻, ', CAST(N'2015-10-23' AS Date), N'Yuiga, Satoru', N'Miyano, Mika', NULL, N'788436761', NULL, 20, 5, CAST(N'2018-07-09 00:15:23.387' AS DateTime), 0, N'https://myanimelist.net/manga/93766/Akuma_na_Kisaki_no_Kiken_na_Konin')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (214, N'Akuma na Koibito', N'Japanese: 悪魔な恋人, ', CAST(N'2006-09-26' AS Date), N'Sugahara, Ryuu', N'Morimoto, Aki', NULL, N'465210138', NULL, 20, 5, CAST(N'2018-07-09 00:15:23.607' AS DateTime), 0, N'https://myanimelist.net/manga/87754/Akuma_na_Koibito')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (215, N'Akuma na Ouji nano ni Pocchari-hime ni Meromero desu ka?', N'Japanese: 悪魔な王子なのにぽっちゃり姫にメロメロですか？, ', CAST(N'2016-06-01' AS Date), N'Shiina, Satsuki', N'Iori, Mina', NULL, N'-1242359051', NULL, 13, 5, CAST(N'2018-07-09 00:15:23.823' AS DateTime), 0, N'https://myanimelist.net/manga/101493/Akuma_na_Ouji_nano_ni_Pocchari-hime_ni_Meromero_desu_ka')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (216, N'Akuma no Aihi wa, 〇〇 no Bara', N'Japanese: 悪魔の愛妃は、〇〇の薔薇, ', CAST(N'2016-09-30' AS Date), N'KRN', N'Mamiya, Sou', NULL, N'-1970026817', NULL, 14, 5, CAST(N'2018-07-09 00:15:24.057' AS DateTime), 0, N'https://myanimelist.net/manga/106273/Akuma_no_Aihi_wa_〇〇_no_Bara')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (217, N'Akuma no App de Fukushuu wo: Status Sousa de Zecchou Jigoku', N'Japanese: 悪魔のアプリで復讐を－ステータス操作で絶頂地獄－, ', CAST(N'2016-09-16' AS Date), N'Kita, Minami', N'Ousawa, Kanata', NULL, N'-450800332', NULL, 20, 5, CAST(N'2018-07-09 00:15:24.290' AS DateTime), 0, N'https://myanimelist.net/manga/101315/Akuma_no_App_de_Fukushuu_wo__Status_Sousa_de_Zecchou_Jigoku')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (218, N'Akuma no Camera de Saimin Shihai! Tsun Tsun Doukyuusei mo Shintaisou-bu mo Sensei mo', N'Japanese: 悪魔のカメラで催眠支配！　ツンツン同級生も新体操部も先生も, ', CAST(N'2014-12-18' AS Date), N'Kawazato, Kazunobu', N'Arisue, Tsukasa', NULL, N'1764497043', NULL, 32, 5, CAST(N'2018-07-09 00:15:24.437' AS DateTime), 0, N'https://myanimelist.net/manga/82823/Akuma_no_Camera_de_Saimin_Shihai_Tsun_Tsun_Doukyuusei_mo_Shintaisou-bu_mo_Sensei_mo')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (219, N'Akuma no Kagai Jugyou', N'Japanese: 悪魔の課外授業, ', CAST(N'2002-08-09' AS Date), N'Tomuku, Ranji', N'CSY', NULL, N'-1855638799', NULL, 22, 5, CAST(N'2018-07-09 00:15:24.760' AS DateTime), 0, N'https://myanimelist.net/manga/65233/Akuma_no_Kagai_Jugyou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (220, N'Akuma no Kenshin', N'Japanese: 悪魔の献身, ', CAST(N'2014-04-03' AS Date), N'Ashihara, Moka', N'Saikawa, Tou', NULL, N'-1235668646', NULL, 11, 5, CAST(N'2018-07-09 00:15:25.040' AS DateTime), 0, N'https://myanimelist.net/manga/102113/Akuma_no_Kenshin')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (221, N'Akuma no Pen de Sukihoudai! Target wa Osananajimi, Onna Kyoushi, Seitokaichou, Bijin Rijichou', N'Japanese: 悪魔のペンで好き放題! ターゲットは幼なじみ、女教師、生徒会長、美人理事長, ', CAST(N'2015-01-16' AS Date), N'Hinata, Momo', N'Uehara, Ryou', NULL, N'673544313', NULL, 40, 5, CAST(N'2018-07-09 00:15:25.273' AS DateTime), 0, N'https://myanimelist.net/manga/84243/Akuma_no_Pen_de_Sukihoudai_Target_wa_Osananajimi_Onna_Kyoushi_Seitokaichou_Bijin_Rijichou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (222, N'Akuma no Sonnet', N'Synonyms: Akuma no Soneto, Devil&#039;s Sonnet, Sonnet of the Devil, Japanese: 悪魔のソネット, ', CAST(N'2008-10-01' AS Date), N'Shinjou, Mayu', N'Kurihara, Chihiro', NULL, N'42949685', NULL, 652, 5, CAST(N'2018-07-09 00:15:25.617' AS DateTime), 0, N'https://myanimelist.net/manga/20697/Akuma_no_Sonnet')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (223, N'Akuma no Yokubou: Boku no Oukoku no Eikoseisui', N'Japanese: 悪魔の欲望~僕の王国の栄枯盛衰~, ', CAST(N'2014-05-23' AS Date), N'Ishiba, Yoshikazu', N'Reiha', NULL, N'-1625696132', NULL, 38, 5, CAST(N'2018-07-09 00:15:25.853' AS DateTime), 0, N'https://myanimelist.net/manga/80919/Akuma_no_Yokubou__Boku_no_Oukoku_no_Eikoseisui')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (224, N'Akuma Otome ni Ijiwaru Tenshi', N'Japanese: 悪魔乙女にいじわる天使, ', CAST(N'2013-02-17' AS Date), N'Nagatanien, Sakura', N'Naruse, Yamabuki', NULL, N'1838434154', NULL, 12, 5, CAST(N'2018-07-09 00:15:26.167' AS DateTime), 0, N'https://myanimelist.net/manga/100474/Akuma_Otome_ni_Ijiwaru_Tenshi')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (225, N'Akuma Sylphia to Honoo no Tenshi: Seija no Ingoku Rasen', N'English: Capricious Demon Sylphia, Japanese: 悪魔シルフィアと炎の天使 聖邪の淫獄螺旋, ', CAST(N'2003-12-24' AS Date), N'Koike, Sadaji', N'Itsuki, Yuruha', NULL, N'-2004854811', NULL, 32, 5, CAST(N'2018-07-09 00:15:26.390' AS DateTime), 0, N'https://myanimelist.net/manga/65165/Akuma_Sylphia_to_Honoo_no_Tenshi__Seija_no_Ingoku_Rasen')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (226, N'Akuma wa Sekai no Kyuuseishu', N'English: The satan is the saviour in the world., Japanese: 悪魔は世界の救世主, ', CAST(N'2008-05-19' AS Date), N'Amajio, Komeko', N'Kamiya, You', NULL, N'-1617609', NULL, 26, 5, CAST(N'2018-07-09 00:15:26.717' AS DateTime), 0, N'https://myanimelist.net/manga/93634/Akuma_wa_Sekai_no_Kyuuseishu')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (227, N'Akuma wo Munyumunyu Suru Riyuu', N'Japanese: 悪魔をむにゅむにゅする理由, ', CAST(N'2011-01-01' AS Date), N'Kurokawa, Izumi', N'Kagami, Hiroyuki', NULL, N'-648432916', NULL, 54, 5, CAST(N'2018-07-09 00:15:27.140' AS DateTime), 0, N'https://myanimelist.net/manga/92067/Akuma_wo_Munyumunyu_Suru_Riyuu')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (228, N'Akuma-hime to Kuroyami-hime', N'Synonyms: Kuroyamihime and Devil Princess, Japanese: 悪魔姫と黒やみ姫, ', CAST(N'2009-06-15' AS Date), N'Hidou, Ren', N'Shimizu, Mariko', NULL, N'1237649814', NULL, 38, 5, CAST(N'2018-07-09 00:15:27.747' AS DateTime), 0, N'https://myanimelist.net/manga/77969/Akuma-hime_to_Kuroyami-hime')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (229, N'Akumade Maou no Table d''Hote: Gyouretsu no Dekiru Maou Shokudou', N'Synonyms: Akumade Maou no Kyuukyoku Saifu, Japanese: あくまで魔王の究極菜譜〈ターブル・ドット〉 ～行列のできる魔王食堂～, ', CAST(N'2016-07-09' AS Date), N'Taube, Sadato', N'zpolice', NULL, N'330337488', NULL, 19, 5, CAST(N'2018-07-09 00:15:28.043' AS DateTime), 0, N'https://myanimelist.net/manga/99653/Akumade_Maou_no_Table_dHote__Gyouretsu_no_Dekiru_Maou_Shokudou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (230, N'Akumademo, Imouto ga Hoshiin desu.', N'Japanese: あくまでも、妹が欲しいんです。, ', CAST(N'2012-04-20' AS Date), N'Inugahora, An', N'Minase, Sango', NULL, N'1454015017', NULL, 36, 5, CAST(N'2018-07-09 00:15:28.290' AS DateTime), 0, N'https://myanimelist.net/manga/74405/Akumademo_Imouto_ga_Hoshiin_desu')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (231, N'Akumu: Aoi Kaijitsu no Sanka', N'Japanese: 悪夢―青い果実の散花, ', CAST(N'1996-07-10' AS Date), N'Maezono, Haruka', N'Studio Mebius', NULL, N'-1433612881', NULL, 21, 5, CAST(N'2018-07-09 00:15:28.623' AS DateTime), 0, N'https://myanimelist.net/manga/71237/Akumu__Aoi_Kaijitsu_no_Sanka')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (232, N'Akumu: Dai-2 Shou', N'Japanese: 悪夢 第二章, ', CAST(N'1997-06-10' AS Date), N'Maezono, Haruka', N'Studio Mebius', NULL, N'1274323182', NULL, 15, 5, CAST(N'2018-07-09 00:15:28.747' AS DateTime), 0, N'https://myanimelist.net/manga/97189/Akumu__Dai-2_Shou')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (233, N'Akuochi-hime wa Jikka Botsuraku wo Nerau', N'Japanese: 悪堕ち姫は実家没落をねらう, ', CAST(N'2015-07-23' AS Date), N'Kitazawa, Kyou', N'Sakurasakurasakura', NULL, N'-84839325', NULL, 33, 5, CAST(N'2018-07-09 00:15:28.873' AS DateTime), 0, N'https://myanimelist.net/manga/91567/Akuochi-hime_wa_Jikka_Botsuraku_wo_Nerau')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (234, N'Akuryou Series', N'Synonyms: Ghost Hunt, Akurei, Japanese: 悪霊シリーズ, ', NULL, N'Ono, Fuyumi', N'', NULL, N'27446116', NULL, 741, 8, CAST(N'2018-07-09 00:15:29.090' AS DateTime), 0, N'https://myanimelist.net/manga/14269/Akuryou_Series')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (235, N'Akuyaku Reijou Koukyuu Monogatari', N'Japanese: 悪役令嬢後宮物語, ', CAST(N'2013-08-12' AS Date), N'Suzunosuke', N'Ryoufuu', NULL, N'1212451532', NULL, 31, 5, CAST(N'2018-07-09 00:15:29.307' AS DateTime), 0, N'https://myanimelist.net/manga/94203/Akuyaku_Reijou_Koukyuu_Monogatari')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (236, N'Akuyaku, Hajimemashita', N'Japanese: 悪役、はじめました, ', CAST(N'2015-02-25' AS Date), N'Hatori, Piyoko', N'Tigira, Kouyou', NULL, N'-1343297711', NULL, 31, 5, CAST(N'2018-07-09 00:15:29.540' AS DateTime), 0, N'https://myanimelist.net/manga/86351/Akuyaku_Hajimemashita')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (237, N'Albert-ke no Reijou wa Botsuraku wo Goshomou desu', N'Synonyms: The Daughter of the Albert House Wishes for Ruin, Japanese: アルバート家の令嬢は没落をご所望です, ', CAST(N'2014-07-30' AS Date), N'Futaba, Haduki', N'Saki', NULL, N'-491019564', NULL, 41, 5, CAST(N'2018-07-09 00:15:29.680' AS DateTime), 0, N'https://myanimelist.net/manga/105466/Albert-ke_no_Reijou_wa_Botsuraku_wo_Goshomou_desu')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (238, N'Alchemist no Nirvana', N'Synonyms: Alchemist no Shuuen Souzou Jutsu, Japanese: アルケミストの終焉創造術《ニルヴァーナ》, ', CAST(N'2014-04-15' AS Date), N'Morita, Kisetsu', N'Haruka, Natsuki', NULL, N'-535675198', NULL, 165, 5, CAST(N'2018-07-09 00:15:30.087' AS DateTime), 0, N'https://myanimelist.net/manga/70787/Alchemist_no_Nirvana')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (239, N'Alice de Hajimaru Oratorio', N'Synonyms: Alice de Hajimaru Seitankyoku, Japanese: アリアではじまる聖譚曲〈オラトリオ〉, ', CAST(N'2009-10-31' AS Date), N'Shouoto, Aya', N'Nishimoto, Hirona', NULL, N'-1309866481', NULL, 116, 5, CAST(N'2018-07-09 00:15:30.897' AS DateTime), 0, N'https://myanimelist.net/manga/79999/Alice_de_Hajimaru_Oratorio')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (240, N'Alice in Gothicland', N'Japanese: アリス・イン・ゴシックランド, ', CAST(N'2011-05-01' AS Date), N'Ueda, Ryo', N'Nanbou, Hidehisa', NULL, N'1397615078', NULL, 93, 5, CAST(N'2018-07-09 00:15:31.240' AS DateTime), 0, N'https://myanimelist.net/manga/55825/Alice_in_Gothicland')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (241, N'Alice mare', N'Synonyms: Alicemare, Japanese: アリスメア, ', CAST(N'2015-01-27' AS Date), N'Miwasiba', N'', NULL, N'1817422023', NULL, 20, 5, CAST(N'2018-07-09 00:15:31.587' AS DateTime), 0, N'https://myanimelist.net/manga/113344/Alice_mare')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (242, N'Alice-san to Masayoshi-kun wa Mukankei desu ka?', N'Synonyms: Are Alice and Masayoshi Indifferent?, Japanese: ありすさんと正義くんは無関係ですか?, ', CAST(N'2011-06-01' AS Date), N'Wakatsuki, Hikaru', N'', NULL, N'140436976', NULL, 98, 5, CAST(N'2018-07-09 00:15:31.697' AS DateTime), 0, N'https://myanimelist.net/manga/47947/Alice-san_to_Masayoshi-kun_wa_Mukankei_desu_ka')
INSERT [dbo].[Project] ([project_id], [project_name], [project_alter_name], [project_publish_date], [project_author], [project_illustrator], [project_synopsis], [project_hash], [project_tag], [project_view], [project_point], [project_last_update], [project_total_update], [project_link]) VALUES (243, N'Alicia Ingoku no Himekishi', N'English: Princess Knight Alicia, Japanese: アリシア 淫獄の姫騎士, ', CAST(N'2012-09-18' AS Date), N'Kirishima, Satoshi', N'Ishiba, Yoshikazu', NULL, N'-2094924554', NULL, 26, 5, CAST(N'2018-07-09 00:15:31.947' AS DateTime), 0, N'https://myanimelist.net/manga/60941/Alicia_Ingoku_no_Himekishi')
SET IDENTITY_INSERT [dbo].[Project] OFF
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD  CONSTRAINT [FK_Bookmark_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Bookmark] CHECK CONSTRAINT [FK_Bookmark_Account]
GO
ALTER TABLE [dbo].[Bookmark]  WITH CHECK ADD  CONSTRAINT [FK_Bookmark_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
ALTER TABLE [dbo].[Bookmark] CHECK CONSTRAINT [FK_Bookmark_Project]
GO
ALTER TABLE [dbo].[GenreMap]  WITH CHECK ADD  CONSTRAINT [FK_GenreMap_Genre] FOREIGN KEY([genre_id])
REFERENCES [dbo].[Genre] ([genre_id])
GO
ALTER TABLE [dbo].[GenreMap] CHECK CONSTRAINT [FK_GenreMap_Genre]
GO
ALTER TABLE [dbo].[GenreMap]  WITH CHECK ADD  CONSTRAINT [FK_GenreMap_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
ALTER TABLE [dbo].[GenreMap] CHECK CONSTRAINT [FK_GenreMap_Project]
GO
ALTER TABLE [dbo].[UpdateChap]  WITH CHECK ADD  CONSTRAINT [FK_UpdateChap_TransGroup] FOREIGN KEY([update_group])
REFERENCES [dbo].[TransGroup] ([group_id])
GO
ALTER TABLE [dbo].[UpdateChap] CHECK CONSTRAINT [FK_UpdateChap_TransGroup]
GO
ALTER TABLE [dbo].[UpdateChap]  WITH CHECK ADD  CONSTRAINT [FK_UpdateChap_UpdateVol1] FOREIGN KEY([update_vol])
REFERENCES [dbo].[UpdateVol] ([id])
GO
ALTER TABLE [dbo].[UpdateChap] CHECK CONSTRAINT [FK_UpdateChap_UpdateVol1]
GO
ALTER TABLE [dbo].[UpdateVol]  WITH CHECK ADD  CONSTRAINT [FK_UpdateVol_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
GO
ALTER TABLE [dbo].[UpdateVol] CHECK CONSTRAINT [FK_UpdateVol_Project]
GO
/****** Object:  StoredProcedure [dbo].[UpdateChap_GET_UPDATE]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateChap_GET_UPDATE]
	@PageNumber INT = 1,
	@PageSize INT = 100,
	@ProjectID INT,
	@Total INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT @Total = COUNT(UpdateChap.update_id)
	FROM UpdateChap INNER JOIN UpdateVol ON UpdateChap.update_vol = UpdateVol.id
	WHERE project_id = @ProjectID
	GROUP BY UpdateVol.project_id;
	SELECT *
	FROM UpdateChap
	WHERE UpdateChap.update_vol IN (
		SELECT id FROM UpdateVol WHERE project_id = @ProjectID
	)
	ORDER BY update_date DESC
	OFFSET @PageSize * (@PageNumber - 1) ROWS
	FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateChap_LATEST_UPDATE_CHAPTER]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateChap_LATEST_UPDATE_CHAPTER]
	@PageNumber INT = 1,
	@PageSize INT = 100
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM UpdateChap
	ORDER BY update_date DESC
	OFFSET @PageSize * (@PageNumber - 1) + 1 ROWS
	FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE)
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateChap_SEARCH_PROJECT]    Script Date: 07/09/2018 12:18:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateChap_SEARCH_PROJECT]
	@PageNumber INT = 1,
	@PageSize INT = 100,
	@Keyword NVARCHAR(MAX),
	@Total INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT @Total = COUNT(Project.project_id)
	FROM Project
	WHERE Project.project_name LIKE '%'+ @Keyword +'%';
	SELECT *
	FROM Project
	WHERE Project.project_name LIKE '%'+ @Keyword +'%'
	ORDER BY Project.project_view DESC
	OFFSET @PageSize * (@PageNumber - 1) ROWS
	FETCH NEXT @PageSize ROWS ONLY OPTION (RECOMPILE)
END

GO
USE [master]
GO
ALTER DATABASE [NU_DB] SET  READ_WRITE 
GO
