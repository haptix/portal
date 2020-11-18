/*Add new module detail*/
EXEC	[dbo].[rb_AddGeneralModuleDefinitions]
		@GeneralModDefID = 'E6339F54-40BC-4510-85F8-FE2072E595CD',
		@FriendlyName = N'Admin - Airtable Viewer',
		@DesktopSrc = N'DesktopModules/CoreModules/Airtable/AirtableViewer.ascx',
		@MobileSrc = N'',
		@AssemblyName = N'Applesseed.Dll',
		@ClassName = N'Appleseed.DesktopModules.CoreModules.Airtable.AirtableViewer',
		@Admin = 1,
		@Searchable = 1

GO

IF NOT EXISTS (SELECT * FROM [dbo].[rb_ModuleDefinitions] WHERE PortalID = 0 AND GeneralModDefID = 'E6339F54-40BC-4510-85F8-FE2072E595CD')
BEGIN	
	insert into [dbo].[rb_ModuleDefinitions] (PortalID, GeneralModDefID) values (0,'E6339F54-40BC-4510-85F8-FE2072E595CD');
END
GO
