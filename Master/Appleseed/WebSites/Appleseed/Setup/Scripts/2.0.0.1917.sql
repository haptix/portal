IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'U' AND name = 'rb_userPagePermission')
BEGIN
Create Table dbo.rb_userPagePermission
(
	Id int identity PRIMARY KEY,
	PageId int,
	UserId uniqueidentifier,
	Permission int
)
END
GO

