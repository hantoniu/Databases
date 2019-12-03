Create Or Alter Procedure usp_RemoveColumn @TableParam varchar(100), @ColumnParam varchar(100) As
Begin

declare @oldType nvarchar(100);
declare @versionNumber int;
declare @flag bit;

SELECT @oldType = DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableParam AND COLUMN_NAME = @ColumnParam
IF @oldType = 'varchar' OR @oldType = 'char' OR @oldType = 'nvarchar' OR @oldType = 'binary'
	set @oldType = @oldType + '(50)';

Select @flag = ChangingVersions From CurrentVersion;

Select @versionNumber = Count(*) From Versions;
Set @versionNumber = @versionNumber + 1;

IF @flag = 0
Update CurrentVersion
Set Number = @versionNumber;

declare @query nvarchar(1000);
set @query = N'ALTER TABLE ' + @TableParam + N' DROP COLUMN ' + @ColumnParam;

declare @undoQuery nvarchar(1000);
set @undoQuery = N'usp_AddColumn @TableParam = ''' + @TableParam + N''', @ColumnParam = ''' + @ColumnParam + N''',' +
	N'@TypeParam = ''' + @oldType + N'''';

IF @flag = 0
Insert Into Versions(Number, Do, Undo)
Values(@versionNumber, @query, @undoQuery);

exec sp_executesql @query;

End
Go

Exec usp_RemoveColumn @TableParam = 'Doctors', @ColumnParam = 'deletelater';