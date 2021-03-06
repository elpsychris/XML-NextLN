USE [master]
GO
/****** Object:  Database [NU_DB]    Script Date: 07/09/2018 7:35:17 AM ******/
CREATE DATABASE [NU_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NU_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NGUYENNTT\MSSQL\DATA\NU_DB.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[Account]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  Table [dbo].[Bookmark]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  Table [dbo].[Genre]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  Table [dbo].[GenreMap]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  Table [dbo].[TransGroup]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  Table [dbo].[UpdateChap]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  Table [dbo].[UpdateVol]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateChap_GET_UPDATE]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateChap_LATEST_UPDATE_CHAPTER]    Script Date: 07/09/2018 7:35:18 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateChap_SEARCH_PROJECT]    Script Date: 07/09/2018 7:35:18 AM ******/
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
