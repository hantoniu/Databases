Create Or Alter Procedure usp_RemoveTable As
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
set @query = N'Drop Table Ambulances';

declare @undoQuery nvarchar(1000);
set @undoQuery = N'usp_AddTable';

IF @flag = 0
Insert Into Versions(Number, Do, Undo)
Values(@versionNumber, @query, @undoQuery);

exec sp_executesql @query;

End
Go

Exec usp_RemoveTable;