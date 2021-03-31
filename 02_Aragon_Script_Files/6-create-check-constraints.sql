/* 
	Project name:		Aragon Pharmacy Canada Database
	Date:				29 March 2021
	Course:				MS SQL Server
	Teacher:			Mr. Kh. Daou (PhD)
	Developed by:		Yousef Emadi
*/

-- ---------------------------------------------------------------------------------------------
-- Create Check constraint for required input data for Aragon Pharmacy Canada Database
-- ---------------------------------------------------------------------------------------------

-- Switch to Aragon Pharmacy Canada Database
use Aragon;
go


-- -----------------------------------------------
--       Table No. 1 - Operation.tblCustomer
-- -----------------------------------------------
alter table Operation.tblCustomer
	add
		constraint chk_tblCustomer_Phone check (Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 2 - Operation.tblHealthPlan
-- -----------------------------------------------
alter table Operation.tblHealthPlan
	add
		constraint chk_tblHealthPlan_PostalCode check (PostalCode like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]'),
		constraint chk_tblHealthPlan_Phone check (Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 4 - Operation.tblHousehold
-- -----------------------------------------------
alter table Operation.tblHousehold
	add
		constraint chk_tblHousehold_PostalCode check (PostalCode like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 5 - Operation.tblDoctor
-- -----------------------------------------------
alter table Operation.tblDoctor
	add
		constraint chk_tblDoctor_Phone check (Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'),
		constraint chk_tblDoctor_cell check (Cell like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 6 - Operation.tblClinic
-- -----------------------------------------------
alter table Operation.tblClinic
	add
		constraint chk_tblClinic_PostalCode check (PostalCode like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]'),
		constraint chk_tblClinic_Phone check (Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 8 - HR.tblEmployee
-- -----------------------------------------------
alter table HR.tblEmployee
	add
		constraint chk_tblEmployee_PostalCode check (PostalCode like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]'),
		constraint chk_tblEmployee_Phone check (Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'),
		constraint chk_tblEmployee_Cell check (Cell like '([0-9][0-9][0-9]) [0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]'),
		constraint chk_tblEmployee_DOB check (DOB like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'),
		constraint chk_tblEmployee_StartDate check (StartDate like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'),
		constraint chk_tblEmployee_EndDate check (EndDate like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'),
		constraint chk_tblEmployee_SIN check ([SIN] like '[1-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 9 - Operation.tblRx
-- -----------------------------------------------
alter table Operation.tblRx
	add
		constraint chk_tblRx_Date check ([Date] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]'),
		constraint chk_tblRx_ExpireDate check ([ExpireDate] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 10 - Operation.tblRefill
-- -----------------------------------------------
alter table Operation.tblRefill
	add
		constraint chk_tblRefill_RefillDate check (RefillDate like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]')
;
go

-- -----------------------------------------------
--       Table No. 11 - HR.tblEmployeeTraining
-- -----------------------------------------------
alter table HR.tblEmployeeTraining
	add
		constraint chk_tblEmployeeTraining_Date check ([Date] like '[0-2][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]')
;
go
