USE [master]
GO
/****** Object:  Database [hospital management]    Script Date: 14/06/2020 04:20:18 ص ******/
CREATE DATABASE [hospital management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hospital management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\hospital management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hospital management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\hospital management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [hospital management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hospital management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hospital management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hospital management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hospital management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hospital management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hospital management] SET ARITHABORT OFF 
GO
ALTER DATABASE [hospital management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hospital management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hospital management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hospital management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hospital management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hospital management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hospital management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hospital management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hospital management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hospital management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hospital management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hospital management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hospital management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hospital management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hospital management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hospital management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hospital management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hospital management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hospital management] SET  MULTI_USER 
GO
ALTER DATABASE [hospital management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hospital management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hospital management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hospital management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hospital management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hospital management] SET QUERY_STORE = OFF
GO
USE [hospital management]
GO
/****** Object:  Table [dbo].[tbDoctor]    Script Date: 14/06/2020 04:20:18 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDoctor](
	[Doctor_id] [int] IDENTITY(2,2) NOT NULL,
	[Doctor_name] [varchar](100) NOT NULL,
	[Doctor_address] [varchar](100) NOT NULL,
	[Doctor_salary] [decimal](18, 0) NOT NULL,
	[Doctor_age] [int] NOT NULL,
	[Doctor_gender] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbDoctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNurse]    Script Date: 14/06/2020 04:20:18 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNurse](
	[Nurse_id] [varchar](50) NOT NULL,
	[Nurse_name] [varchar](50) NOT NULL,
	[Nurse_address] [varchar](50) NOT NULL,
	[Nurse_salary] [decimal](18, 0) NOT NULL,
	[Nurse_age] [int] NOT NULL,
	[Nurse_gender] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblNurse] PRIMARY KEY CLUSTERED 
(
	[Nurse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 14/06/2020 04:20:18 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoom](
	[Room_id] [int] IDENTITY(1000,1) NOT NULL,
	[Room_number] [int] NOT NULL,
	[Room_Type] [varchar](50) NULL,
 CONSTRAINT [PK_tblRoom] PRIMARY KEY CLUSTERED 
(
	[Room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbpatient]    Script Date: 14/06/2020 04:20:18 ص ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbpatient](
	[Patient_id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_name] [varchar](100) NOT NULL,
	[Patient_address] [varchar](100) NOT NULL,
	[Patient_gender] [varchar](100) NOT NULL,
	[Patient_age] [int] NOT NULL,
	[Patient_addmission] [varchar](100) NOT NULL,
	[Doctor_id] [int] NOT NULL,
	[Room_id] [int] NOT NULL,
	[Nurse_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbpatient] PRIMARY KEY CLUSTERED 
(
	[Patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbDoctor] ON 
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (2, N'Hosny abo-raya', N'Qoutor', CAST(3000 AS Decimal(18, 0)), 45, N'Male')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (4, N'Huda El-garhy', N'Kafr elzayat', CAST(2200 AS Decimal(18, 0)), 30, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (6, N'Alaa Ali', N'Tala', CAST(2500 AS Decimal(18, 0)), 35, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (8, N'Ehsan Eldin', N'Shebin', CAST(1500 AS Decimal(18, 0)), 40, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (10, N'Mahmoud Elshall', N'Suez', CAST(3100 AS Decimal(18, 0)), 50, N'Male')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (14, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (16, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (18, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (20, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (22, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (24, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (26, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (28, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (30, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
INSERT [dbo].[tbDoctor] ([Doctor_id], [Doctor_name], [Doctor_address], [Doctor_salary], [Doctor_age], [Doctor_gender]) VALUES (32, N'Amal Ali', N'Alex', CAST(3000 AS Decimal(18, 0)), 55, N'Female')
GO
SET IDENTITY_INSERT [dbo].[tbDoctor] OFF
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'10X', N'Ahmed Shebl', N'Menouf', CAST(2500 AS Decimal(18, 0)), 56, N'Male')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'12H', N'Marwa Shebl', N'Menouf', CAST(2500 AS Decimal(18, 0)), 50, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'12X', N'Marwa Shebl', N'Menouf', CAST(2500 AS Decimal(18, 0)), 50, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'1D', N'Manal elaraby', N'Kafr el- sheikh', CAST(2500 AS Decimal(18, 0)), 40, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'2B', N'Ahmed Ezat', N'Shebin', CAST(2100 AS Decimal(18, 0)), 35, N'Male')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'2C', N'Soad Mohsen', N'Cairo', CAST(2000 AS Decimal(18, 0)), 32, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'3A', N'Huda Ali', N'Tala', CAST(1800 AS Decimal(18, 0)), 30, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'4B', N'Noha Ezz', N'Alex', CAST(2700 AS Decimal(18, 0)), 56, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'4F', N'Aziza Mostafa', N'Qoutor', CAST(1800 AS Decimal(18, 0)), 30, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'4G', N'Noha Ezz', N'Alex', CAST(2700 AS Decimal(18, 0)), 56, N'Female')
GO
INSERT [dbo].[tblNurse] ([Nurse_id], [Nurse_name], [Nurse_address], [Nurse_salary], [Nurse_age], [Nurse_gender]) VALUES (N'7S', N'Noha Ezz', N'Alex', CAST(2700 AS Decimal(18, 0)), 56, N'Female')
GO
SET IDENTITY_INSERT [dbo].[tblRoom] ON 
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1000, 45, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1001, 46, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1002, 47, N'Operations')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1003, 48, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1004, 49, N'Operations')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1005, 50, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1006, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1007, 52, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1011, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1012, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1013, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1014, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1015, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1016, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1017, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1018, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1019, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1020, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1021, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1022, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1023, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1024, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1025, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1026, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1027, 53, N'Examination')
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1028, 51, NULL)
GO
INSERT [dbo].[tblRoom] ([Room_id], [Room_number], [Room_Type]) VALUES (1029, 53, N'Examination')
GO
SET IDENTITY_INSERT [dbo].[tblRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[tbpatient] ON 
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (1, N'Ali Rabi3', N'Tanta', N'Male', 40, N'Yes', 2, 1000, N'3A')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (2, N'Aliaa Hosny', N'Tala', N'Female', 35, N'Yes', 4, 1001, N'2B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (3, N'Hany Mohamed', N'Beltage', N'Male', 74, N'No', 6, 1002, N'2C')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (4, N'Huda hossam', N'Alex', N'Female', 45, N'Yes', 8, 1003, N'2B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (5, N'Mahmoud yahya', N'Menouf', N'Male', 55, N'Yes', 6, 1004, N'4F')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (16, N'Salma Saber', N'Menouf', N'Female', 26, N'Yes', 2, 1006, N'4B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (18, N'Salma Saber', N'Menouf', N'Female', 62, N'Yes', 8, 1007, N'12X')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (19, N'Salma Saber', N'Menouf', N'Female', 26, N'Yes', 2, 1006, N'4B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (20, N'Salma Saber', N'Menouf', N'Female', 62, N'Yes', 8, 1007, N'12X')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (21, N'Salma Saber', N'Menouf', N'Female', 26, N'Yes', 2, 1006, N'4B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (22, N'Salma Saber', N'Menouf', N'Female', 62, N'Yes', 8, 1007, N'12X')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (23, N'Salma Saber', N'Menouf', N'Female', 26, N'Yes', 2, 1006, N'4B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (24, N'Salma Saber', N'Menouf', N'Female', 62, N'Yes', 8, 1007, N'12X')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (25, N'Salma Saber', N'Menouf', N'Female', 26, N'Yes', 2, 1006, N'4B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (26, N'Salma Saber', N'Menouf', N'Female', 62, N'Yes', 8, 1007, N'12X')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (27, N'Salma Saber', N'Menouf', N'Female', 26, N'Yes', 2, 1006, N'4B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (28, N'Salma Saber', N'Menouf', N'Female', 62, N'Yes', 8, 1007, N'12X')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (29, N'Salma Saber', N'Menouf', N'Female', 26, N'Yes', 2, 1006, N'4B')
GO
INSERT [dbo].[tbpatient] ([Patient_id], [Patient_name], [Patient_address], [Patient_gender], [Patient_age], [Patient_addmission], [Doctor_id], [Room_id], [Nurse_id]) VALUES (30, N'Salma Saber', N'Menouf', N'Female', 62, N'Yes', 8, 1007, N'12X')
GO
SET IDENTITY_INSERT [dbo].[tbpatient] OFF
GO
ALTER TABLE [dbo].[tbpatient]  WITH CHECK ADD  CONSTRAINT [FK_tbpatient_tbDoctor] FOREIGN KEY([Doctor_id])
REFERENCES [dbo].[tbDoctor] ([Doctor_id])
GO
ALTER TABLE [dbo].[tbpatient] CHECK CONSTRAINT [FK_tbpatient_tbDoctor]
GO
ALTER TABLE [dbo].[tbpatient]  WITH CHECK ADD  CONSTRAINT [FK_tbpatient_tblNurse] FOREIGN KEY([Nurse_id])
REFERENCES [dbo].[tblNurse] ([Nurse_id])
GO
ALTER TABLE [dbo].[tbpatient] CHECK CONSTRAINT [FK_tbpatient_tblNurse]
GO
ALTER TABLE [dbo].[tbpatient]  WITH CHECK ADD  CONSTRAINT [FK_tbpatient_tblRoom] FOREIGN KEY([Room_id])
REFERENCES [dbo].[tblRoom] ([Room_id])
GO
ALTER TABLE [dbo].[tbpatient] CHECK CONSTRAINT [FK_tbpatient_tblRoom]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'many to one' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbpatient', @level2type=N'CONSTRAINT',@level2name=N'FK_tbpatient_tbDoctor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'many to one' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbpatient', @level2type=N'CONSTRAINT',@level2name=N'FK_tbpatient_tblNurse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'one to one' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tbpatient', @level2type=N'CONSTRAINT',@level2name=N'FK_tbpatient_tblRoom'
GO
USE [master]
GO
ALTER DATABASE [hospital management] SET  READ_WRITE 
GO
