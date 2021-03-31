/* 
	Project name:		Aragon Pharmacy Canada Database
	Date:				29 March 2021
	Course:				MS SQL Server
	Teacher:			Mr. Kh. Daou (PhD)
	Developed by:		Yousef Emadi
*/

-- ---------------------------------------
-- Creating Aragon DB and DB log files
-- ---------------------------------------

use master;

drop database Aragon
;
go

create database Aragon
--DB primary file
on primary ( 
	
	name = 'Aragon',
	size = 10MB,
	filegrowth = 5MB,
	maxsize = 50MB,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Aragon.mdf'

)

log on (

	name = 'Aragon_log',
	size = 3MB,					--MS recommend 1/4 of primary size
	filegrowth = 10%,
	maxsize = 10MB,
	filename = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Aragon_log.ldf'

)
;
go


execute sp_helpdb 'Aragon'
;
go