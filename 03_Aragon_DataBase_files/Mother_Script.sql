USE [master]
GO
/****** Object:  Database [Aragon]    Script Date: 2021-03-31 2:19:17 PM ******/
CREATE DATABASE [Aragon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aragon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Aragon.mdf' , SIZE = 10240KB , MAXSIZE = 51200KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'Aragon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Aragon_log.ldf' , SIZE = 3072KB , MAXSIZE = 10240KB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Aragon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aragon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aragon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aragon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aragon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aragon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aragon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aragon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Aragon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aragon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aragon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aragon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aragon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aragon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aragon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aragon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aragon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Aragon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aragon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aragon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aragon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aragon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aragon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aragon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aragon] SET RECOVERY FULL 
GO
ALTER DATABASE [Aragon] SET  MULTI_USER 
GO
ALTER DATABASE [Aragon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aragon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aragon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aragon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Aragon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Aragon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Aragon', N'ON'
GO
ALTER DATABASE [Aragon] SET QUERY_STORE = OFF
GO
USE [Aragon]
GO
/****** Object:  Schema [HR]    Script Date: 2021-03-31 2:19:17 PM ******/
CREATE SCHEMA [HR]
GO
/****** Object:  Schema [Management]    Script Date: 2021-03-31 2:19:17 PM ******/
CREATE SCHEMA [Management]
GO
/****** Object:  Schema [Operation]    Script Date: 2021-03-31 2:19:17 PM ******/
CREATE SCHEMA [Operation]
GO
/****** Object:  Schema [Supply]    Script Date: 2021-03-31 2:19:17 PM ******/
CREATE SCHEMA [Supply]
GO
/****** Object:  Table [dbo].[dataDictionary]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dataDictionary](
	[schema_name] [nvarchar](128) NULL,
	[table_name] [sysname] NOT NULL,
	[column_name] [sysname] NULL,
	[data_type] [sysname] NULL,
	[data_type_ext] [nvarchar](269) NULL,
	[nullable] [varchar](1) NOT NULL,
	[default_value] [nvarchar](max) NULL,
	[primary_key] [varchar](2) NOT NULL,
	[foreign_key] [varchar](2) NOT NULL,
	[unique_key] [varchar](2) NOT NULL,
	[check_contraint] [varchar](5) NULL,
	[computed_column_definition] [nvarchar](max) NULL,
	[comments] [sql_variant] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HR].[tblClass]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[tblClass](
	[ClassID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[Cost] [decimal](10, 2) NULL,
	[Renewal] [tinyint] NULL,
	[Required] [bit] NULL,
	[Provider] [nvarchar](30) NULL,
 CONSTRAINT [pk_tblClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[tblEmployee]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[tblEmployee](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[EmpFirst] [nvarchar](30) NOT NULL,
	[EmpMi] [nvarchar](2) NULL,
	[EmpLast] [nvarchar](30) NOT NULL,
	[SIN] [nchar](11) NULL,
	[DOB] [date] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[StreetAddress] [nvarchar](20) NULL,
	[City] [nvarchar](20) NOT NULL,
	[Provine] [nchar](2) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[jobID] [int] NOT NULL,
	[Memo] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NULL,
	[Cell] [nvarchar](20) NULL,
	[Salary] [decimal](10, 2) NULL,
	[HourlyRate] [decimal](10, 2) NULL,
	[Review] [nvarchar](1000) NULL,
 CONSTRAINT [pk_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[tblEmployeeTraining]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[tblEmployeeTraining](
	[EmpID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [pk_tblEmployeeTraining] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC,
	[Date] ASC,
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HR].[tblJobTitle]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[tblJobTitle](
	[jobID] [int] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [pk_tblJobTitle] PRIMARY KEY CLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[jobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblClinic]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblClinic](
	[ClinicID] [int] IDENTITY(1,1) NOT NULL,
	[ClinicName] [nvarchar](50) NOT NULL,
	[Address1] [nvarchar](20) NULL,
	[Address2] [nvarchar](20) NULL,
	[City] [nvarchar](20) NOT NULL,
	[Provine] [nchar](2) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[Phone] [nvarchar](20) NULL,
 CONSTRAINT [pk_tblClinic] PRIMARY KEY CLUSTERED 
(
	[ClinicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblCustomer]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblCustomer](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[CustFirst] [nvarchar](30) NOT NULL,
	[CustLast] [nvarchar](30) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[DOB] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Balance] [decimal](10, 2) NULL,
	[ChildproofCap] [bit] NULL,
	[PlanID] [int] NULL,
	[HouseID] [int] NULL,
	[HeadHH] [int] NULL,
	[Allergies] [nvarchar](50) NULL,
 CONSTRAINT [pk_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblDoctor]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblDoctor](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorFirst] [nvarchar](30) NOT NULL,
	[DoctorLast] [nvarchar](30) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Cell] [nvarchar](20) NULL,
	[ClinicID] [int] NOT NULL,
 CONSTRAINT [pk_tblDoctor] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblDrug]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblDrug](
	[DIN] [nchar](8) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Generic] [nchar](8) NULL,
	[Description] [nvarchar](200) NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[Dosage] [nvarchar](10) NOT NULL,
	[DosageForm] [nvarchar](20) NULL,
	[Cost] [decimal](10, 2) NULL,
	[Price] [decimal](10, 2) NULL,
	[Interactions] [nvarchar](200) NULL,
	[PregCategory] [nvarchar](10) NULL,
	[Supplier] [nvarchar](30) NULL,
 CONSTRAINT [pk_tblDrug] PRIMARY KEY CLUSTERED 
(
	[DIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblHealthPlan]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblHealthPlan](
	[PlanID] [int] NOT NULL,
	[PlanName] [nvarchar](20) NOT NULL,
	[StreetAddress] [nvarchar](20) NULL,
	[City] [nvarchar](20) NOT NULL,
	[Provine] [nchar](2) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Days] [int] NULL,
	[Website] [nvarchar](50) NULL,
 CONSTRAINT [pk_tblHealthPlan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblHousehold]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblHousehold](
	[HouseID] [int] IDENTITY(1,1) NOT NULL,
	[StreetAddress] [nvarchar](20) NULL,
	[City] [nvarchar](20) NOT NULL,
	[Provine] [nchar](2) NOT NULL,
	[PostalCode] [nvarchar](10) NOT NULL,
 CONSTRAINT [pk_tblHousehold] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblRefill]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblRefill](
	[PrescriptionID] [int] NOT NULL,
	[RefillDate] [date] NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [pk_tblRefill] PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC,
	[RefillDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Operation].[tblRx]    Script Date: 2021-03-31 2:19:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Operation].[tblRx](
	[PrescriptionID] [int] IDENTITY(1,1) NOT NULL,
	[DIN] [nchar](8) NOT NULL,
	[Quantity] [decimal](10, 2) NOT NULL,
	[Unit] [nvarchar](10) NULL,
	[Date] [date] NULL,
	[ExpireDate] [date] NULL,
	[Refills] [int] NULL,
	[AutoRefill] [bit] NULL,
	[RefillsUsed] [int] NULL,
	[Instructions] [nvarchar](50) NULL,
	[CustID] [int] NOT NULL,
	[DoctorID] [int] NULL,
 CONSTRAINT [pk_tblRx] PRIMARY KEY CLUSTERED 
(
	[PrescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [HR].[tblEmployee] ADD  CONSTRAINT [df_tblEmployee_Provine]  DEFAULT ('QC') FOR [Provine]
GO
ALTER TABLE [Operation].[tblClinic] ADD  CONSTRAINT [df_tblClinic_Provine]  DEFAULT ('QC') FOR [Provine]
GO
ALTER TABLE [Operation].[tblHealthPlan] ADD  CONSTRAINT [df_tblHealthPlan_Provine]  DEFAULT ('QC') FOR [Provine]
GO
ALTER TABLE [Operation].[tblHousehold] ADD  CONSTRAINT [df_tblHousehold_Provine]  DEFAULT ('QC') FOR [Provine]
GO
ALTER TABLE [Operation].[tblRx] ADD  CONSTRAINT [df_tblRx_AutoRefill]  DEFAULT ((0)) FOR [AutoRefill]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [fk_tblEmployee_tblJobTitle] FOREIGN KEY([jobID])
REFERENCES [HR].[tblJobTitle] ([jobID])
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [fk_tblEmployee_tblJobTitle]
GO
ALTER TABLE [HR].[tblEmployeeTraining]  WITH CHECK ADD  CONSTRAINT [fk_tblEmployeeTraining_ClassID] FOREIGN KEY([ClassID])
REFERENCES [HR].[tblClass] ([ClassID])
GO
ALTER TABLE [HR].[tblEmployeeTraining] CHECK CONSTRAINT [fk_tblEmployeeTraining_ClassID]
GO
ALTER TABLE [HR].[tblEmployeeTraining]  WITH CHECK ADD  CONSTRAINT [fk_tblEmployeeTraining_tblEmployee] FOREIGN KEY([EmpID])
REFERENCES [HR].[tblEmployee] ([EmpID])
GO
ALTER TABLE [HR].[tblEmployeeTraining] CHECK CONSTRAINT [fk_tblEmployeeTraining_tblEmployee]
GO
ALTER TABLE [Operation].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [fk_tblCustomer_tblCustomer] FOREIGN KEY([HeadHH])
REFERENCES [Operation].[tblCustomer] ([CustID])
GO
ALTER TABLE [Operation].[tblCustomer] CHECK CONSTRAINT [fk_tblCustomer_tblCustomer]
GO
ALTER TABLE [Operation].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [fk_tblCustomer_tblHealthPlan] FOREIGN KEY([PlanID])
REFERENCES [Operation].[tblHealthPlan] ([PlanID])
GO
ALTER TABLE [Operation].[tblCustomer] CHECK CONSTRAINT [fk_tblCustomer_tblHealthPlan]
GO
ALTER TABLE [Operation].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [fk_tblCustomer_tblHouseHold] FOREIGN KEY([HouseID])
REFERENCES [Operation].[tblHousehold] ([HouseID])
GO
ALTER TABLE [Operation].[tblCustomer] CHECK CONSTRAINT [fk_tblCustomer_tblHouseHold]
GO
ALTER TABLE [Operation].[tblDoctor]  WITH CHECK ADD  CONSTRAINT [fk_tblDoctor_tblClinic] FOREIGN KEY([ClinicID])
REFERENCES [Operation].[tblClinic] ([ClinicID])
GO
ALTER TABLE [Operation].[tblDoctor] CHECK CONSTRAINT [fk_tblDoctor_tblClinic]
GO
ALTER TABLE [Operation].[tblDrug]  WITH CHECK ADD  CONSTRAINT [fk_tblDrug_tblDrug] FOREIGN KEY([Generic])
REFERENCES [Operation].[tblDrug] ([DIN])
GO
ALTER TABLE [Operation].[tblDrug] CHECK CONSTRAINT [fk_tblDrug_tblDrug]
GO
ALTER TABLE [Operation].[tblRefill]  WITH CHECK ADD  CONSTRAINT [fk_tblRefill_tblEmployee] FOREIGN KEY([EmpID])
REFERENCES [HR].[tblEmployee] ([EmpID])
GO
ALTER TABLE [Operation].[tblRefill] CHECK CONSTRAINT [fk_tblRefill_tblEmployee]
GO
ALTER TABLE [Operation].[tblRefill]  WITH CHECK ADD  CONSTRAINT [fk_tblRefill_tblRx] FOREIGN KEY([PrescriptionID])
REFERENCES [Operation].[tblRx] ([PrescriptionID])
GO
ALTER TABLE [Operation].[tblRefill] CHECK CONSTRAINT [fk_tblRefill_tblRx]
GO
ALTER TABLE [Operation].[tblRx]  WITH CHECK ADD  CONSTRAINT [fk_tblRx_tblCustomer] FOREIGN KEY([CustID])
REFERENCES [Operation].[tblCustomer] ([CustID])
GO
ALTER TABLE [Operation].[tblRx] CHECK CONSTRAINT [fk_tblRx_tblCustomer]
GO
ALTER TABLE [Operation].[tblRx]  WITH CHECK ADD  CONSTRAINT [fk_tblRx_tblDoctor] FOREIGN KEY([DoctorID])
REFERENCES [Operation].[tblDoctor] ([DoctorID])
GO
ALTER TABLE [Operation].[tblRx] CHECK CONSTRAINT [fk_tblRx_tblDoctor]
GO
ALTER TABLE [Operation].[tblRx]  WITH CHECK ADD  CONSTRAINT [fk_tblRx_tblDrug] FOREIGN KEY([DIN])
REFERENCES [Operation].[tblDrug] ([DIN])
GO
ALTER TABLE [Operation].[tblRx] CHECK CONSTRAINT [fk_tblRx_tblDrug]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployee_Cell] CHECK  (([Cell] like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [chk_tblEmployee_Cell]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployee_DOB] CHECK  (([DOB] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'))
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [chk_tblEmployee_DOB]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployee_EndDate] CHECK  (([EndDate] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'))
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [chk_tblEmployee_EndDate]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployee_Phone] CHECK  (([Phone] like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [chk_tblEmployee_Phone]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployee_PostalCode] CHECK  (([PostalCode] like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]'))
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [chk_tblEmployee_PostalCode]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployee_SIN] CHECK  (([SIN] like '[1-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]'))
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [chk_tblEmployee_SIN]
GO
ALTER TABLE [HR].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployee_StartDate] CHECK  (([StartDate] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'))
GO
ALTER TABLE [HR].[tblEmployee] CHECK CONSTRAINT [chk_tblEmployee_StartDate]
GO
ALTER TABLE [HR].[tblEmployeeTraining]  WITH CHECK ADD  CONSTRAINT [chk_tblEmployeeTraining_Date] CHECK  (([Date] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'))
GO
ALTER TABLE [HR].[tblEmployeeTraining] CHECK CONSTRAINT [chk_tblEmployeeTraining_Date]
GO
ALTER TABLE [Operation].[tblClinic]  WITH CHECK ADD  CONSTRAINT [chk_tblClinic_Phone] CHECK  (([Phone] like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblClinic] CHECK CONSTRAINT [chk_tblClinic_Phone]
GO
ALTER TABLE [Operation].[tblClinic]  WITH CHECK ADD  CONSTRAINT [chk_tblClinic_PostalCode] CHECK  (([PostalCode] like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]'))
GO
ALTER TABLE [Operation].[tblClinic] CHECK CONSTRAINT [chk_tblClinic_PostalCode]
GO
ALTER TABLE [Operation].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [chk_tblCustomer_Phone] CHECK  (([Phone] like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblCustomer] CHECK CONSTRAINT [chk_tblCustomer_Phone]
GO
ALTER TABLE [Operation].[tblDoctor]  WITH CHECK ADD  CONSTRAINT [chk_tblDoctor_cell] CHECK  (([Cell] like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblDoctor] CHECK CONSTRAINT [chk_tblDoctor_cell]
GO
ALTER TABLE [Operation].[tblDoctor]  WITH CHECK ADD  CONSTRAINT [chk_tblDoctor_Phone] CHECK  (([Phone] like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblDoctor] CHECK CONSTRAINT [chk_tblDoctor_Phone]
GO
ALTER TABLE [Operation].[tblHealthPlan]  WITH CHECK ADD  CONSTRAINT [chk_tblHealthPlan_Phone] CHECK  (([Phone] like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblHealthPlan] CHECK CONSTRAINT [chk_tblHealthPlan_Phone]
GO
ALTER TABLE [Operation].[tblHealthPlan]  WITH CHECK ADD  CONSTRAINT [chk_tblHealthPlan_PostalCode] CHECK  (([PostalCode] like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]'))
GO
ALTER TABLE [Operation].[tblHealthPlan] CHECK CONSTRAINT [chk_tblHealthPlan_PostalCode]
GO
ALTER TABLE [Operation].[tblHousehold]  WITH CHECK ADD  CONSTRAINT [chk_tblHousehold_PostalCode] CHECK  (([PostalCode] like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]'))
GO
ALTER TABLE [Operation].[tblHousehold] CHECK CONSTRAINT [chk_tblHousehold_PostalCode]
GO
ALTER TABLE [Operation].[tblRefill]  WITH CHECK ADD  CONSTRAINT [chk_tblRefill_RefillDate] CHECK  (([RefillDate] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblRefill] CHECK CONSTRAINT [chk_tblRefill_RefillDate]
GO
ALTER TABLE [Operation].[tblRx]  WITH CHECK ADD  CONSTRAINT [chk_tblRx_Date] CHECK  (([Date] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblRx] CHECK CONSTRAINT [chk_tblRx_Date]
GO
ALTER TABLE [Operation].[tblRx]  WITH CHECK ADD  CONSTRAINT [chk_tblRx_ExpireDate] CHECK  (([ExpireDate] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'))
GO
ALTER TABLE [Operation].[tblRx] CHECK CONSTRAINT [chk_tblRx_ExpireDate]
GO
USE [master]
GO
ALTER DATABASE [Aragon] SET  READ_WRITE 
GO
