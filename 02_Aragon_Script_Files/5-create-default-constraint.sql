/* 
	Project name:		Aragon Pharmacy Canada Database
	Date:				29 March 2021
	Course:				MS SQL Server
	Teacher:			Mr. Kh. Daou (PhD)
	Developed by:		Yousef Emadi
*/

-- ---------------------------------------------------------------------------------------------
-- Create Default constraint for all default values required for Aragon Pharmacy Canada Database
-- ---------------------------------------------------------------------------------------------

-- Switch to Aragon Pharmacy Canada Database
use Aragon;
go


-- -----------------------------------------------
--       Table No. 2 - Operation.tblHealthPlan
-- -----------------------------------------------
alter table Operation.tblHealthPlan
	add
		constraint df_tblHealthPlan_Provine default 'QC' for Provine
;
go

-- -----------------------------------------------
--       Table No. 4 - Operation.tblHousehold
-- -----------------------------------------------
alter table Operation.tblHousehold
	add
		constraint df_tblHousehold_Provine default 'QC' for Provine
;
go

-- -----------------------------------------------
--       Table No. 6 - Operation.tblClinic
-- -----------------------------------------------
alter table Operation.tblClinic
	add
		constraint df_tblClinic_Provine default 'QC' for Provine
;
go

-- -----------------------------------------------
--       Table No. 8 - HR.tblEmployee
-- -----------------------------------------------
alter table HR.tblEmployee
	add
		constraint df_tblEmployee_Provine default 'QC' for Provine
;
go

-- -----------------------------------------------
--       Table No. 9 - Operation.tblRx
-- -----------------------------------------------
alter table Operation.tblRx
	add
		constraint df_tblRx_AutoRefill default 0 for AutoRefill
;
go
