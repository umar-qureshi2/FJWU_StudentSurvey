/*
   Thursday, May 11, 20171:18:16 PM
   User: IDPUser
   Server: ASIA6798\MSSQLEXPRESS12
   Database: FJWU_StudentSurvey
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Department
	(
	DepartmentId int NOT NULL IDENTITY (1, 1)
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Department SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Department', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Department', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Department', 'Object', 'CONTROL') as Contr_Per 