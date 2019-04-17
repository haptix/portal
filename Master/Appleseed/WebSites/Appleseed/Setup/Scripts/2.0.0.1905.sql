/* CREATE TABLE FOR DYNAMIC PAGE REDIRECTION */
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rb_Pages_DynamicRedirects]') AND type in (N'U'))
BEGIN
Create table dbo.rb_Pages_DynamicRedirects
(
DynamicPageID int identity(1,1) primary key,
FriendlyUrl nvarchar(512),
RedirectToUrl nvarchar(512)
)
END

/* CREATE PAGE FOR Page Friendly URL if not exist */
DECLARE @PAGEID INT,
		@ModuleDefId INT,
		@ModuleID INT
if not exists(select * from rb_pages where PageName='Short Links')
BEGIN
	EXEC rb_AddTab 0,100,'Short Links',1205,'Admins;',0,'', @PAGEID output
	EXEC  [rb_UpdateTabCustomSettings] @TabID = @PAGEID,@SettingName ='CustomTheme', @SettingValue ='Appleseed.Admin'	
	EXEC  [rb_UpdateTabCustomSettings] @TabID = @PAGEID,@SettingName ='CustomLayout', @SettingValue ='Appleseed.Admin'
END

--if exists(select * from rb_pages where PageName='Packages')
--BEGIN
--	--set @PAGEID = null
--	--select @PAGEID = PageID from rb_pages where PageName='Packages'
--EXEC  [rb_UpdateTabCustomSettings] @TabID = 5,@SettingName ='CustomTheme', @SettingValue ='Appleseed.Admin'	
--EXEC  [rb_UpdateTabCustomSettings] @TabID = 5,@SettingName ='CustomLayout', @SettingValue ='Appleseed.Admin'
--END

select @ModuleDefId=ModuleDefID from rb_ModuleDefinitions where GeneralModDefID='C1EA4115-E7F2-4CBC-B1E7-DDA46791493C'

/* Add PageFriendlyUrl Module on new created page if not loaded */
IF NOT EXISTS(SELECT * FROM rb_Modules WHERE ModuleDefID=@ModuleDefId)
BEGIN
EXEC rb_addModule @PAGEID,1,'Short Links','ContentPane',@ModuleDefId,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID output
END

/*renaming page friendly url module to Admin - Short Links*/
UPDATE [rb_GeneralModuleDefinitions] SET FriendlyName = 'Admin - Short Links' where GeneralModDefID = 'C1EA4115-E7F2-4CBC-B1E7-DDA46791493C'

/* replacing new file browser with old file manager */
select @ModuleDefId=ModuleDefID from rb_ModuleDefinitions where GeneralModDefID='D7B8B22F-366B-4D80-9E49-13C09120A89F'
IF NOT EXISTS(SELECT * FROM rb_Modules WHERE ModuleDefID=@ModuleDefId)
BEGIN
	EXEC rb_addModule 155,1,'File Manager','ContentPane',@ModuleDefId,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID output
END
DELETE FROM  rb_GeneralModuleDefinitions WHERE GeneralModDefID = 'DE97F04D-FB0A-445d-829A-61E4FA69ADB2'
DELETE FROM  rb_ModuleDefinitions WHERE GeneralModDefID = 'DE97F04D-FB0A-445d-829A-61E4FA69ADB2'

/* 27/6/2016 */
/* delete Pages page*/
IF EXISTS(SELECT * FROM rb_pages WHERE [PageName]='Pages' and PageID=200)
BEGIN
	BEGIN TRY
		DELETE FROM rb_pages WHERE PageID=200 or parentpageid = 200
	END TRY  
	BEGIN CATCH  
		-- Execute error retrieval routine.  
	END CATCH;
END

IF EXISTS(SELECT * FROM rb_pages WHERE [PageName]='Database Editor' and PageID=151)
BEGIN
	BEGIN TRY
		DELETE FROM rb_pages WHERE [PageName]='Database Editor' and PageID=151
	END TRY  
	BEGIN CATCH  
		-- Execute error retrieval routine.  
	END CATCH;
END

IF EXISTS(SELECT * FROM rb_pages WHERE [PageName]='Database Tool' and PageID=152)
BEGIN
	
	BEGIN TRY
		DELETE FROM rb_pages WHERE [PageName]='Database Tool' and PageID=152
	END TRY  
	BEGIN CATCH  
		-- Execute error retrieval routine.  
	END CATCH;
END

IF NOT EXISTS(SELECT * FROM rb_Modules WHERE TabId =150 AND ModuleDefId = 4)
BEGIN
EXEC rb_addModule 150,1,'Database Table Edit','ContentPane',4,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID output
END

/*30/06/2016*/
UPDATE rb_Pages SET PageName = 'Global Modules' WHERE PageID = 120
GO


BEGIN TRY
	DELETE FROM rb_Modules WHERE tabid in (SELECT pageId FROM rb_pages WHERE ParentPageID = 170)
END TRY  
BEGIN CATCH  
	-- Execute error retrieval routine.  
END CATCH;
GO


BEGIN TRY
	DELETE FROM rb_Pages WHERE ParentPageID = 170
END TRY  
BEGIN CATCH  
	-- Execute error retrieval routine.  
END CATCH;
GO

UPDATE rb_Pages SET PageName = 'Monitoring' WHERE PageID = 170
GO

DECLARE @ModuleID INT
IF NOT EXISTS(SELECT * FROM rb_Modules WHERE TabId =170 AND ModuleDefId = 11)
BEGIN
	
BEGIN TRY
	EXEC rb_addModule 170,1,'Monitoring','ContentPane',11,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID output
