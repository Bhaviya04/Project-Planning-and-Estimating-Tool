USE [master]
GO
/****** Object:  Database [CPSC547]    Script Date: 5/18/2017 6:12:36 PM ******/
CREATE DATABASE [CPSC547]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CPSC547', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CPSC547.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CPSC547_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CPSC547_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CPSC547] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CPSC547].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CPSC547] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CPSC547] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CPSC547] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CPSC547] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CPSC547] SET ARITHABORT OFF 
GO
ALTER DATABASE [CPSC547] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CPSC547] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CPSC547] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CPSC547] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CPSC547] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CPSC547] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CPSC547] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CPSC547] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CPSC547] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CPSC547] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CPSC547] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CPSC547] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CPSC547] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CPSC547] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CPSC547] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CPSC547] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CPSC547] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CPSC547] SET RECOVERY FULL 
GO
ALTER DATABASE [CPSC547] SET  MULTI_USER 
GO
ALTER DATABASE [CPSC547] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CPSC547] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CPSC547] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CPSC547] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CPSC547] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CPSC547', N'ON'
GO
ALTER DATABASE [CPSC547] SET QUERY_STORE = OFF
GO
USE [CPSC547]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CPSC547]
GO
/****** Object:  Table [dbo].[cost]    Script Date: 5/18/2017 6:12:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cost](
	[cost_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[cost] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[duration]    Script Date: 5/18/2017 6:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[duration](
	[phase_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[days] [bigint] NOT NULL,
	[maxdays] [bigint] NULL,
	[mindays] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[module]    Script Date: 5/18/2017 6:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[module](
	[module_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[phase_id] [bigint] NOT NULL,
	[name] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[module_role_mapping]    Script Date: 5/18/2017 6:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[module_role_mapping](
	[mapping_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[module_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[days] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[project]    Script Date: 5/18/2017 6:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project](
	[project_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_name] [varchar](max) NOT NULL,
	[project_description] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role]    Script Date: 5/18/2017 6:12:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[email] [varchar](max) NOT NULL,
	[role] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[cost] ON 

INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (1, 1, N'Visual Studio 2015 Community', 2000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (2, 1, N'Microsoft SQL Server 2016', 8000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (3, 1, N'Slack', 1000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10002, 2, N'Direct Costs', 2000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10003, 2, N'Indirect Costs', 4000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10004, 2, N'Fixed Costs', 10000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10005, 2, N'Variable Costs', 1000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10006, 2, N'Sunk Costs', 4000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10007, 3, N'Direct Costs', 2000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10008, 3, N'Sunk Costs', 1000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10009, 3, N'Indirect Costs', 4000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10010, 3, N'Variable Costs', 1000)
INSERT [dbo].[cost] ([cost_id], [project_id], [name], [cost]) VALUES (10011, 3, N'Fixed Costs', 8000)
SET IDENTITY_INSERT [dbo].[cost] OFF
SET IDENTITY_INSERT [dbo].[duration] ON 

INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (1, 1, N'Requirements', 16, 21, 10)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (2, 1, N'Coding', 45, 50, 40)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (3, 1, N'Design', 19, 20, 18)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (4, 1, N'Feasibility', 7, 9, 5)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (5, 1, N'Deployment', 2, 2, 1)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (6, 1, N'Maintenance', 3, 4, 1)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (7, 1, N'Analysis', 10, 10, 9)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (8, 2, N'Requirements', 12, 20, 4)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (9, 2, N'Feasibility', 5, 8, 2)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (10, 2, N'Analysis', 11, 20, 1)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (11, 2, N'Design', 35, 50, 20)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (12, 2, N'Coding', 65, 80, 50)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (13, 2, N'Testing', 19, 20, 18)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (14, 2, N'Deployment', 3, 4, 1)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (15, 2, N'Maintenance', 80, 90, 70)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (16, 3, N'Requirements', 80, 80, 79)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (17, 3, N'Design', 17, 20, 14)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (18, 3, N'Coding', 55, 70, 40)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (19, 3, N'Testing', 16, 20, 12)
INSERT [dbo].[duration] ([phase_id], [project_id], [name], [days], [maxdays], [mindays]) VALUES (20, 3, N'Deployment', 6, 8, 4)
SET IDENTITY_INSERT [dbo].[duration] OFF
SET IDENTITY_INSERT [dbo].[module] ON 

INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (1, 1, 2, N'Login Page')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (2, 1, 2, N'Registration Page')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (3, 1, 2, N'Edit Profile')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (4, 1, 1, N'Gathering Requirements')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10004, 2, 3, N'Register')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10005, 2, 3, N'Login')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10006, 2, 2, N'SQL Integration')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10007, 2, 13, N'White Box')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10008, 2, 2, N'HTML Integration')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10009, 3, 17, N'Registration')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10010, 3, 17, N'Login')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10011, 3, 18, N'SQL Integration')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10012, 3, 19, N'White Box')
INSERT [dbo].[module] ([module_id], [project_id], [phase_id], [name]) VALUES (10013, 3, 18, N'HTML Integration')
SET IDENTITY_INSERT [dbo].[module] OFF
SET IDENTITY_INSERT [dbo].[module_role_mapping] ON 

INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (1, 1, 2, 2, N'Registration Page should be responsive and should be looking much attractive and it should look much better.', 14)
INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (2, 1, 1, 1, N'Login Page should be responsive and should be looking much attractive and it should look much better.	', 12)
INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (3, 1, 3, 4, N'Profile should have a proper and accurate design.', 14)
INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (10003, 2, 10006, 10004, N'SQL Integration of all the pages', 4)
INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (10004, 2, 10008, 10005, N'HTML Integration with the code', 18)
INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (10005, 3, 10009, 10006, N'Registration Page should be more attractive and responsive.', 2)
INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (10006, 3, 10010, 10006, N'Login page should be more attractive blah blah blah...', 14)
INSERT [dbo].[module_role_mapping] ([mapping_id], [project_id], [module_id], [role_id], [description], [days]) VALUES (10007, 3, 10013, 10008, N'HTML Integration should be more attractive and responsive.', 20)
SET IDENTITY_INSERT [dbo].[module_role_mapping] OFF
SET IDENTITY_INSERT [dbo].[project] ON 

INSERT [dbo].[project] ([project_id], [project_name], [project_description]) VALUES (1, N'abc website', N'E-Commerce Website provides buying and selling of products with an ease of use. It is generally a new concept where a seller will post the product and a buyer will buy the product.')
INSERT [dbo].[project] ([project_id], [project_name], [project_description]) VALUES (2, N'xyz website', N'Food Chain website provides buying and selling of food with an ease of use. It is generally a new concept where a seller will post the food and a buyer will buy the food.')
INSERT [dbo].[project] ([project_id], [project_name], [project_description]) VALUES (3, N'E-Commerce Website', N'E-Commerce Website should allow buying and selling of all the products.')
SET IDENTITY_INSERT [dbo].[project] OFF
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (1, 1, N'Bhaviya Gandani', N'bhaviya04@csu.fullerton.edu', N'Software Engineer')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (2, 1, N'Nirmit Patangia', N'akashthehero@gmail.com', N'Data Analyst')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (3, 1, N'Akash Raju', N'zakashx@gmail.com', N'Database Administrator')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (4, 1, N'Chirag Padsala', N'c.padsala@gmail.com', N'Software Designer')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (10004, 2, N'Ankur Gandhi', N'ankur.gandhi3@gmail.com', N'Database Administrator')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (10005, 2, N'Tushar Kamble', N'tushark26@csu.fullerton.edu', N'Security Engineer')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (10006, 3, N'Akash Raju', N'bhaviya04@csu.fullerton.edu', N'Project Manager')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (10007, 3, N'Ankur Gandhi', N'ankur.gandhi3@gmail.com', N'Software Engineer')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (10008, 3, N'Bhaviya Gandani', N'bhaviyagandani@gmail.com', N'CEO')
INSERT [dbo].[role] ([role_id], [project_id], [name], [email], [role]) VALUES (10009, 3, N'Shahrukh Khan', N'akshayshahhabit@gmail.com', N'Database Administrator')
SET IDENTITY_INSERT [dbo].[role] OFF
USE [master]
GO
ALTER DATABASE [CPSC547] SET  READ_WRITE 
GO
