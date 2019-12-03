Create Or Alter Procedure usp_AddColumn @TableParam varchar(100), @ColumnParam varchar(100), @TypeParam varchar(100) As
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
set @query = N'ALTER TABLE ' + @TableParam + N' ADD ' + @ColumnParam + N' ' + + @TypeParam;

declare @undoQuery nvarchar(1000);
set @undoQuery = N'usp_RemoveColumn @TableParam = ''' + @TableParam + N''', @ColumnParam = ''' + @ColumnParam + N'''';

IF @flag = 0
Insert Into Versions(Number, Do, Undo)
Values(@versionNumber, @query, @undoQuery);

exec sp_executesql @query;

End
Go

Exec usp_AddColumn @TableParam = 'Doctors', @ColumnParam = 'deletelater', @TypeParam = 'varchar(50)';