END TRY  
BEGIN CATCH  
	-- Execute error retrieval routine.  
END CATCH;

END

IF NOT EXISTS(SELECT * FROM rb_Modules WHERE TabId =170 AND ModuleDefId = 29)
BEGIN

BEGIN TRY
	EXEC rb_addModule 170,2,'Error Logs','ContentPane',29,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID output
END TRY  
BEGIN CATCH  
	-- Execute error retrieval routine.  
END CATCH;
END


IF NOT EXISTS(SELECT * FROM rb_Modules WHERE TabId =170 AND ModuleDefId = 6)
BEGIN
BEGIN TRY
	EXEC rb_addModule 170,3,'Event Logs','ContentPane',6,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID output
END TRY  
BEGIN CATCH  
	-- Execute error retrieval routine.  
END CATCH;
END
GO

UPDATE rb_Modules SET [TabID] = 280 where TabID = 281
GO

BEGIN TRY
	DELETE FROM rb_Modules WHERE tabid in (SELECT pageId FROM rb_pages WHERE ParentPageID = 280)
END TRY  
BEGIN CATCH  
	-- Execute error retrieval routine.  
END CATCH;
GO

DELETE FROM rb_Pages WHERE ParentPageID = 280
GO


IF NOT EXISTS(SELECT * FROM rb_GeneralModuleDefinitions WHERE GeneralModDefID='1CDF009A-60E9-4CE0-997B-E632D3F0D996')
BEGIN
BEGIN TRY
	
	INSERT INTO [dbo].[rb_GeneralModuleDefinitions]
         ([GeneralModDefID]
         ,[FriendlyName]
         ,[DesktopSrc]
         ,[MobileSrc]
         ,[AssemblyName]
         ,[ClassName]
         ,[Admin]
         ,[Searchable])
   VALUES
         ('1CDF009A-60E9-4CE0-997B-E632D3F0D996'
         ,'Admin - Module Instances'
         ,'/DesktopModules/CoreModules/AdminModuleInstances/AdminModuleInstances.ascx'
         ,''
         ,'Appleseed.DLL'
         ,'Appleseed.DesktopModules.CoreModules.AdminModuleInstances.AdminModuleInstances'
         ,1
         ,0)
		 
END TRY  
BEGIN CATCH  
	-- Execute error retrieval routine.  
END CATCH;


END
GO

/*add new module - Module Instances changes */
IF NOT EXISTS(SELECT * FROM rb_ModuleDefinitions WHERE GeneralModDefID='1CDF009A-60E9-4CE0-997B-E632D3F0D996')
BEGIN

BEGIN TRY
INSERT INTO [dbo].[rb_ModuleDefinitions]
         ([PortalID]
         ,[GeneralModDefID])
   VALUES
         (0
         ,'1CDF009A-60E9-4CE0-997B-E632D3F0D996')
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
END CATCH;
END
GO

DECLARE @ModuleID1 INT

Declare @MfID int

Select @MfID = ModuleDefID from rb_ModuleDefinitions where [GeneralModDefID] = '1CDF009A-60E9-4CE0-997B-E632D3F0D996'

IF NOT EXISTS(SELECT * FROM rb_Modules WHERE TabId =180 AND ModuleDefId = @MfID)
BEGIN
BEGIN TRY
EXEC rb_addModule 180,1,'Module Instances', 'ContentPane',@MfID,0,'Admins', 'Admins;','Admins;','Admins;','Admins;', 'Admins;','Admins;',0,NULL,0,0,0 ,@ModuleID1 output
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
END CATCH;

END

IF NOT EXISTS(SELECT * FROM rb_Modules WHERE TabId =180 AND ModuleDefId = 1)
BEGIN
BEGIN TRY
EXEC rb_addModule 180,2,'Add Module Control','ContentPane',1,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID1 output
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
END CATCH;

END

IF NOT EXISTS(SELECT * FROM rb_Modules WHERE TabId =180 AND ModuleDefId = 9)
BEGIN
BEGIN TRY
EXEC rb_addModule 180,3,'Module Definitions','ContentPane',9,0,'Admins','Admins;','Admins;','Admins;','Admins;','Admins;','Admins;',0,NULL,0,0,0,@ModuleID1 output
END TRY  
BEGIN CATCH  
    -- Execute error retrieval routine.  
END CATCH;
END
GO
/*change module type ordering by a-z*/
ALTER PROCEDURE [dbo].[rb_GetCurrentModuleDefinitions]
(
    @PortalID  int
)
AS
BEGIN
/* returns all module definitions for the specified portal */
SELECT  
    rb_GeneralModuleDefinitions.FriendlyName,
    rb_GeneralModuleDefinitions.DesktopSrc,
    rb_GeneralModuleDefinitions.MobileSrc,
    rb_GeneralModuleDefinitions.Admin,
    rb_ModuleDefinitions.ModuleDefID
FROM
    rb_ModuleDefinitions
INNER JOIN
    rb_GeneralModuleDefinitions ON rb_ModuleDefinitions.GeneralModDefID = rb_GeneralModuleDefinitions.GeneralModDefID
WHERE   
    rb_ModuleDefinitions.PortalID = @PortalID
ORDER BY
rb_GeneralModuleDefinitions.FriendlyName
END
GO
/* returns all module definitions for the specified portal */
ALTER PROCEDURE [dbo].[rb_GetModuleDefinitions]
AS
BEGIN
SELECT     GeneralModDefID, FriendlyName, DesktopSrc, MobileSrc
FROM         rb_GeneralModuleDefinitions
ORDER BY FriendlyName
END