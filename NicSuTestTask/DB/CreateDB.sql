USE [master]
GO
/****** Object:  Database [NicsuTestTaskDB]    Script Date: 08.09.2024 11:44:23 ******/
CREATE DATABASE [NicsuTestTaskDB]
GO
ALTER DATABASE [NicsuTestTaskDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NicsuTestTaskDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NicsuTestTaskDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NicsuTestTaskDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NicsuTestTaskDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NicsuTestTaskDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NicsuTestTaskDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NicsuTestTaskDB] SET  MULTI_USER 
GO
ALTER DATABASE [NicsuTestTaskDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NicsuTestTaskDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NicsuTestTaskDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NicsuTestTaskDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NicsuTestTaskDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NicsuTestTaskDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NicsuTestTaskDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [NicsuTestTaskDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NicsuTestTaskDB]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 08.09.2024 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](128) NOT NULL,
	[RoomId] [int] NULL,
	[SpecialtyId] [int] NULL,
	[PrecinctId] [int] NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 08.09.2024 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](64) NULL,
	[LastName] [nvarchar](64) NULL,
	[Patronymic] [nvarchar](64) NULL,
	[Address] [nvarchar](256) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [nvarchar](8) NULL,
	[PrecinctId] [int] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precincts]    Script Date: 08.09.2024 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precincts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_Precincts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 08.09.2024 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialties]    Script Date: 08.09.2024 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NULL,
 CONSTRAINT [PK_Specialties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Precincts] FOREIGN KEY([PrecinctId])
REFERENCES [dbo].[Precincts] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Precincts]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Rooms] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Rooms] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Rooms]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Specialties] FOREIGN KEY([SpecialtyId])
REFERENCES [dbo].[Specialties] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Specialties]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Precincts] FOREIGN KEY([PrecinctId])
REFERENCES [dbo].[Precincts] ([Id])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Precincts]
GO
/****** Object:  StoredProcedure [dbo].[GetDoctorsOverview]    Script Date: 08.09.2024 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDoctorsOverview]
	@pageSize INT = 10,
	@pageNumber INT = 1,
	@orderBy NVARCHAR(32) = 'Id',
	@desc BIT = false
AS
BEGIN
	SET NOCOUNT ON;

	IF @desc = 0
		SELECT d.Id, d.FullName, s.Name as SpecialtyName, p.Number as PrecinctNumber, r.Number as RoomNumber
		FROM Doctors as d
		LEFT JOIN Specialties as s ON d.SpecialtyId = s.Id
		LEFT JOIN Precincts as p ON d.PrecinctId = p.Id
		LEFT JOIN Rooms as r ON d.RoomId = r.Id
		ORDER BY
			CASE LOWER(@orderby)
				WHEN 'fullname' THEN d.FullName
				WHEN 'specialtyname' THEN s.Name
				WHEN 'precinctnumber' THEN p.Number
				WHEN 'roomnumber' THEN r.Number
				ELSE d.Id
				END
		OFFSET (@pageNumber - 1) * @pageSize ROWS
		FETCH NEXT @pageSize ROWS ONLY
	ELSE
		SELECT d.FullName, s.Name as SpecialtyName, p.Number as PrecinctNumber, r.Number as RoomNumber
		FROM Doctors as d
		LEFT JOIN Specialties as s ON d.SpecialtyId = s.Id
		LEFT JOIN Precincts as p ON d.PrecinctId = p.Id
		LEFT JOIN Rooms as r ON d.RoomId = r.Id
		ORDER BY
			CASE LOWER(@orderby)
				WHEN 'fullname' THEN d.FullName
				WHEN 'specialtyname' THEN s.Name
				WHEN 'precinctnumber' THEN p.Number
				WHEN 'roomnumber' THEN r.Number
				ELSE d.Id
				END
		DESC
		OFFSET (@pageNumber - 1) * @pageSize ROWS
		FETCH NEXT @pageSize ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientsOverview]    Script Date: 08.09.2024 11:44:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPatientsOverview]
	@pageSize INT = 10,
	@pageNumber INT = 1,
	@orderBy NVARCHAR(32) = 'Id',
	@desc BIT = false
AS
BEGIN
	SET NOCOUNT ON;

	IF @desc = 0
		SELECT pat.Id, pat.LastName, pat.FirstName, pat.Patronymic, pat.Address, pat.DateOfBirth, pat.Gender, pr.Number AS PrecinctNumber
		FROM Patients as pat
		LEFT JOIN Precincts as pr ON pat.PrecinctId = pr.Id
		ORDER BY
			CASE LOWER(@orderby)
				WHEN 'lastname' THEN pat.LastName
				WHEN 'firstname' THEN pat.FirstName
				WHEN 'patronymic' THEN pat.Patronymic
				WHEN 'address' THEN pat.Address
				WHEN 'dateofbirth' THEN CAST(pat.DateOfBirth AS nvarchar(16))
				WHEN 'gender' THEN pat.Gender
				WHEN 'precinctnumber' THEN pr.Number
				ELSE pat.Id
				END
		OFFSET (@pageNumber - 1) * @pageSize ROWS
		FETCH NEXT @pageSize ROWS ONLY
	ELSE
		SELECT pat.Id, pat.LastName, pat.FirstName, pat.Patronymic, pat.Address, pat.DateOfBirth, pat.Gender, pr.Number AS PrecinctNumber
		FROM Patients as pat
		LEFT JOIN Precincts as pr ON pat.PrecinctId = pr.Id
		ORDER BY
			CASE LOWER(@orderby)
				WHEN 'lastname' THEN pat.LastName
				WHEN 'firstname' THEN pat.FirstName
				WHEN 'patronymic' THEN pat.Patronymic
				WHEN 'address' THEN pat.Address
				WHEN 'dateofbirth' THEN CAST(pat.DateOfBirth AS nvarchar(16))
				WHEN 'gender' THEN pat.Gender
				WHEN 'precinctnumber' THEN pr.Number
				ELSE pat.Id
				END
		DESC
		OFFSET (@pageNumber - 1) * @pageSize ROWS
		FETCH NEXT @pageSize ROWS ONLY
END
GO
USE [master]
GO
ALTER DATABASE [NicsuTestTaskDB] SET  READ_WRITE 
GO
