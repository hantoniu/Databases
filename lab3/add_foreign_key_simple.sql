Create Or Alter Procedure usp_AddForeignKeySimple  As
Begin

declare @versionNumber int;
declare @flag bit;

Select @flag = ChangingVersions From CurrentVersion;

Select @versionNumber = Count(*) From Versions;
Set @versionNumber = @versionNumber + 1;

IF @flag = 0
Update CurrentVersion
Set Number = @versionNumber;

declare @query nvarchar(1000);
set @query = N'ALTER TABLE ' + N' Nurses ' + N' ADD CONSTRAINT FK_Nurses FOREIGN KEY (' + N'doctorSupervisor' +
	N') REFERENCES ' + N'Doctors' + N'(' + N'did' + N')';

declare @undoQuery nvarchar(1000);
set @undoQuery = N'usp_RemoveForeignKeySimple';

IF @flag = 0
Insert Into Versions(Number, Do, Undo)
Values(@versionNumber, @query, @undoQuery);

exec sp_executesql @query;

End
Go

Exec usp_AddForeignKeySimple;