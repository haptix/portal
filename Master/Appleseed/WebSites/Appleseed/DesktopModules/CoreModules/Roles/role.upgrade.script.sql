CREATE TABLE [dbo].[aspnet_Permission](
	[PermissionID] [int] NOT NULL,
	[PermissionName] [varchar](100) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_aspnet_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_RolePermissions](
	[RoleID] [uniqueidentifier] NOT NULL,
	[PermissionID] [int] NOT NULL,
 CONSTRAINT [PK_aspnet_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ca8dee6b-0b81-4462-af3b-6a22b36a0304', N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', N'Builder', N'builder', NULL)
GO
INSERT INTO [dbo].[aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'ca8dee6b-0b81-4462-af3b-6a22b36a0304', N'1b24473d-71a2-40ab-a6c9-f84971525014', N'Portal Administration', N'portal administration', NULL)
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (1, N'Portal Administration', N'includes site settings and meta settings, portal settings')
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (2, N'Portal Theme & Layout Administration ', NULL)
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (3, N'Page List ', NULL)
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (4, N'Page Creation', NULL)
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (5, N'Page Editing', N'includes edit this page, page name , set friendly url')
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (6, N'Page Deletion', NULL)
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (7, N'Module Creation', NULL)
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (8, N'Module Deletion', NULL)
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (9, N'Module Editing', N'all other modules except for HTML/Content Module')
GO
INSERT [dbo].[aspnet_Permission] ([PermissionID], [PermissionName], [Description]) VALUES (10, N'Module (HTML) Content Editing', N'new, for specially being able to edit an html module.  Not editing other modules.  Editing other modules falls under Module Editing')
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 3)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 4)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 5)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 6)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 7)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 8)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 9)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'9b0eb3ff-c772-49f0-a91c-792332ba4b94', 10)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'1b24473d-71a2-40ab-a6c9-f84971525014', 1)
GO
INSERT [dbo].[aspnet_RolePermissions] ([RoleID], [PermissionID]) VALUES (N'1b24473d-71a2-40ab-a6c9-f84971525014', 2)
GO