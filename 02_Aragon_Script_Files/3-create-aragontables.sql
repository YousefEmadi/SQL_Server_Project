/* 
	Project name:		Aragon Pharmacy Canada Database
	Date:				29 March 2021
	Course:				MS SQL Server
	Teacher:			Mr. Kh. Daou (PhD)
	Developed by:		Yousef Emadi
*/


-- -----------------------------------------------------------
-- Creating Table Objects for Aragon Pharmacy Canada Database
-- -----------------------------------------------------------

-- Switch to Aragon Pharmacy Canada Database
use Aragon;
go


-- -----------------------------------------------
--       Table No. 1 - Operation.tblCustomer
-- -----------------------------------------------
if OBJECT_ID('Operation.tblCustomer', 'U') is not null drop table Operation.tblCustomer;
go
create table Operation.tblCustomer
(
	CustID int identity(1,1) not null, --PK auto-generated number
	CustFirst nvarchar(30) not null,
	CustLast nvarchar(30) not null,
	Phone nvarchar(20),	-- Format: (###) ###-####
	DOB date,
	Gender nvarchar(10),
	Balance decimal(10, 2),
	ChildproofCap bit,
	PlanID int,		--FK Ref Operation.tblHealthPlan / Lookup field displaying plan id & name
	HouseID int,	--FK Ref Operation.tblHouseHold
	HeadHH int,				--FK internal relation
	Allergies nvarchar(50)
	constraint pk_tblCustomer primary key clustered (CustID asc)
);
go


-- -----------------------------------------------
--       Table No. 2 - Operation.tblHealthPlan
-- -----------------------------------------------
if OBJECT_ID('Operation.tblHealthPlan', 'U') is not null drop table Operation.tblHealthPlan;
go
create table Operation.tblHealthPlan 
(
	PlanID int not null unique,	--PK 
	PlanName nvarchar(20) not null,
	StreetAddress nvarchar(20),
	City nvarchar(20) not null,
	Provine nchar(2) not null,	-- 2-letter province name default value: 'QC'
	PostalCode nvarchar(10) not null,		-- Format: A#A #A#
	Phone nvarchar(20),			-- Format: (###) ###-####
	Days int,
	Website nvarchar(50)
	constraint pk_tblHealthPlan primary key clustered (PlanID asc)
);
go

-- -----------------------------------------------
--       Table No. 3 - HR.tblJobTitle
-- -----------------------------------------------
if OBJECT_ID('HR.tblJobTitle','u') is not null drop table HR.tblJobTitle;
go
create table HR.tblJobTitle
(
	jobID int not null unique, --PK
	Title nvarchar(20) not null,
	Description nvarchar(100),
	constraint pk_tblJobTitle primary key clustered (jobID asc)
);
go

-- -----------------------------------------------
--       Table No. 4 - Operation.tblHousehold
-- -----------------------------------------------
if OBJECT_ID('Operation.tblHousehold','u') is not null drop table Operation.tblHousehold;
go

create table Operation.tblHousehold
(
	HouseID int identity(1, 1) not null,	--PK auto-generated number assigned to a new order
	StreetAddress nvarchar(20),
	City nvarchar(20) not null,
	Provine nchar(2) not null,	-- 2-letter province name default value: 'QC'
	PostalCode nvarchar(10) not null,	-- Format: A#A #A#
	constraint pk_tblHousehold primary key clustered (HouseID asc)
);
go

-- -----------------------------------------------
--       Table No. 5 - Operation.tblDoctor
-- -----------------------------------------------
if OBJECT_ID('Operation.tblDoctor','u') is not null drop table Operation.tblDoctor;
go

create table Operation.tblDoctor
(
	DoctorID int identity(1, 1) not null,		--PK auto-generated number assigned to a new order
	DoctorFirst nvarchar(30) not null,
	DoctorLast nvarchar(30) not null,
	Phone nvarchar(20),			-- Format: (###) ###-####
	Cell nvarchar(20),			-- Format: (###) ###-####
	ClinicID int not null,		--FK Ref Operation.tblClinic
	constraint pk_tblDoctor primary key clustered (DoctorID asc)
);
go

-- -----------------------------------------------
--       Table No. 6 - Operation.tblClinic
-- -----------------------------------------------
if OBJECT_ID('Operation.tblClinic','u') is not null drop table Operation.tblClinic;
go

create table Operation.tblClinic
(
	ClinicID int identity(1, 1) not null,		--PK auto-generated number assigned to a new order
	ClinicName nvarchar(50) not null,
	Address1 nvarchar(20),
	Address2 nvarchar(20),
	City nvarchar(20) not null,
	Provine nchar(2) not null,	-- 2-letter province name default value: 'QC'
	PostalCode nvarchar(10) not null,		-- Format: A#A #A#
	Phone nvarchar(20),			-- Format: (###) ###-####
	constraint pk_tblClinic primary key clustered (ClinicID asc)
);
go

-- -----------------------------------------------
--       Table No. 7 - Operation.tblDrug
-- -----------------------------------------------
if OBJECT_ID('Operation.tblDrug','u') is not null drop table Operation.tblDrug;
go

create table Operation.tblDrug
(
	DIN nchar(8) not null unique,		--PK 8-digit number not using in calculation
	[Name] nvarchar(30) not null,
	Generic nchar(8),					----FK internal relation  /   select by checkbox
	[Description] nvarchar(200),
	Unit nvarchar(10) not null,
	Dosage nvarchar(10) not null,
	DosageForm nvarchar(20),
	Cost decimal(10, 2),
	Price decimal(10, 2),
	Interactions nvarchar(200),
	PregCategory nvarchar(10),		--for data integrity with other branches & not mandatory in Canada
	Supplier nvarchar(30),
	constraint pk_tblDrug primary key clustered (DIN)
);
go


-- -----------------------------------------------
--       Table No. 8 - HR.tblEmployee
-- -----------------------------------------------
if OBJECT_ID('HR.tblEmployee','u') is not null drop table HR.tblEmployee;
go

create table HR.tblEmployee
(
	EmpID int identity(1,1) not null, --PK auto-generated number
	EmpFirst nvarchar(30) not null,
	EmpMi nvarchar(2),
	EmpLast nvarchar(30) not null,
	[SIN] nchar(11),				--format: ###-###-###
	DOB date,				--format ##/##/####
	StartDate date,			--format ##/##/####
	EndDate date,			--format ##/##/####
	StreetAddress nvarchar(20),
	City nvarchar(20) not null,
	Provine nchar(2) not null,	-- 2-letter province name default value: 'QC'
	PostalCode nvarchar(10) not null,		-- Format: A#A #A#
	jobID int not null,					--FK Ref HR.tblJobTitle
	Memo nvarchar(255),
	Phone nvarchar(20),			-- Format: (###) ###-####
	Cell nvarchar(20),			-- Format: (###) ###-####
	Salary decimal(10,2),
	HourlyRate decimal(10,2),
	Review nvarchar(1000)
	constraint pk_tblEmployee primary key clustered (EmpID)
);
go


-- -----------------------------------------------
--       Table No. 9 - Operation.tblRx
-- -----------------------------------------------
if OBJECT_ID('Operation.tblRx','u') is not null drop table Operation.tblRx;
go

create table Operation.tblRx
(
	PrescriptionID int identity(1, 1) not null,		--PK auto-generated number
	DIN nchar(8) not null,		--FK Ref Operation.tblDrug
	Quantity decimal(10,2) not null,
	Unit nvarchar(10),
	[Date] date,			--format ##/##/####
	[ExpireDate] date,		--format ##/##/####
	Refills int,
	AutoRefill bit,			--default value is 0 (no)
	RefillsUsed int,
	Instructions nvarchar(50),
	CustID int not null,	--FK Ref Operation.tblCustomer
	DoctorID int			--FK Ref Operation.tblDoctor
	constraint pk_tblRx primary key clustered (PrescriptionID)
);
go

-- -----------------------------------------------
--       Table No. 10 - Operation.tblRefill
-- -----------------------------------------------
if OBJECT_ID('Operation.tblRefill','u') is not null drop table Operation.tblRefill;
go

create table Operation.tblRefill
(
	PrescriptionID int not null,		--FK Ref Operation.tblRx
	RefillDate date,					--format ##/##/####
	EmpID int not null,					--FK Ref HR.tblEmployee
	constraint pk_tblRefill primary key clustered (PrescriptionID, RefillDate)
);
go


-- -----------------------------------------------
--       Table No. 11 - HR.tblEmployeeTraining
-- -----------------------------------------------
if OBJECT_ID('HR.tblEmployeeTraining','u') is not null drop table HR.tblEmployeeTraining;
go

create table HR.tblEmployeeTraining
(
	EmpID int not null,					--PK & FK Ref HR.tblEmployee
	[Date] date,					--PK & format ##/##/####
	ClassID int not null,			--PK & FK Ref HR.tblClass
	constraint pk_tblEmployeeTraining primary key clustered (EmpID, [Date], ClassID)
);
go


-- -----------------------------------------------
--       Table No. 12 - HR.tblClass
-- -----------------------------------------------
if OBJECT_ID('HR.tblClass','u') is not null drop table HR.tblClass;
go

create table HR.tblClass
(
	ClassID int not null unique,			--PK 
	[Description] nvarchar(50),
	Cost decimal(10, 2), 
	Renewal tinyint,
	[Required] bit,
	[Provider] nvarchar(30),
	constraint pk_tblClass primary key clustered (ClassID asc)
);
go



/*
select *
from sys.all_objects
where type= 'u'
;
go


execute sp_helpdb Northwind_YE
;
go


execute sp_help 'sales.customers'
;
go
*/
