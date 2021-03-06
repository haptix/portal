--/*
--   miércoles, 13 de abril de 201111:01:47 a.m.
--   User: sa
--   Server: .
--   Database: Appleseed
--   Application: 
--*/

--/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
--BEGIN TRANSACTION
--SET QUOTED_IDENTIFIER ON
--SET ARITHABORT ON
--SET NUMERIC_ROUNDABORT OFF
--SET CONCAT_NULL_YIELDS_NULL ON
--SET ANSI_NULLS ON
--SET ANSI_PADDING ON
--SET ANSI_WARNINGS ON
--COMMIT
--BEGIN TRANSACTION
--GO
--CREATE TABLE dbo.DBVersion
--	(
--	Version nvarchar(50) NULL,
--	AreaName nvarchar(100) NOT NULL
--	)  ON [PRIMARY]
--GO
--ALTER TABLE dbo.DBVersion SET (LOCK_ESCALATION = TABLE)
--GO
--COMMIT
--select Has_Perms_By_Name(N'dbo.DBVersion', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.DBVersion', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.DBVersion', 'Object', 'CONTROL') as Contr_Per 
select *  from DBVersion