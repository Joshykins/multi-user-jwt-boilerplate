USE [master]
GO
/****** Object:  Database [mul]    Script Date: 2/1/2020 12:12:31 PM ******/
DROP DATABASE IF EXISTS [mul]
CREATE DATABASE [mul]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mul', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\mul.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mul_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\mul_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [mul] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [mul].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [mul] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mul] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mul] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mul] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mul] SET ARITHABORT OFF 
GO
ALTER DATABASE [mul] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mul] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mul] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mul] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mul] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mul] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mul] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mul] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mul] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mul] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mul] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mul] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mul] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [mul] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [mul] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mul] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mul] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [mul] SET RECOVERY FULL 
GO
ALTER DATABASE [mul] SET  MULTI_USER 
GO
ALTER DATABASE [mul] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mul] SET DB_CHAINING OFF 
GO
ALTER DATABASE [mul] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [mul] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mul] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'mul', N'ON'
GO
ALTER DATABASE [mul] SET QUERY_STORE = OFF
GO
USE [mul]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 2/1/2020 12:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_name] [varchar](max) NULL,
	[date_created] [datetime] NULL,
  [email] [varchar](max) NOT NULL,
	[owner_id] [int] NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/1/2020 12:12:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[password] [text] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[accounts]  WITH CHECK ADD  CONSTRAINT [FK_accounts_users] FOREIGN KEY([owner_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[accounts] CHECK CONSTRAINT [FK_accounts_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_accounts] FOREIGN KEY([account_id])
REFERENCES [dbo].[accounts] ([id]) ON UPDATE NO ACTION ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_accounts]
GO
USE [master]
GO
ALTER DATABASE [mul] SET  READ_WRITE 
GO