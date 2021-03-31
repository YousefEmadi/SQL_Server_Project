/* 
	Project name:		Aragon Pharmacy Canada Database
	Date:				29 March 2021
	Course:				MS SQL Server
	Teacher:			Mr. Kh. Daou (PhD)
	Developed by:		Yousef Emadi
*/

-- -------------------------------------------------------------------------------
-- Create the relationships between all tables for Aragon Pharmacy Canada Database
-- -------------------------------------------------------------------------------

-- Switch to Aragon Pharmacy Canada Database
use Aragon;
go


-- -----------------------------------------------
--       Table No. 1 - Operation.tblCustomer
-- -----------------------------------------------
alter table Operation.tblCustomer
	add 
		constraint fk_tblCustomer_tblHealthPlan foreign key (PlanID) references Operation.tblHealthPlan (PlanID),
		constraint fk_tblCustomer_tblHouseHold foreign key (HouseID) references Operation.tblHouseHold (HouseID),
		constraint fk_tblCustomer_tblCustomer foreign key (HeadHH) references Operation.tblCustomer (CustID)		
;
go

-- -----------------------------------------------
--       Table No. 5 - Operation.tblDoctor
-- -----------------------------------------------
alter table Operation.tblDoctor
	add 
		constraint fk_tblDoctor_tblClinic foreign key (ClinicID) references Operation.tblClinic (ClinicID)
;
go

-- -----------------------------------------------
--       Table No. 7 - Operation.tblDrug
-- -----------------------------------------------
alter table Operation.tblDrug
	add 
		constraint fk_tblDrug_tblDrug foreign key (Generic) references Operation.tblDrug (DIN)
;
go

-- -----------------------------------------------
--       Table No. 8 - HR.tblEmployee
-- -----------------------------------------------
alter table HR.tblEmployee
	add 
		constraint fk_tblEmployee_tblJobTitle foreign key (jobID) references HR.tblJobTitle (jobID)
;
go

-- -----------------------------------------------
--       Table No. 9 - Operation.tblRx
-- -----------------------------------------------
alter table Operation.tblRx
	add 
		constraint fk_tblRx_tblDrug foreign key (DIN) references Operation.tblDrug (DIN),
		constraint fk_tblRx_tblCustomer foreign key (CustID) references Operation.tblCustomer (CustID),
		constraint fk_tblRx_tblDoctor foreign key (DoctorID) references Operation.tblDoctor (DoctorID)
;
go

-- -----------------------------------------------
--       Table No. 10 - Operation.tblRefill
-- -----------------------------------------------
alter table Operation.tblRefill
	add 
		constraint fk_tblRefill_tblRx foreign key (PrescriptionID) references Operation.tblRx (PrescriptionID),
		constraint fk_tblRefill_tblEmployee foreign key (EmpID) references HR.tblEmployee (EmpID)
;
go

-- -----------------------------------------------
--       Table No. 11 - HR.tblEmployeeTraining
-- -----------------------------------------------
alter table HR.tblEmployeeTraining
	add 
		constraint fk_tblEmployeeTraining_tblEmployee foreign key (EmpID) references HR.tblEmployee (EmpID),
		constraint fk_tblEmployeeTraining_ClassID foreign key (ClassID) references HR.tblClass (ClassID)
;
go


