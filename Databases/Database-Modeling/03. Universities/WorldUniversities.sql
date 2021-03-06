USE [master]
GO
/****** Object:  Database [WorldUniversities]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
CREATE DATABASE [WorldUniversities]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorldUniversities', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WorldUniversities.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorldUniversities_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WorldUniversities_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WorldUniversities] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldUniversities].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldUniversities] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldUniversities] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldUniversities] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldUniversities] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldUniversities] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldUniversities] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldUniversities] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WorldUniversities] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldUniversities] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldUniversities] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldUniversities] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldUniversities] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldUniversities] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldUniversities] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldUniversities] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldUniversities] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldUniversities] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldUniversities] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldUniversities] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldUniversities] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldUniversities] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldUniversities] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldUniversities] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldUniversities] SET RECOVERY FULL 
GO
ALTER DATABASE [WorldUniversities] SET  MULTI_USER 
GO
ALTER DATABASE [WorldUniversities] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldUniversities] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldUniversities] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldUniversities] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WorldUniversities', N'ON'
GO
USE [WorldUniversities]
GO
/****** Object:  User [testuser]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
CREATE USER [testuser] FOR LOGIN [testuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [testuser]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ProfessorId] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[FacultyId] [int] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors_Titles]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors_Titles](
	[ProfessorId] [int] NOT NULL,
	[TitleId] [int] NOT NULL,
 CONSTRAINT [PK_Professors_Titles] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC,
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FacultyNumber] [int] NOT NULL,
	[FacultyID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students_Courses]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Courses](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Students_Courses] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titles]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Universities]    Script Date: 11.07.2013 г. 00:33:38 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([id], [Name], [DepartmentId], [ProfessorId]) VALUES (1, N'HTML BASICS', 1, 1)
INSERT [dbo].[Courses] ([id], [Name], [DepartmentId], [ProfessorId]) VALUES (2, N'Math Basics', 2, 2)
INSERT [dbo].[Courses] ([id], [Name], [DepartmentId], [ProfessorId]) VALUES (3, N'CSS BASCICS', 1, 2)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([id], [Name], [FacultyId]) VALUES (1, N'IT', 1)
INSERT [dbo].[Departments] ([id], [Name], [FacultyId]) VALUES (2, N'Math', 2)
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([id], [Name]) VALUES (1, N'FMI')
INSERT [dbo].[Faculties] ([id], [Name]) VALUES (2, N'FEA')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
SET IDENTITY_INSERT [dbo].[Professors] ON 

INSERT [dbo].[Professors] ([id], [FirstName], [LastName], [DepartmentId]) VALUES (1, N'Pesho', N'Peshov', 1)
INSERT [dbo].[Professors] ([id], [FirstName], [LastName], [DepartmentId]) VALUES (2, N'Ivan', N'Ivanov', 2)
INSERT [dbo].[Professors] ([id], [FirstName], [LastName], [DepartmentId]) VALUES (4, N'Stoyan', N'Stoyanov', 2)
SET IDENTITY_INSERT [dbo].[Professors] OFF
INSERT [dbo].[Professors_Titles] ([ProfessorId], [TitleId]) VALUES (1, 1)
INSERT [dbo].[Professors_Titles] ([ProfessorId], [TitleId]) VALUES (1, 2)
INSERT [dbo].[Professors_Titles] ([ProfessorId], [TitleId]) VALUES (2, 1)
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([id], [FirstName], [LastName], [FacultyNumber], [FacultyID]) VALUES (1, N'Pesho', N'Peshov', 1234, 1)
INSERT [dbo].[Students] ([id], [FirstName], [LastName], [FacultyNumber], [FacultyID]) VALUES (2, N'Vanko1', N'Trepacha', 1233, 2)
INSERT [dbo].[Students] ([id], [FirstName], [LastName], [FacultyNumber], [FacultyID]) VALUES (4, N'Misho', N'Shamara', 666, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
INSERT [dbo].[Students_Courses] ([StudentId], [CourseId]) VALUES (1, 1)
INSERT [dbo].[Students_Courses] ([StudentId], [CourseId]) VALUES (2, 1)
INSERT [dbo].[Students_Courses] ([StudentId], [CourseId]) VALUES (2, 2)
INSERT [dbo].[Students_Courses] ([StudentId], [CourseId]) VALUES (2, 3)
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([id], [Title]) VALUES (1, N'Ph. D')
INSERT [dbo].[Titles] ([id], [Title]) VALUES (2, N'Academician')
INSERT [dbo].[Titles] ([id], [Title]) VALUES (3, N'Senior Assistant')
SET IDENTITY_INSERT [dbo].[Titles] OFF
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Professors]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([id])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Departments]
GO
ALTER TABLE [dbo].[Professors_Titles]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Titles_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([id])
GO
ALTER TABLE [dbo].[Professors_Titles] CHECK CONSTRAINT [FK_Professors_Titles_Professors]
GO
ALTER TABLE [dbo].[Professors_Titles]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Titles_Titles] FOREIGN KEY([TitleId])
REFERENCES [dbo].[Titles] ([id])
GO
ALTER TABLE [dbo].[Professors_Titles] CHECK CONSTRAINT [FK_Professors_Titles_Titles]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculties] FOREIGN KEY([FacultyID])
REFERENCES [dbo].[Faculties] ([id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculties]
GO
ALTER TABLE [dbo].[Students_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Students_Courses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[Students_Courses] CHECK CONSTRAINT [FK_Students_Courses_Courses]
GO
ALTER TABLE [dbo].[Students_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Students_Courses_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[Students_Courses] CHECK CONSTRAINT [FK_Students_Courses_Students]
GO
USE [master]
GO
ALTER DATABASE [WorldUniversities] SET  READ_WRITE 
GO
