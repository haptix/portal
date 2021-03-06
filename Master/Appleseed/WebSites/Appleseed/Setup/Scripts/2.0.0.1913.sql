-- Remove of Add Tab Module
DELETE FROM [rb_GeneralModuleDefinitions] WHERE [GeneralModDefID] in ('875254B7-2471-491F-BAF8-4AFC261CC224','EF9B29C5-E481-49A6-9383-8ED3AB42DDA0','B29CB86B-AEA1-4E94-8B77-B4E4239258B0',
   '2502DB18-B580-4F90-8CB4-C15E6E53100B','A1E37A0F-4EE9-4B83-9482-43466FC21E08','EDDD32E0-2135-4276-9157-3478995CCCD2','345EB057-F35F-4882-A3F1-38A504A6C382','8F74C9C4-543A-48FA-AB73-1C07D219899A')

   IF NOT EXISTS(SELECT * FROM rb_GeneralModuleDefinitions where GeneralModDefID ='36B5D949-9BA6-45E1-A8FD-C34AF67E2CDD')
BEGIN
	INSERT INTO [rb_GeneralModuleDefinitions]
				([GeneralModDefID],[FriendlyName],[DesktopSrc],[MobileSrc],[AssemblyName],[ClassName],[Admin],[Searchable])
		 VALUES
			   ('36B5D949-9BA6-45E1-A8FD-C34AF67E2CDD' ,'Admin - Member Invites', 'Area/ASMemberInvite/MemberInvite/Index' ,'' ,'Appleseed.DLL', 'Appleseed.DesktopModules.CoreModules.Admin.AdminLeftMenu',1,0)
END

-- Add of Member Invite Module

IF NOT EXISTS(SELECT * FROM rb_ModuleDefinitions where GeneralModDefID ='36B5D949-9BA6-45E1-A8FD-C34AF67E2CDD')
BEGIN
	INSERT INTO [rb_ModuleDefinitions] ([PortalID],[GeneralModDefID])VALUES (0,'36B5D949-9BA6-45E1-A8FD-C34AF67E2CDD')
END
