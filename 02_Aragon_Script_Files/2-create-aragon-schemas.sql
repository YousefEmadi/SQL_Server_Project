/* 
	Project name:		Aragon Pharmacy Canada Database
	Date:				29 March 2021
	Course:				MS SQL Server
	Teacher:			Mr. Kh. Daou (PhD)
	Developed by:		Yousef Emadi
*/

-- -----------------------------------------------------
-- Creating Schemas for Aragon Pharmacy Canada Database
-- -----------------------------------------------------

--switch to Aragon Pharmacy Canada Database
use Aragon;
;
go

/*
List of Schemas we need:
1- Management
2- HR
3- Operation
4- Supply
*/

create schema Management authorization dbo
;
go


create schema HR authorization dbo
;
go



create schema Operation authorization dbo
;
go


create schema Supply authorization dbo
;
go